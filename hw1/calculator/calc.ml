open Ast

(* Evaluate expression and return (value, environment) *)
let rec eval env = function 
    Lit(x) -> x, env
  | Binop(e1, op, e2) ->
      let v1, env = eval env e1 in
      let v2, env = eval env e2 in
      (match op with
        Add -> v1 + v2
      | Sub -> v1 - v2
      | Mul -> v1 * v2
      | Div -> v1 / v2), env
  | Seq(e1, e2) ->
      let _, env = eval env e1 in
      eval env e2
  | Asn(idx, e) ->
      let v, env = eval env e in
      let _ = env.(idx) <- v in
      v, env
  | Var(idx) ->
      env.(idx), env

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parser.expr Scanner.token lexbuf in
  let env = Array.make 10 0 in
  let result = eval env expr in
  let _ = Array.iter (fun l -> print_endline (string_of_int l)) env in
  print_endline (string_of_int (fst result))
