(*
    Alden Quimby - adq2101 - CS4115 HW1
    3: ast.mli

    This file was given as part of the assignment.
*)

type operator = Add | Sub | Mul | Div

type expr =
    Binop of expr * operator * expr
  | Lit of int
  | Seq of expr * expr
  | Asn of int * expr
  | Var of int
