@ECHO OFF
@ECHO Building OpenSSL for Windows 64-bit
@ECHO If failing, make sure synology or dropbox/etc... is not locking files in this directory

@REM Guides specifies -b openssl-3.1.1 but we should try to keep this up to date
git clone https://github.com/openssl/openssl.git

cd openssl
perl .\Configure VC-WIN64A --prefix="%libspath%\openssl-install"
nmake
@REM nmake test
nmake install

cd ..