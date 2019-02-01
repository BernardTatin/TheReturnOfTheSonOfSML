(*
 * hello.sig
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 *)

signature HELLO =
sig
    (* val main : unit -> 'a
       val main : unit -> int *)
    val main : string * string list -> int
end;
