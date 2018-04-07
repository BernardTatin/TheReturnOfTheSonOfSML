(*
 * fileOps.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *)


(*
 * function: getFileLines
 * parameters
 *    inFile : the name of the input file
 * Return
 *    the list of all lines of the input file
 *)
fun getFileLines (inFile : string) = let
   val inputHandle = TextIO.openIn inFile

   fun loop inputHandle =
      case TextIO.inputLine inputHandle of
         SOME line => line :: loop inputHandle
       | NONE      => []
in
   loop inputHandle before TextIO.closeIn inputHandle
end ;

(*
 * function getProcFileName
 * parameters
 *    procfile : the name of the input file, as cpuinfo, meminfo
 * return
 *    the full pathname of the file as /proc/cpuinfo
 * note
 *    not very useful in the current state
 *)
fun getProcFileName (procFile : string) = ("/proc/" ^ procFile)

(*
 * function getProcFileLines
 * parameters
 *    procfile : the name of the input file, as cpuinfo, meminfo
 * return
 *    the list of all lines of the input file
 * note
 *    not very useful in the current state
 *)
fun getProcFileLines (procFile : string) = getFileLines (getProcFileName procFile)

(*
 * function showRawProcFile
 * parameters
 *    label : a label printed before the file content,
 *    procFile : a file from /proc as cpuinfo
 * return
 *    unit and prints the lines on stdout
 *)
fun showRawProcFile (label : string, procFile : string) = let
   val lines = getProcFileLines(procFile)

   fun loop [] = print "\n"
    |  loop (line::tail) = (print ("  " ^ line); loop tail)

in
   (print (label ^ ":\n"); loop lines)
end ;
