# git clone --depth 1 https://github.com/freerdp/freerdp.git
cmake -GNinja `
    -B freerdp-build `
    -S freerdp `
    -DCMAKE_BUILD_TYPE=Release `
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON `
    -DCMAKE_INSTALL_PREFIX=C:\Users\trey\source\repos\FreeRDPsetup\freerdpinstall `
    -DWITH_SERVER=ON `
    -DWITH_SAMPLE=ON `
    -DWITH_PLATFORM_SERVER=OFF `
    -DUSE_UNWIND=OFF `
    -DWITH_SWSCALE=OFF `
    -DWITH_FFMPEG=OFF `
    -DWITH_WEBVIEW=OFF
# cmake --build freerdp-build
# cmake --install freerdp-build