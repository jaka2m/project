import requests
import csv
import os
from concurrent.futures import ThreadPoolExecutor

def check_proxy(row, api_url_template, output_file, error_file):
    ip, port = row[0].strip(), row[1].strip()
    api_url = api_url_template.format(ip=ip, port=port)
    try:
        response = requests.get(api_url, timeout=60)
        response.raise_for_status()
        data = response.json()

        # Parsing status dari API
        status = data.get("status", "").strip().upper() == "ACTIVE"

        if status:
            print(f"{ip}:{port} is ALIVE")
            with open(output_file, "a", newline="") as f:
                writer = csv.writer(f)
                writer.writerow(row)
        else:
            print(f"{ip}:{port} is DEAD")
    except requests.exceptions.RequestException as e:
        error_message = f"Error checking {ip}:{port}: {e}"
        print(error_message)
        with open(error_file, "a") as f:
            f.write(error_message + "\n")
    except ValueError as ve:
        error_message = f"Error parsing JSON for {ip}:{port}: {ve}"
        print(error_message)
        with open(error_file, "a") as f:
            f.write(error_message + "\n")

def main():
    input_file = os.getenv('IP_FILE', './cek/output.txt')
    output_file = './cek/output.txt'
    error_file = './cek/error.txt'
    api_url_template = os.getenv('API_URL', 'https://check.installer.us.kg/check?ip={ip}:{port}')

    # Pastikan file output dan error kosong sebelum dimulai
    open(output_file, "w").close()
    open(error_file, "w").close()

    try:
        with open(input_file, "r") as f:
            reader = csv.reader(f)
            rows = list(reader)
    except FileNotFoundError:
        print(f"File {input_file} tidak ditemukan.")
        return

    with ThreadPoolExecutor(max_workers=50) as executor:
        for row in rows:
            if len(row) >= 2:
                executor.submit(check_proxy, row, api_url_template, output_file, error_file)

if __name__ == "__main__":
    main()
