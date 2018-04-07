(*
 * forEachLines.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
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
