
signature STRINGTOOLS =
sig
  val isSemiColon : char -> bool
  val isWhite : char -> bool
  val compressWhites : string -> string
end; (* signature STRINGTOOLS *)

structure StringTools: STRINGTOOLS =
struct

  (*
   * function isSemiColon
   * parameters
   *    c, the char to test
   * return
   *    true if c is a semi-colon (:)
   *    false otherwise
   *)
  fun isSemiColon c = c = #":"

  fun isWhite c = case c of
       #" " => true
    |  #"\t" => true
    |  #"\n" => true
    |  _ => false

  fun compressWhites str =let
    val tokens = String.tokens isWhite str
    fun locConcat (x, y) = x ^ " " ^ y
  in
    List.foldr locConcat "" tokens
  end;
end;
