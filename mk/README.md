# how I manage my projects

All the projects are managed by a `Makefile` which contains a few lines like these:

```makefile
PROJECT = hello
DEPS = stdArgs.ml
TEST_ARGS = Bernard Christine Julien Alfred Sonia "Olga Makart"

include ../mk/main.mk
```

We define only three variables:

- `PROJECT`: the name of the project (the easy one),
- `DEPS`: all the dependancies, _i.e._ the source files needed to make the executable,
- `TEST_ARGS`: the arguments of the program for a first test.

We need a source file `$(PROJECT).ml` which contains the `main` function.

All the _engine_ is in `mk/main.mk` and running `make all` creates an executable: `$(PROJECT).exe`.

The project `hello` is a good example.