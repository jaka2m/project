import requests
import csv
import os
from concurrent.futures import ThreadPoolExecutor, as_completed

def check_proxy(row, api_url_template, output_file):
    ip, port = row[0].strip(), row[1].strip()
    # Sesuaikan format URL dengan ip dan port dalam satu string
    api_url = api_url_template.format(ip=f"{ip}:{port}")
    try:
        response = requests.get(api_url, timeout=60)
        response.raise_for_status()
        data = response.json()

        # Ambil data tambahan dari JSON API
        status = data.get("status", "").strip().lower()
        country_code = data.get("countryCode", "Unknown")
        isp = data.get("isp", "Unknown")

        if status == "active":
            print(f"{ip}:{port} is ALIVE")
            # Tulis data lengkap ke alive.txt
            with open(output_file, "a", newline="") as f:
                writer = csv.writer(f)
                writer.writerow([ip, port, country_code, isp])
            return None  # Tidak ada error
        else:
            print(f"{ip}:{port} is DEAD")
            return None
    except requests.exceptions.RequestException as e:
        error_message = f"Error checking {ip}:{port}: {e}"
        print(error_message)
        return error_message
    except ValueError as ve:
        error_message = f"Error parsing JSON for {ip}:{port}: {ve}"
        print(error_message)
        return error_message

def main():
    input_file = os.getenv('IP_FILE', 'output.txt')
    output_file = 'output.txt'
    error_file = 'error.txt'
    
    api_url_template = os.getenv('API_URL', 'https://check.installer.us.kg/check?ip={ip}')

    error_logs = []

    try:
        with open(input_file, "r") as f:
            reader = csv.reader(f)
            rows = list(reader)
    except FileNotFoundError:
        print(f"File {input_file} tidak ditemukan.")
        return

    # Hapus isi file alive.txt sebelumnya (jika ada)
    with open(output_file, "w") as f:
        pass

    with ThreadPoolExecutor(max_workers=50) as executor:
        futures = {executor.submit(check_proxy, row, api_url_template, output_file): row for row in rows if len(row) >= 2}

        for future in as_completed(futures):
            error = future.result()
            if error:
                error_logs.append(error)

    if error_logs:
        try:
            with open(error_file, "w") as f:
                for error in error_logs:
                    f.write(error + "\n")
            print(f"Beberapa error telah dicatat di {error_file}.")
        except Exception as e:
            print(f"Error menulis ke {error_file}: {e}")

if __name__ == "__main__":
    main()
