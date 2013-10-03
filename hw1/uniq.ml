(*
	Takes a list and returns the same list with adjacent duplicates removed.
	Basic idea is for lists with more than 1 element, check if the head
	is equal to the next element, and exclude the head if it is.
*)
let rec uniq = function
  | [] -> []                    (* if list is empty, return it *)
  | [h] -> [h]                  (* if list has one item, return it *)
  | h::t -> if (h = List.hd t)  (* check if head is same as next el *)
			then uniq t         (* if it is, exclude head from result *)
			else h::(uniq t) ;; (* otherwise include head *)
