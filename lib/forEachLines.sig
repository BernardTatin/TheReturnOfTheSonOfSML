(*
 * forEachLines.smi
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * this module contains the function forEachLines and all
 * the associated stuff if any
 *)

 signature FOREACHLINES =
 sig
   val forEachLines : string * (string -> unit) -> unit
 end;
