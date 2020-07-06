#!/bin/sh
if [ ! -e swig.tar.gz ]; then
  curl -L https://sourceforge.net/projects/swig/files/swig/swig-4.0.2/swig-4.0.2.tar.gz/download --output swig.tar.gz && \
  mkdir swig && \
  tar -xvzf swig.tar.gz -C swig --strip-components 1 > /dev/null
fi
PYBIN=/opt/python/cp37-cp37m/bin
pushd swig
./configure --disable-alllang --enable-python3=$PYBIN/python && \
make -j2 && \
make install > /dev/null
popd
