httpstan-wheels
===============

We use [multibuild](https://github.com/matthew-brett/multibuild) to build wheels.

No manual action is required to make a release to PyPI.
GitHub Actions tries to release previously-unreleased versions of `httpstan` twice a week.

## Notes

### Differences from the standard ``multibuild`` instructions

- `BUILD_COMMIT` is automatically set to the most recent tagged version of `httpstan`. See `.github/workflows/wheels.yml`.
- ``MACOSX_DEPLOYMENT_TARGET`` is currently set to ``10.9``. Multibuild gives the variable
  a different default value. This environment variable is set in `.github/workflows/wheels.yml`.
