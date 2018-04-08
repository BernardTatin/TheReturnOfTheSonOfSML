(*
 * forEachLines.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * this module contains the function forEachLines and all
 * the associated stuff if any
 *)

(*
 * function forEachLines
 * parameters
 *    fileName : the name of the file
 *    onLine : the function applied on each lines when they are loaded
 *        parameters
 *          line: the line to process
 *        return
 *          unit
 * return
 *    unit
 *)
fun forEachLines (fileName : string, onLine : string -> unit) : unit = let
   val inputHandle = TextIO.openIn fileName

   fun loop inputHandle =
      case TextIO.inputLine inputHandle of
         SOME line => (onLine (String.substring (line, 0, ((size line) - 1)));
                        loop inputHandle)
       | NONE      => ()
in
   loop inputHandle before TextIO.closeIn inputHandle
end ;
