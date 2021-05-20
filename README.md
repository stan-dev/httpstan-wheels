httpstan-wheels
===============

We use [multibuild](https://github.com/matthew-brett/multibuild) to build wheels.

## Notes

*Differences from the standard ``multibuild`` instructions are noted in this section.*

``MACOSX_DEPLOYMENT_TARGET`` is currently set to ``10.9``. Multibuild gives the variable
a different default value. This environment variable is set in `.github/workflows/wheels.yml`.
