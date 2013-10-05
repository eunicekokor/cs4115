{ type token = EOF | Word of string }

rule token = parse
  | eof                        { EOF }
  | ['a'-'z' 'A'-'Z']+ as word { Word(word) }
  | _                          { token lexbuf }

{
  module StringMap = Map.Make(String);;

  let lexbuf = Lexing.from_channel stdin in
  let wordlist =
    let rec next l =
      match token lexbuf with
          EOF -> l
        | Word(s) -> next (s :: l)
    in next []
  in
  (* 1. build a string map whose keys are words and whose values are the number of times the word was found *)
  let wordmap = 
    let rec helper wl wordmap = match wl with
      | [] -> wordmap
      | h::t -> helper t (StringMap.add h (if StringMap.mem h wordmap then (StringMap.find h wordmap) + 1 else 1) wordmap)
    in helper wordlist StringMap.empty
  in
  (* 2. convert map into list of (count, word) tuples *)
  let wordcounts = 
    StringMap.fold (fun word count a -> (count, word) :: a) wordmap []
  in
  (* 3. sort list of (count, word) *)
  let wordcounts =
    List.sort (fun (c1, _) (c2, _) -> Pervasives.compare c2 c1) wordcounts
  in
  (* 4. print list of (count, word) *)
  List.iter (fun word -> print_endline(string_of_int (fst word) ^ " " ^ snd word)) wordcounts;;
}