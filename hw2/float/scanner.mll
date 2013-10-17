
{ open Parser }

(* 
	DESCRIPTION OF FLOAT FROM RICHIE:
	Contains integer digits, decimal point, fraction digits, e, 
	optionally signed exponent. Can exclude int or fraction part 
	(not both). Can exclude decimal point or e+exponent (not both).

	FROM THIS, POSSIBLE CASES:
	1: int,    dec pt,    no fraction, no e
	2: int,    dec pt,    no fraction, e
	3: int,    dec pt,    fraction,    no e
	4: int,    dec pt,    fraction,    e
	5: int,    no dec pt, no fraction, e
	6: no int, dec pt,    fraction,    no e
	7: no int, dec pt,    fraction,    e
*)

let digit = ['0'-'9']
let exp = ('e'['-' '+']?digit+)
let flt =
	'-'?digit+('.')digit*exp?       (* handles cases 1-4 *)
  | '-'?digit+exp                   (* handles case  5   *)
  | '-'?('.')digit+exp?             (* handles cases 6-7 *)

rule token = parse
  '\n'       { NEWLINE }
| flt as lit { FLOAT(float_of_string lit) }
