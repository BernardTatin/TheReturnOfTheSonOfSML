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

  fun stFoldr _ b [] = b
    | stFoldr f b (x::[]) = x
    | stFoldr f b (x::y) = f(x, stFoldr f b y)

  fun compressWhites str =let
    val tokens = String.tokens isWhite str
    fun locConcat (x, y) = x ^ " " ^ y
  in
    stFoldr locConcat "" tokens
  end;
end;
