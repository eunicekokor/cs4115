(*
    Alden Quimby - adq2101 - CS4115 HW1
    2: wordcount.mll

    Reads from stdin until EOF, gathering a list of all words read.
    Counts the number of times each word appears using a StringMap,
    sorts the freqencies and prints the results.
*)

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


(* ------------- TESTS -------------

To test this code, I ran following: (please note that the 
wordcount.mll file included all comments from above, so words
in the comments were included in wordcount)

$ ocamllex wordcount.mll
$ ocamlc -o wordcount wordcount.ml
$ ./wordcount < wordcount.mll
12 word
8 of
7 wordmap
7 let
7 in
7 StringMap
6 a
5 the
5 count
4 wordcounts
4 token
4 list
4 h
4 c
4 EOF
3 string
3 next
3 lexbuf
3 l
3 helper
3 fun
3 Word
2 words
2 wordlist
2 wl
2 with
2 whose
2 times
2 t
2 stdin
2 sort
2 s
2 rec
2 print
2 number
2 match
2 map
2 from
2 are
2 and
2 List
1 z
1 wordcount
1 was
1 values
1 using
1 until
1 type
1 tuples
1 then
1 sorts
1 snd
1 rule
1 results
1 read
1 prints
1 parse
1 module
1 mll
1 mem
1 keys
1 iter
1 into
1 int
1 if
1 gathering
1 fst
1 freqencies
1 found
1 fold
1 find
1 eof
1 endline
1 empty
1 else
1 each
1 convert
1 compare
1 channel
1 build
1 as
1 appears
1 all
1 adq
1 add
1 Z
1 String
1 Reads
1 Quimby
1 Pervasives
1 Map
1 Make
1 Lexing
1 HW
1 Counts
1 CS
1 Alden
1 A

----------- END TESTS ----------- *)
