set path=%path%;%libspath%\SDL3-install
git clone --depth 1 --shallow-submodules --recurse-submodules -b release-3.2.2 https://github.com/libsdl-org/SDL_ttf.git SDL3_ttf
cmake -GNinja ^
    -B SDL3_ttf-build ^
    -S SDL3_ttf ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\SDL3TTF-install ^
    -DSDL2TTF_HARFBUZZ=ON ^
    -DSDL2TTF_FREETYPE=ON ^
    -DSDL2TTF_VENDORED=ON ^
    -DFT_DISABLE_ZLIB=OFF ^
    -DSDL2TTF_SAMPLES=OFF
cmake --build SDL3_ttf-build
cmake --install SDL3_ttf-build