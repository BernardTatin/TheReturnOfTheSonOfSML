# The Return Of The Son of SML

## presentation

I don't like Java and I really like functional programming so playing with ***Standard ML*** make me feel good.

Because I never used this language family (***SML/NJ***, ***PolyML***, ***MLTon***, ***OCaml***, ***F#***) in an every day job, I need a few evenings to recall what I knew. And every time I learn again ***SML***, I do it in a new way and always with a great pleasure.

### what you need

You need [**PolyML**](http://www.polyml.org), `make` and a good editor which can highlight ***SML*** syntax, like ***Vim***.

### what to touch

The project ***hello*** in the directory `hello` is the best place to start. Don't forget to read the [`Makefile`](mk/README.md) documentation.

### a table of content

1. the [`hello project`](hello/README.md), sample project with little experimentations,
2. the [`mlTop project`](mlTop/README.md), a little `top` inspired project,
3. [project management with `make`](mk/README.md).

## about compilers

### PolyML

It's a full system with an interpreter, very useful to test and debug, and a compiler.

### MLTon

***MLTon*** is just a compiler. Why using another compiler? It's one of the best way to be sure of syntax quality and an easy way to understand compiling errors. It's because each compiler have it's own error messages.

***MLTon*** is easy to use. Just create an `.mlb` file with the list of the files used by your project and run the compiler!
