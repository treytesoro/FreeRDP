git clone --depth 1 --shallow-submodules --recurse-submodules -b v1.0.26 https://github.com/libusb/libusb-cmake.git
cmake -GNinja ^
    -B libusb-cmake-build ^
    -S libusb-cmake ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\libusb-install ^
    -DLIBUSB_BUILD_EXAMPLES=OFF ^
    -DLIBUSB_BUILD_TESTING=OFF ^
    -DLIBUSB_ENABLE_DEBUG_LOGGING=OFF ^
    -DLIBUSB_BUILD_SHARED_LIBS=ON
cmake --build libusb-cmake-build
cmake --install libusb-cmake-build