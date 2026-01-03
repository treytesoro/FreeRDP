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
@REM set libs=libs
@REM if EXIST "%libs%\" ( 
@REM     echo ERROR: Libs folder exists, please remove first.
@REM     cd %winscripts%
@REM     exit /b 1 
@REM ) ELSE (
@REM     mkdir "%libs%"
@REM     SET libspath=%freerdproot%\%libs%
@REM )


SET libspath=%freerdproot%\%libs%

CD %winscripts%
@REM Sets the path statement to destination folders for dependencies
@REM Some builds like sdl2ttf need this to find sdl2
set path=%path%;%libspath%\cJSON-install;%libspath%\SDL2-install;%libspath%\SDL2IMAGE-install;%libspath%\uriparser-install;%libspath%\zlib-install;%libspath%\SDL2TTF-install;%libspath%\OPENSSL-install;%libspath%\libusb-install

@REM I kept individual calls for easier debugging
@REM Build order only important for SDL2_ttf needing SDL2

@REM call openssl.cmd
@REM call zlib.cmd
@REM call uriparser.cmd
@REM call cjson.cmd
@REM call sdl2.cmd
@REM call sdl2ttf.cmd
@REM call sdl2image.cmd
@REM call libusb.cmd

call freerdp.cmd

@REM TODO: Return errorlevel checks from each call above and exit if any fail
@REM TODO: Clean up artifacts on completion or failure
@REM TODO: Redo all this in powershell because batch scripting sucks