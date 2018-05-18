# the `hello` project

The first stupid project, an unconventional *Hello world*! The best way to try it is by running `make`:

```sh
make test
```

If no error occurs, you will see something like:

```sh
polyc  -o hello.exe  hello.ml
./hello.exe  Bernard Christine \
	Julien Alfred Sonia "Olga Makart"

Hello Bernard
Hello Christine
Hello Julien
Hello Alfred
Hello Sonia
Hello Olga Makart
Hello, brave new world!
```

more tests can be done:

```sh
$ ./hello.exe Bernard Christine --help Julien Alfred
hello [--help|--version]
 --help: this text
 --version: print version and exit
$ ./hello.exe Bernard Christine --version Julien Alfred
Hello version 0.0.0
```

Options like `--help` and `--version` are managed by the function `stdArgs`.

For the `Makefile`, see this [README.md](../mk/README.md).
