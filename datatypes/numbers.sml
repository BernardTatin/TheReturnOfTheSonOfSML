(*
 * numbers.sml
 *)

datatype FullNumber = NInt of int | NReal of real;

fun xsquare (NInt x) = (NInt (x * x))
| xsquare (NReal x) = (NReal (x * x))


(*
  Test:
   > xsquare (NInt 5);
     val it = NInt 25: FullNumber
   > xsquare (NReal 4.5);
     val it = NReal 20.25: FullNumber
 *)
