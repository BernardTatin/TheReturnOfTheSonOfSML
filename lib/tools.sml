(*
 * tools.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * This module contains various functions which are useful
 * in mlTop module.
 *)

signature TOOLS =
sig
  val printLN : string -> unit
end;

structure Tools : TOOLS =
struct
  (*
   * function printLN
   * parameters
   *    s : string, the string to print with a LF at the end
   * return
   *    unit and side effect is printing 's' with a line feed
   *)
  fun printLN s = print (s ^ "\n")
end;  
