@echo OFF

SET workingdir=%CD%


@REM This shouldn't be needed but just in case some projects search the environment path for dependencies
@REM set path=%path%;C:\libs\cJSON-install;C:\libs\SDL2-install;C:\libs\SDL2IMAGE-install;C:\libs\uriparser-install;C:\libs\zlib-install;C:\libs\SDL2TTF-install;C:\libs\OPENSSL-install;C:\libs\libusb-install

@REM Should already be cloned down from this fork so skipping git clone step
@REM git clone --depth 1 https://github.com/freerdp/freerdp.git

cd | find "\winscripts"
if %ERRORLEVEL% NEQ 0 (
    echo This script must be run from within the winscripts directory.
    exit /b 1
)

SET winscripts=%CD%

@REM Goto root freerdp folder and save path
cd ..
SET freerdppath=%CD%
@REM Run from parent of freerdp folder
cd ..

cmake -GNinja ^
    -B %freerdppath%\freerdp-build ^
    -S freerdp ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%freerdppath%\freerdpinstall ^
    -DWITH_SERVER=OFF ^
    -DWITH_SAMPLE=ON ^
    -DWITH_PLATFORM_SERVER=OFF ^
    -DUSE_UNWIND=OFF ^
    -DWITH_SWSCALE=OFF ^
    -DWITH_FFMPEG=OFF ^
    -DWITH_WEBVIEW=OFF ^
    -DBUILD_SHARED_LIBS=ON ^
    -DWITH_SHADOW_SUBSYSTEM=OFF ^
    -DWITH_CLIENT_INTERFACE=ON ^
    -DWITH_CLIENT_SDL=ON ^
    -DCHANNEL_URBDRC=OFF ^
    -DWITH_DEBUG_KBD=ON ^
    -DCMAKE_CXX_FLAGS="-I%libspath%\SDL2TTF-install\include\SDL2" ^
    -DCMAKE_PREFIX_PATH=%libspath%\cJSON-install;%libspath%\SDL2TTF-install;%libspath%\SDL2-install;%libspath%\SDL2IMAGE-install;%libspath%\uriparser-install;%libspath%\zlib-install;%libspath%\OPENSSL-install;%libspath%\libusb-install

cmake --build %freerdppath%\freerdp-build
cmake --install %freerdppath%\freerdp-build

@REM Copying required DLLs to the install bin folder
copy %libspath%\cJSON-install\bin\cjson.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\SDL2-install\bin\SDL2.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\SDL2IMAGE-install\bin\SDL2_image.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\SDL2TTF-install\bin\SDL2_ttf.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\uriparser-install\bin\uriparser.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\uriparser-install\bin\uriparse.exe %freerdppath%\freerdpinstall\bin
copy %libspath%\zlib-install\bin\zlib.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\OPENSSL-install\bin\*.dll %freerdppath%\freerdpinstall\bin
@REM copy C:\libs\OPENSSL-install\bin\libssl-3-x64.dll %freerdppath%\freerdpinstall\bin
copy %libspath%\libusb-install\bin\libusb-1.0.dll %freerdppath%\freerdpinstall\bin

cd %winscripts%