git clone --depth 1 -b v1.7.16 https://github.com/DaveGamble/cJSON.git
cmake -GNinja ^
    -B cJSON-build ^
    -S cJSON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON ^
    -DCMAKE_INSTALL_PREFIX=%libspath%\cJSON-install ^
    -DENABLE_CJSON_TEST=OFF ^
    -DBUILD_SHARED_AND_STATIC_LIBS=ON 
cmake --build cJSON-build
cmake --install cJSON-build