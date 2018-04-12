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

use "../lib/tools.sml";
use "../lib/stringTools.sml";
use "../lib/forEachLines.sml";
use "../lib/counters.sml";

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
        val tokens = String.tokens StringTools.isSemiColon line
      in
        if String.isPrefix "processor" line
        then print ("cpu " ^ (List.last tokens))
        else if String.isPrefix "model name" line
        then print (" " ^ (List.last tokens))
        else if String.isPrefix "cpu MHz" line
        then Tools.printLN (" running at " ^ (List.last tokens))
        else ()
      end;

  fun showSwapUse (line : string) : unit =
      if String.isPrefix "Filename" line
      then ()
      else Tools.printLN line

    (*
     * function printTitle
     * parameters
     *    no
     * return
     *    unit with side effect of printing a title
     *)
    fun printTitle() =
        ( Tools.printLN "";
          Tools.printLN ("mlTop: a small top written in polyML");
          Tools.printLN "")
    fun showCPUInfos () = let
      val countValue = 5
      fun actionForCPU () =
      (
        ForEachLines.forEachLines ("/proc/cpuinfo", showCPULine);
        Tools.printLN ""
      )
      val count = Counters.makeTimer (countValue, 1, actionForCPU)
    in
      count()
    end;
in
    (
      printTitle ();
      (* Linux and kernel version *)
      ForEachLines.forEachLines ("/proc/version_signature", Tools.printLN);
      Tools.printLN "";
      ForEachLines.forEachLines ("/proc/swaps", showSwapUse);
      Tools.printLN "";
      (* show all cpu main  infos *)
      showCPUInfos ()
    )
end;
