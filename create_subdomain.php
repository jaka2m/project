<?php
// Konfigurasi awal
$apiKey = 'bf7081f50b64cd2e21f03e0fac8f279660791';
$email = 'andestpao81@gmail.com';

// Daftar domain dan ID zona mereka (zone IDs)
$domains = [
    'bahula.filegear-sg.me' => '332fee4d870d0b55a8bcaaefc7116211',
    // Tambahkan lebih banyak domain & ID zona jika diperlukan
];

$subdomainName = $_POST['subdomain_name'];
$ipv4_address = $_POST['ipv4_address'];
$rootDomain = $_POST['root_domain'];
$zoneId = $domains[$rootDomain];

// Membuat subdomain baru dengan record A
$newSubdomain = $subdomainName.'.'.$rootDomain;

$data = array(
    'type' => 'A',
    'name' => $newSubdomain,
    'content' => $ipv4_address,
    'ttl' => 120,
    'proxied' => false
);

$url = "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'X-Auth-Key: '.$apiKey,
    'X-Auth-Email: '.$email,
    'Content-Type: application/json'
));

$result = curl_exec($ch);
curl_close($ch);

$response = json_decode($result, true);
header('Content-Type: application/json');

if ($response['success']) {
    echo json_encode([
        'success' => true,
        'record' => [
            'type' => $response['result']['type'],
            'name' => $response['result']['name'],
            'content' => $response['result']['content'],
            'ttl' => $response['result']['ttl'],
            'proxied' => $response['result']['proxied'],
            'created_on' => $response['result']['created_on']
        ]
    ]);
} else {
    echo json_encode(['success' => false]);
}
?>
