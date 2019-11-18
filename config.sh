function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    if [ -n "$IS_OSX" ]; then
        export CC=clang
        export CXX=clang++
    fi
    echo "in pre_build"
    SRC_DIR=httpstan
    pip install -r $SRC_DIR/build-requirements.txt
    pip install -r $SRC_DIR/requirements.txt
    pip install grpcio-tools
    # FIXME: does pre_build get executed twice? make reports "nothing to do"
    make -C $SRC_DIR
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import httpstan'
    # empty directory is inside the repo directory (see ``install_run``)
    SRC_DIR=httpstan
    pip install -r ../$SRC_DIR/test-requirements.txt
    python -m pytest ../$SRC_DIR/tests
}
