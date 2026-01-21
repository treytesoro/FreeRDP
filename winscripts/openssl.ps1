Write-Host "Building and installing OpenSSL..."
Write-Host "If failing, make sure synology or drobox folder redirection is not interfering."

$currentlocation = (Get-Location).Path
write-host $env:libspath\OPENSSL-install
git clone https://github.com/openssl/openssl.git
Set-Location openssl
perl .\Configure VC-WIN64A no-tests --prefix="$env:libspath\OPENSSL-install"
nmake
nmake install

# New-Item "$env:libspath\OPENSSL-install\test.txt" -Force

Set-Location $currentlocation