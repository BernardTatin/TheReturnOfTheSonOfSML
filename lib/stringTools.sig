
signature STRINGTOOLS =
sig
  val isSemiColon : char -> bool
  val isWhite : char -> bool
  val compressWhites : string -> string
  val stFoldr : ('a*'a->'a)-> 'a -> 'a list -> 'a
end; (* signature STRINGTOOLS *)
