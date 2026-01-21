git clone --depth 1 -b release-3.4.0 https://github.com/libsdl-org/SDL.git SDL3
cmake -GNinja ^
    -B SDL3-build ^
    -S SDL3 ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\SDL3-install ^
    -DSDL_TEST=OFF ^
    -DSDL_TESTS=OFF ^
    -DSDL_STATIC_PIC=ON 
cmake --build SDL3-build
cmake --install SDL3-build