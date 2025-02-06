function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    if [ -n "$IS_OSX" ]; then
        export CC=clang
        export CXX=clang++
    fi
    echo "in pre_build"
    SRC_DIR=httpstan
    # these steps mirror those in httpstan
    python -m pip install "poetry~=1.8"
    make -C $SRC_DIR
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import httpstan'
    # empty directory is inside the repo directory (see ``install_run``)
    SRC_DIR=httpstan
    # remove shared libraries built in-tree. Ensure shared libs in wheel are used
    rm -rf ../$SRC_DIR/httpstan/lib
    python -m pytest -s -v -x ../$SRC_DIR/tests
}

function poetry_wheel_cmd {
    echo "In poetry_wheel_cmd"
    local abs_wheelhouse=$1
    python -m poetry build -v
    cp dist/*.whl $abs_wheelhouse
}

function build_poetry_wheel {
    build_wheel_cmd "poetry_wheel_cmd" $@
}

function build_wheel {
    build_poetry_wheel $@
}
