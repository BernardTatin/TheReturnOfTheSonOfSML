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

fun getFileLines (inFile : string) =
   let
      val ins = TextIO.openIn inFile
      fun loop ins =
         case TextIO.inputLine ins of
            SOME line => line :: loop ins
          | NONE      => []
   in
      loop ins before TextIO.closeIn ins
   end ;

fun getProcFileLines (procFile : string) =
   getFileLines ("/proc/" ^ procFile)

fun showRawProcFile (label : string, procFile : string) =
   let 
      val lines = getProcFileLines(procFile)
      fun loop [] = print "\n"
       |  loop (line::tail) = 
          (print ("  " ^ line);
           loop tail)

   in
      (print label; loop lines)
   end ;

   
fun main() = 
   (showRawProcFile ("Linux version", "version");
    showRawProcFile ("CPU", "cpuinfo"))
