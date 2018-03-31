(*
 * hello.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * To try it:
 *    polyc -o hello hello.ml && ./hello *
 *)


open String 

fun main() = 
   let
      fun processArgs []      = print "No more arguments available\n"
       |  processArgs(x::tail) = (
            print ("-> " ^ x ^ "\n"); 
            processArgs tail
         )
   in 
      processArgs (CommandLine.arguments())
   end
