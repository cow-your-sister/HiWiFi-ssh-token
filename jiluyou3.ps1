param(
    [string]$local_token,
    [string]$uuid
)

# 如果没有传参，就交互式输入
if (-not $local_token) {
    $local_token = Read-Host "请输入 local_token"
}
if (-not $uuid) {
    $uuid = Read-Host "请输入 uuid"
}

# Base64 解码 local_token
$bytes = [System.Convert]::FromBase64String($local_token)
$parts = [System.Text.Encoding]::UTF8.GetString($bytes).Split(',')

$mac = $parts[0]
$t   = [int]$parts[2]

# 构造 message
$message = [System.Text.Encoding]::UTF8.GetBytes("$mac,ssh,$($t+1)")

# 生成 key (SHA1(uuid))
$sha1 = [System.Security.Cryptography.SHA1]::Create()
$key  = $sha1.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($uuid))

# 计算 HMAC-SHA1
$hmacsha1 = New-Object System.Security.Cryptography.HMACSHA1($key)
$hmac     = $hmacsha1.ComputeHash($message)

# 转 Base64
$cloud_token = [System.Convert]::ToBase64String($hmac)

Write-Output "cloud token: $cloud_token"
