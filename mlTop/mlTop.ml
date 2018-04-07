(*
 * mlTop.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * To try it:
 *    polyc -o mlTop mlTop.ml && ./mlTop *
 * or, better:
 *    make test
 *
 *)

use "forEachLines.ml";

(*
 * function showCPUs
 * parameters
 *    NONE
 * return
 *    unit and prints the CPU models
 *)
fun showCPUs () = let
   fun isSemiColon c = c = #":"
   fun showLine (line : string) = let
         val tokens = String.tokens isSemiColon line
       in
         if String.isPrefix "model name" line
         then print (List.last tokens)
         else ()
       end;
in
   forEachLines ("/proc/cpuinfo", showLine)
end;

fun main() =
   showCPUs()
