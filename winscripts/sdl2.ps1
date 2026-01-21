git clone --depth 1 -b release-2.28.1 https://github.com/libsdl-org/SDL.git
cmake -GNinja `
    -B SDL-build `
    -S SDL `
    -DCMAKE_BUILD_TYPE=Release `
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON `
    "-DCMAKE_INSTALL_PREFIX=$env:libspath\SDL2-install" `
    -DSDL_TEST=OFF `
    -DSDL_TESTS=OFF `
    -DSDL_STATIC_PIC=ON 
cmake --build SDL-build
cmake --install SDL-build