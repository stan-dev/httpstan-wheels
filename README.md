httpstan-wheels
===============

We use [multibuild](https://github.com/matthew-brett/multibuild) to build wheels.

No manual action is required to make a release to PyPI.
GitHub Actions tries to release previously-unreleased versions of `httpstan` twice a week.

## Notes

### Differences from the standard ``multibuild`` instructions

- `BUILD_COMMIT` is automatically set to the most recent tagged version of `httpstan`. See `.github/workflows/wheels.yml`.
- `MB_PYTHON_OSX_VER=10.9` is set in `.github/workflows/wheels.yml`.
- To avoid building universal wheels on macos, `ARCHFLAGS` is set to `-arch x86_64` in `.github/workflows/wheels.yml`. Setting `ARCHFLAGS` on macos influences what Python uses as `CFLAGS`. The httpstan `Makefile` gets `CFLAGS` from Python and uses them when compiling `httpstan/stan_services.cpp`.
