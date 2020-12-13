httpstan-wheels
===============

We use [multibuild](https://github.com/matthew-brett/multibuild) to build wheels.

## Notes

*Differences from the standard ``multibuild`` instructions are noted in this section.*

Stan version 2.19 and higher requires C++14. Set ``MACOSX_DEPLOYMENT_TARGET=10.9``
so that ``clang`` will use ``libc++`` for the C++ standard library. This environment
variable is set in `.github/workflows/wheels.yml`.
