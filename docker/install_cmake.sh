#!/bin/sh
if [ ! -e cmake.tar.gz ]; then
  curl -o cmake.tar.gz -L https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz && \
  mkdir cmake && \
  tar -xvzf cmake.tar.gz -C cmake --strip-components 1 > /dev/null
fi
pushd cmake
./bootstrap --parallel=2 -- -DCMAKE_USE_OPENSSL=OFF && \
make -j2 && \
make install > /dev/null
popd
