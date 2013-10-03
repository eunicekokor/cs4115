module StringMap = Map.Make(String);;

(*
  1. scans the list and builds a string map whose keys are words and whose values are the number of times a string was found
  2. uses StringMap.fold to convert this to a list of (count, word) tuples
  3. sorts them using List.sort
  4. prints them with List.iter.
*)
let wordcount wordlist =
  (* 1. build a string map whose keys are words and whose values are the number of times the word was found *)
  let buildmap words = 
    let rec helper wl wordmap = match wl with
      | [] -> wordmap
      | h::t -> helper t (StringMap.add h (if StringMap.mem h wordmap then (StringMap.find h wordmap) + 1 else 1) wordmap)
    in helper words StringMap.empty
  in
  (* 2. convert map into list of (count, word) tuples *)
  let maptotuples wordmap = 
    StringMap.fold (fun word count a -> (count, word) :: a) wordmap []
  in
  (* 3. sort list of (count, word) *)
  let sortwords wordcounts =
    List.sort (fun (c1, _) (c2, _) -> Pervasives.compare c2 c1) wordcounts
  in
  (* 4. print list of (count, word) *)
  let printwords wordcounts =
    List.iter (fun word -> print_endline(string_of_int (fst word) ^ " " ^ snd word)) wordcounts
  in
  (* now execute this on the on input *)
  printwords (sortwords (maptotuples (buildmap wordlist))) ;;
      