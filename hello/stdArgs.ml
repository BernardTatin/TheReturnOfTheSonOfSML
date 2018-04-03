(*
 * stdArgs.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *)


open Posix;

fun stdArgs [] = 
   print("\n")
| stdArgs("--help"::tail) =
   (print "hello [--help|--version]\n";
    print " --help: this text\n";
    print " --version: print version and exit\n";
    OS.Process.exit OS.Process.success)
| stdArgs("--version"::tail) =
   (print "Hello version 0.0.0\n";
    OS.Process.exit OS.Process.success)
| stdArgs(_::tail) =
   stdArgs tail     

