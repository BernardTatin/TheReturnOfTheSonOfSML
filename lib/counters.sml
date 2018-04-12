(*
 * counter.ml
 * Copyright (C) 2018 bernard <bernard@bernard-LIFEBOOK-E782>
 *
 * Distributed under terms of the MIT license.
 *
 * Manage counters defined as closures
 *
 *)

fun makeCounter (maxCount : int) = let
  val count : int ref = ref 0
  fun getCount () =
    (
      if (!count) = maxCount
      then count := 0
      else count := (!count) + 1;
      !count
      )
in
  getCount
end;

fun makeCounterWithAction(maxCount : int, action : unit -> unit) = let
  val count : int ref = ref 0
  fun getCount () =
    (
      if (!count) = maxCount
      then count := 0
      else count := (!count) + 1;
      action ();
      !count
      )
in
  getCount
end;

fun makeTimer(maxCount : int, seconds : int, action : unit -> unit) = let
  val counter = makeCounterWithAction(maxCount, action)
  val tSeconds = Time.fromSeconds (Int.toLarge seconds);
  fun getTimer() =
    if counter() < maxCount
    then (OS.Process.sleep tSeconds; getTimer())
    else ()
in
    getTimer
end;