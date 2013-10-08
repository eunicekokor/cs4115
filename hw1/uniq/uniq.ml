(*
    Alden Quimby - adq2101 - CS4115 HW1
    1: uniq.ml

    Takes a list and returns the same list with adjacent duplicates removed.
    Basic idea is for lists with more than 1 element, check if the head
    is equal to the next element, and exclude the head if it is.
*)
let rec uniq = function
  | [] -> []
  | [h] -> [h]
  | h::t -> if (h = List.hd t)
            then uniq t
            else h::(uniq t) ;;


(* ------------- TESTS -------------

To test this code, I ran the following:

$ ocaml
# [copy paste "uniq" function here]
# uniq [1;1;1;3;4;1;1];;
- : int list = [1; 3; 4; 1]
# uniq [1;1;1;1];;
- : int list = [1]
# uniq [1;2;3;4];;
- : int list = [1; 2; 3; 4]

----------- END TESTS ----------- *)
