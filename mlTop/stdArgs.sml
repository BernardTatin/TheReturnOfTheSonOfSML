(*
 * stdArgs.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *)


fun stdArgs [] = 
   print("\n")

| stdArgs("--help"::tail) =
   (print "mlTop [--help|--version]\n";
    print " --help: this text\n";
    print " --version: print version and exit\n";
    OS.Process.exit OS.Process.success)

| stdArgs("--version"::tail) =
   (print "mlTop version 1.0.1\n";
    OS.Process.exit OS.Process.success)

| stdArgs(_::tail) =
   stdArgs tail     
