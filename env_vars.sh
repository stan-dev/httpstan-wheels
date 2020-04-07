# See multibuild/README.rst
export MACOSX_DEPLOYMENT_TARGET=10.9
export CFLAGS="-static-libstdc++"
export CC=/usr/local/gcc-8.3.0/bin/gcc-8.3.0
export CXX=/usr/local/gcc-8.3.0/bin/g++-8.3.0
export LD_LIBRARY_PATH="/usr/local/gcc-8.3.0/lib64/:${LD_LIBRARY_PATH}"
