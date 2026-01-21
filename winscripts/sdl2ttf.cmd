set path=%path%;%libspath%\SDL2-install
git clone --depth 1 --shallow-submodules --recurse-submodules -b release-2.20.2 https://github.com/libsdl-org/SDL_ttf.git
cmake -GNinja ^
    -B SDL_ttf-build ^
    -S SDL_ttf ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\SDL2TTF-install ^
    -DSDL2TTF_HARFBUZZ=ON ^
    -DSDL2TTF_FREETYPE=ON ^
    -DSDL2TTF_VENDORED=ON ^
    -DFT_DISABLE_ZLIB=OFF ^
    -DSDL2TTF_SAMPLES=OFF
cmake --build SDL_ttf-build
cmake --install SDL_ttf-build