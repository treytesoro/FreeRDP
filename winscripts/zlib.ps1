
git clone --depth 1 -b v1.3 https://github.com/madler/zlib.git
cmake -GNinja `
    -B zlib-build `
    -S zlib `
    "-DCMAKE_BUILD_TYPE=Release" `
    "-DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON" `
    "-DCMAKE_INSTALL_PREFIX=$env:libspath\zlib-install" `
    "-DLIBRESSL_APPS=OFF" `
    "-DLIBRESSL_TESTS=OFF"

cmake --build zlib-build
cmake --install zlib-build