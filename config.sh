function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    if [ -n "$IS_OSX" ]; then
        export CC=clang
        export CXX=clang++
    fi
    echo "in pre_build"
    SRC_DIR=httpstan
    pip install "poetry<2,>=1.0" tox
    pip install "mypy-protobuf~=1.0"
    make -C $SRC_DIR
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import httpstan'
    # empty directory is inside the repo directory (see ``install_run``)
    SRC_DIR=httpstan
    python -m pytest ../$SRC_DIR/tests
}
