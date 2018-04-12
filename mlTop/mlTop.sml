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

use "tools.sml";
use "stringTools.sml";
use "forEachLines.sml";
use "../lib/counter.sml";

fun main() = let
  (*
  * function showCPULine
  * parameters
  *    line
  * return
  *    unit with side effect of printing (or not)
  *    some infos about CPU
  * note
  *    used by a call of forEachLines
  *)
  fun showCPULine (line : string) : unit = let
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

  fun showSwapUse (line : string) : unit =
      if String.isPrefix "Filename" line
      then ()
      else printLN line

    (*
     * function printTitle
     * parameters
     *    no
     * return
     *    unit with side effect of printing a title
     *)
    fun printTitle() =
        ( printLN "";
          printLN ("mlTop: a small top written in polyML");
          printLN "")
    fun showCPUInfos () = let
      val countValue = 5
      fun actionForCPU () =
      (
        forEachLines ("/proc/cpuinfo", showCPULine);
        printLN ""
      )
      val count = makeTimer (countValue, 1, actionForCPU)
    in
      count()
    end;
in
    (
      printTitle ();
      (* Linux and kernel version *)
      forEachLines ("/proc/version_signature", printLN);
      printLN "";
      (* for testing purpose *)
      (* forEachLines ("/proc/bad_file_name", printLN); *)
      forEachLines ("/proc/swaps", showSwapUse);
      printLN "";
      (* show all cpu main  infos *)
      showCPUInfos ()
    )
end;
