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
use "tools.ml";

(*
 * function showCPUs
 * parameters
 *    NONE
 * return
 *    unit and prints the CPU models
 *)
fun showCPUs () = let
   fun showLine (line : string) : unit = let
         val tokens = String.tokens isSemiColon line
       in
         if String.isPrefix "processor" line
         then print ("cpu " ^ (List.last tokens))
         else if String.isPrefix "model name" line
         then print (" " ^ (List.last tokens))
         else if String.isPrefix "cpu MHz" line
         then printLN (" running at " ^ (List.last tokens))
         else ()
       end;
in
   (
     (* Linux and kernel version *)
     forEachLines ("/proc/version_signature", printLN);
     (* for testing purpose *)
     forEachLines ("/proc/bad_file_name", printLN);
     (* show all cpu main  infos *)
     forEachLines ("/proc/cpuinfo", showLine)
   )
end;

fun main() =
   showCPUs()
