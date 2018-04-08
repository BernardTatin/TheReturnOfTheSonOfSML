(*
 * tools.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * This module contains various functions which are useful
 * in mlTop module.
 *)

(*
 * function isSemiColon
 * parameters
 *    c, the char to test
 * return
 *    true if c is a semi-colon (:)
 *    false otherwise
 *)
fun isSemiColon c = c = #":"
