
let head = function
  | []   -> failwith "empty list"
  | h::t -> h

 let head_head = function
  | []        -> failwith "the list is empty"
  | []::_     -> failwith "the head is the empty list"
  | (h::_)::_ -> h

let rec member = function
    (e, []) -> false
  | (e, x::xs) ->
      if (e = x)
        then true
        else member (e, xs) ;;
