Write-Host "Building and installing OpenSSL..."
Write-Host "If failing, make sure synology or drobox folder redirection is not interfering."

$currentlocation = (Get-Location).Path
write-host $env:libspath\OPENSSL-install
git clone https://github.com/openssl/openssl.git
Set-Location openssl
perl .\Configure VC-WIN64A no-tests --prefix="$env:libspath\OPENSSL-install"

Write-Output "Suppressing OpenSSL build output because it is huge. Build can take 30 minutes on slow runner"
nmake > ..\openssl_build_output.log 2>&1
nmake install > ..\openssl_install_output.log 2>&1

# New-Item "$env:libspath\OPENSSL-install\test.txt" -Force

Set-Location $currentlocation