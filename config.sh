# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    if [ -n "$IS_OSX" ]; then
        export CC=clang
        export CXX=clang++
    fi
    SRC_DIR=httpstan
    pip install -r $SRC_DIR/requirements.txt
    pip install grpcio-tools
    # FIXME: does pre_build get executed twice? make reports "nothing to do"
    make -C $SRC_DIR cython protos
}

function pip_opts {
    # Extra options for pip
    if [ -n "$IS_OSX" ]; then
        local suffix=scipy_installers
    else
        local suffix=manylinux
    fi
    echo "--only-binary matplotlib --find-links https://nipy.bic.berkeley.edu/$suffix"
}

function run_tests {
  # Runs tests on installed distribution from an empty directory (TODO)
    python --version
    pip install -r $SRC_DIR/test-requirements.txt
    python -m pytest tests
}

function bdist_wheel_cmd {
    # Builds wheel with bdist_wheel, puts into wheelhouse
    # NOTE: customized from multibuild default, adds --quiet
    echo in custom bdist_wheel_cmd
    local abs_wheelhouse=$1
    python setup.py bdist_wheel --quiet
    cp dist/*.whl $abs_wheelhouse
}

function build_wheel {
    # override default (pip wheel), use bdist_wheel directly
    echo 'in custom build_wheel'
    build_bdist_wheel $@
}
