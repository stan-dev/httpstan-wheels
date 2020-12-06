echo "::group::Install a venv"
  source multibuild/common_utils.sh
  source multibuild/travis_steps.sh
  before_install
echo "::endgroup::"

echo "::group::Build wheel"
  clean_code $REPO_DIR $BUILD_COMMIT
  build_wheel $REPO_DIR $PLAT
  ls -l "${GITHUB_WORKSPACE}/${WHEEL_SDIR}/"
echo "::endgroup::"

echo "::group::Test wheel"
  install_run $PLAT
echo "::endgroup::"
