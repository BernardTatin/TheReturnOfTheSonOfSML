(*
 * hello.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * To try it:
 *    polyc -o hello hello.ml && ./hello *
 *)

open Posix;

use "stdArgs.ml";

fun main() = 
   let
      fun processArgs []      =
         (print "Hello, brave new world!\n";
          OS.Process.exit OS.Process.success)
       |  processArgs(x::tail) = (
            print ("Hello " ^ x ^ "\n"); 
            processArgs tail
         )
   in 
      ( stdArgs (CommandLine.arguments());
        processArgs (CommandLine.arguments()))
   end

