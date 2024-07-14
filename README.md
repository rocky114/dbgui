### build mysql driver plugin

```shell
/Users/huangdongcheng/Qt/6.7.1/macos/bin/qt-cmake -DQT_OSX_ARCHITECTURES=arm64 -DCMAKE_OSX_ARCHITECTURES=arm64 -G Ninja /Users/huangdongcheng/tech/qt671/qtbase/src/plugins/sqldrivers -DCMAKE_INSTALL_PREFIX=/Users/huangdongcheng/Qt/6.7.1/macos -DMySQL_INCLUDE_DIR="/opt/homebrew/opt/mysql@5.7/include/mysql" -DMySQL_LIBRARY="/opt/homebrew/opt/mysql@5.7/lib/libmysqlclient.dylib"

cmake --build .
cmake --install .
```
