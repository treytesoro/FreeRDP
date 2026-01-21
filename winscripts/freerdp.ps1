$workingdir = (Get-Location).Path
if($workingdir -notlike "*winscripts*") {
    Write-Host "Please run this script from the winscripts folder."
    exit 1
}

set-location ..
$freerdproot = (Get-Location).Path
write-host "FreeRDP root: $freerdproot"
$libspath = Join-Path $freerdproot "libs"
write-host "Libs path: $libspath"


set-location ..

cmake -GNinja `
    -B "$($freerdproot)\freerdp-build" `
    -S freerdp `
    -DCMAKE_BUILD_TYPE=Release `
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON `
    -DCMAKE_INSTALL_PREFIX="$($freerdproot)\freerdpinstall" `
    -DWITH_SERVER=OFF `
    -DWITH_SAMPLE=ON `
    -DWITH_PLATFORM_SERVER=OFF `
    -DUSE_UNWIND=OFF `
    -DWITH_SWSCALE=OFF `
    -DWITH_FFMPEG=OFF `
    -DWITH_WEBVIEW=OFF `
    -DBUILD_SHARED_LIBS=OFF `
    -DWITH_SHADOW_SUBSYSTEM=OFF `
    -DWITH_CLIENT_INTERFACE=ON `
    -DWITH_CLIENT=ON `
    -DWITH_CLIENT_SDL=OFF `
    -DWITH_CLIENT_SDL2=OFF `
    -DWITH_CLIENT_SDL3=OFF `
    -DCHANNEL_URBDRC=OFF `
    -DWITH_DEBUG_KBD=ON `
    -DCMAKE_CXX_FLAGS="-I$($libspath)\SDL2TTF-install\include\SDL2 -I$($libspath)\SDL3TTF-install\include\SDL2 -IC:\Users\trey\source\repos\FreeRDP\client\Windows\resource -IC:\Program Files (x86)\Windows Kits\10\Include\10.0.26100.0\um" `
    -DCMAKE_PREFIX_PATH="$($libspath)\cJSON-install;$($libspath)\SDL2TTF-install;$($libspath)\SDL2-install;$($libspath)\SDL2IMAGE-install;$($libspath)\uriparser-install;$($libspath)\zlib-install;$($libspath)\OPENSSL-install;$($libspath)\libusb-install;$($libspath)\SDL3-install;$($libspath)\SDL3TTF-install"


cmake --build "$($freerdproot)\freerdp-build" --config Release
cmake --install "$($freerdproot)\freerdp-build" --config Release

copy "$($libspath)\cJSON-install\bin\cjson.dll" "$($freerdproot)\freerdpinstall\bin"
copy "$($libspath)\SDL2-install\bin\SDL2.dll" "$($freerdproot)\freerdpinstall\bin"
copy "$($libspath)\SDL2IMAGE-install\bin\SDL2_image.dll" "$($freerdproot)\freerdpinstall\bin"
copy "$($libspath)\uriparser-install\bin\uriparser.dll" "$($freerdproot)\freerdpinstall\bin"
copy "$($libspath)\zlib-install\bin\zlib.dll" "$($freerdproot)\freerdpinstall\bin"
copy "$($libspath)\OPENSSL-install\bin\*.dll" "$($freerdproot)\freerdpinstall\bin"
copy "$($libspath)\libusb-install\bin\libusb-1.0.dll" "$($freerdproot)\freerdpinstall\bin"


set-location $workingdir