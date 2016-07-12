
type t

type interval
  = Seconds
  | Minutes
  | Hours
  | Days
  | Weeks
  | Months
  | Years
  | Eternity

module Month : sig
  type t
    = Jan | Feb | Mar | Apr | May | Jun
    | Jul | Aug | Sep | Oct | Nov | Dec
  val of_int : int -> t
  val to_int : t -> int
  val next : t -> t
end

module Day_of_week : sig
  type t
    = Mon
    | Tue
    | Wed
    | Thu
    | Fri
    | Sat
    | Sun
  val of_int : int -> t
  val to_int : t -> int
end

val year : t -> int
val month : t -> Month.t
val day : t -> int
val hour : t -> int
val minute : t -> int
val second : t -> int

val create : ?second:int -> ?minute:int -> ?hour:int ->
             ?day:int -> ?month:Month.t -> int -> t
val now : unit -> t

val of_string : string -> t
val to_string : t -> string
val format : t -> string -> string

val next : t -> interval -> t
val diff : t -> t -> int

val day_of_week : t -> Day_of_week.t
val this_monday : t -> t

val tests : (string * (unit -> bool)) list
