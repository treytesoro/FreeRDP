git clone --depth 1 --shallow-submodules --recurse-submodules -b release-2.8.1 https://github.com/libsdl-org/SDL_image.git
cmake -GNinja ^
    -B SDL_image-build ^
    -S SDL_image ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\SDL2IMAGE-install ^
    -DSDL2IMAGE_SAMPLES=OFF ^
    -DSDL2IMAGE_DEPS_SHARED=OFF
cmake --build SDL_image-build
cmake --install SDL_image-build