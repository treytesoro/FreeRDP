$currentlocation = (Get-Location).Path

if($currentlocation -notlike "*winscripts*") {
    Write-Host "Please run this script from the winscripts folder."
    exit 1
}



cmd.exe /c rmdir /s /q openssl 
cmd.exe /c rmdir /s /q zlib 
cmd.exe /c rmdir /s /q zlib-build 
cmd.exe /c rmdir /s /q uriparser 
cmd.exe /c rmdir /s /q uriparser-build 
cmd.exe /c rmdir /s /q cjson 
cmd.exe /c rmdir /s /q cJSON-build 
cmd.exe /c rmdir /s /q SDL 
cmd.exe /c rmdir /s /q SDL-build 
cmd.exe /c rmdir /s /q SDL_ttf 
cmd.exe /c rmdir /s /q SDL_ttf-build 
cmd.exe /c rmdir /s /q SDL_image 
cmd.exe /c rmdir /s /q SDL_image-build 
cmd.exe /c rmdir /s /q libusb-cmake 
cmd.exe /c rmdir /s /q libusb-cmake-build 


Write-Host "Setting up dependencies in $currentlocation"

Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.14.2/python-3.14.2-embed-amd64.zip" -OutFile "python.zip"
mkdir python
cd python
tar -xf ..\python.zip

# python314._pth edit to uncomment import site
Set-Content -Path ".\python314._pth" -Value @"
python314.zip
.

# Uncomment to run site.main() automatically
import site
"@
Invoke-WebRequest -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile "get-pip.py"
.\python.exe .\get-pip.py
# install meson and ninja
.\python.exe -m pip install meson ninja
cd ..

Invoke-WebRequest -Uri "https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_54201_64bit/strawberry-perl-5.42.0.1-64bit-portable.zip" -OutFile "strawberry-perl.zip"
mkdir strawberry-perl
cd strawberry-perl
tar -xf ..\strawberry-perl.zip
cd ..

$env:PATH += ";$currentlocation\python;${currentlocation}\strawberry-perl\perl\bin;${currentlocation}\strawberry-perl\perl\site\bin;${currentlocation}\strawberry-perl\c\bin"



cd ..
$freerdproot = (Get-Location).Path
$libs = "libs"
$libspath = Join-Path $freerdproot $libs
$env:libspath = $libspath
if (Test-Path $libspath) {
    Write-Host "ERROR: Libs folder exists, please remove first."
    # cd $currentlocation
    # exit 1
    Remove-Item -Recurse -Force $libspath
    New-Item -ItemType Directory -Path $libspath | Out-Null
} else {
    New-Item -ItemType Directory -Path $libspath | Out-Null
}

cd $currentlocation

$env:PATH += ";$libspath\cJSON-install;$libspath\SDL2-install;$libspath\SDL2IMAGE-install;$libspath\uriparser-install;$libspath\zlib-install;$libspath\SDL2TTF-install;$libspath\OPENSSL-install;$libspath\libusb-install"


& .\openssl.ps1
& .\zlib.ps1
& .\uriparser.ps1
& .\cjson.ps1
& .\sdl2.ps1
& .\sdl2ttf.ps1
& .\sdl2image.ps1
& .\libusb.ps1
& .\freerdp.ps1

cd $currentlocation

# cmd.exe /c rmdir /s /q openssl 
# cmd.exe /c rmdir /s /q zlib 
# cmd.exe /c rmdir /s /q zlib-build 
# cmd.exe /c rmdir /s /q uriparser 
# cmd.exe /c rmdir /s /q uriparser-build 
# cmd.exe /c rmdir /s /q cjson 
# cmd.exe /c rmdir /s /q cJSON-build 
# cmd.exe /c rmdir /s /q SDL 
# cmd.exe /c rmdir /s /q SDL-build 
# cmd.exe /c rmdir /s /q SDL_ttf 
# cmd.exe /c rmdir /s /q SDL_ttf-build 
# cmd.exe /c rmdir /s /q SDL_image 
# cmd.exe /c rmdir /s /q SDL_image-build 
# cmd.exe /c rmdir /s /q libusb-cmake 
# cmd.exe /c rmdir /s /q libusb-cmake-build 

# if (Test-Path $libspath) {
#     Remove-Item -Recurse -Force $libspath
# }

cd $currentlocation