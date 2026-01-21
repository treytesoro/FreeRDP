@ECHO OFF

cd | find "\winscripts"
if %ERRORLEVEL% NEQ 0 (
    echo This script must be run from within the winscripts directory.
    exit /b 1
)

SET winscripts=%CD%
echo Setting up dependencies in %winscripts%

@REM Move to parent directory to create libs folder
CD ..
SET freerdproot=%CD%
@REM Create libs folder if it doesn't exist
set libs=libs
if EXIST "%libs%\" ( 
    echo ERROR: Libs folder exists, please remove first.
    cd %winscripts%
    exit /b 1 
) ELSE (
    mkdir "%libs%"
    SET libspath=%freerdproot%\%libs%
)

@REM curl -o nasm-3.01-win64.zip https://www.nasm.us/pub/nasm/releasebuilds/3.01/win64/nasm-3.01-win64.zip
@REM curl -o python.zip https://www.python.org/ftp/python/3.14.2/python-3.14.2-embed-amd64.zip
@REM mkdir python
@REM tar -xf python.zip -C python
@REM https://bootstrap.pypa.io/get-pip.py (run with python.exe in python folder)

SET libspath=%freerdproot%\%libs%

CD %winscripts%
@REM Sets the path statement to destination folders for dependencies
@REM Some builds like sdl2ttf need this to find sdl2
set path=%path%;%libspath%\cJSON-install;%libspath%\SDL2-install;%libspath%\SDL2IMAGE-install;%libspath%\uriparser-install;%libspath%\zlib-install;%libspath%\SDL2TTF-install;%libspath%\OPENSSL-install;%libspath%\libusb-install

@REM I kept individual calls for easier debugging
@REM Build order only important for SDL2_ttf needing SDL2

call openssl.cmd
call zlib.cmd
call uriparser.cmd
call cjson.cmd
call sdl2.cmd
call sdl2ttf.cmd
call sdl2image.cmd
call libusb.cmd

call freerdp.cmd

@REM TODO: Return errorlevel checks from each call above and exit if any fail
@REM TODO: Clean up artifacts on completion or failure
@REM TODO: Redo all this in powershell because batch scripting sucks