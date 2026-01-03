git clone --depth 1 -b uriparser-0.9.7 https://github.com/uriparser/uriparser.git
cmake -GNinja ^
    -B uriparser-build ^
    -S uriparser ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\uriparser-install ^
    -DURIPARSER_BUILD_DOCS=OFF ^
    -DURIPARSER_BUILD_TESTS=OFF ^
    -DBUILD_SHARED_LIBS=ON
cmake --build uriparser-build
cmake --install uriparser-build