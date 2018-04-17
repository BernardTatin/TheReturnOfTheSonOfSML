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

(* we can use printLN without prefix Tools. *)
open Tools

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
        then printLN (" running at " ^ (List.last tokens))
        else ()
      end;

  fun showCPUFreq (line : string) : unit = let
        val tokens = String.tokens StringTools.isSemiColon line
      in
        if String.isPrefix "cpu MHz" line
        then print (List.last tokens)
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
    val countValue = 0
    fun actionForCPU () =
    (
      ForEachLines.forEachLines ("/proc/cpuinfo", showCPUFreq);
      printLN ""
    )
    val count = Counters.makeTimer (countValue, 1, actionForCPU)
  in
    count()
  end;

in
    (
      printTitle ();
      (* Linux and kernel version *)
      ForEachLines.forEachLines ("/proc/version_signature", printLN);
      printLN "";
      ForEachLines.forEachLines ("/proc/swaps", showSwapUse);
      printLN "";
      (* show all cpu main  infos *)
      ForEachLines.forEachLines ("/proc/cpuinfo", showCPULine);
      printLN "";
      printLN "";

      showCPUInfos ()
    )
end;
