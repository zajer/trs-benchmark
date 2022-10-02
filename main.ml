open Bigraph
open Tracking_bigraph


let () = print_endline "tracking_bigraph vs bigraph benchmark"
let s0_to_parse =
"
{(0, A:4),(1, A:4),(2, A:4),(3, A:4),(4, A:4),(5, A:4),(6, A:4),(7, A:4),(8, A:4),(9, A:4),(10, U:0),(11, U:0),(12, U:0),(13, H:0),(14, M:0),(15, M:0),(16, M:0),(17, M:0),(18, M:0),(19, M:0),(20, M:0),(21, M:0),(22, M:0),(23, M:0)}
0 24 0
000000000011111000000000
000000000000000100000000
000000000000000010000000
000000000000000001000000
000000000000000000100000
000000000000000000010000
000000000000000000001000
000000000000000000000100
000000000000000000000010
000000000000000000000001
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
000000000000000000000000
({}, {}, {(0, 1), (1, 1)})
({}, {}, {(0, 1), (5, 1)})
({}, {}, {(0, 1), (6, 1)})
({}, {}, {(0, 1)})
({}, {}, {(1, 1), (2, 1)})
({}, {}, {(1, 1)})
({}, {}, {(1, 1)})
({}, {}, {(2, 1), (3, 1)})
({}, {}, {(2, 1), (4, 1)})
({}, {}, {(2, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1)})
({}, {}, {(5, 1)})
({}, {}, {(5, 1), (8, 1)})
({}, {}, {(5, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(7, 1)})
({}, {}, {(7, 1), (9, 1)})
({}, {}, {(7, 1)})
({}, {}, {(8, 1)})
({}, {}, {(8, 1), (9, 1)})
({}, {}, {(8, 1)})
({}, {}, {(9, 1)})
({}, {}, {(9, 1)})
"

let s0slim_to_parse =
"
{(0, A:4),(1, A:4),(2, A:4),(3, A:4),(4, A:4),(5, A:4),(6, A:4),(7, U:0),(8, U:0),(9, H:0),(10, M:0),(11, M:0),(12, M:0),(13, M:0),(14, M:0),(15, M:0),(16, M:0)}
0 17 0
00000001111000000
00000000000100000
00000000000010000
00000000000001000
00000000000000100
00000000000000010
00000000000000001
00000000000000000
00000000000000000
00000000000000000
00000000000000000
00000000000000000
00000000000000000
00000000000000000
00000000000000000
00000000000000000
00000000000000000
({}, {}, {(0, 1), (1, 1)})
({}, {}, {(0, 1), (5, 1)})
({}, {}, {(0, 1), (6, 1)})
({}, {}, {(0, 1)})
({}, {}, {(1, 1), (2, 1)})
({}, {}, {(1, 1)})
({}, {}, {(1, 1)})
({}, {}, {(2, 1), (3, 1)})
({}, {}, {(2, 1), (4, 1)})
({}, {}, {(2, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1)})
({}, {}, {(5, 1)})
({}, {}, {(5, 1)})
({}, {}, {(5, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
"

let s0plus_to_parse =
"
{(0, A:4),(1, A:4),(2, A:4),(3, A:4),(4, A:4),(5, A:4),(6, A:4),(7, A:4),(8, A:4),(9, A:4),(10, U:0),(11, U:0),(12, U:0),(13, H:0),(14, M:0),(15, M:0),(16, M:0),(17, M:0),(18, M:0),(19, M:0),(20, M:0),(21, M:0),(22, M:0),(23, M:0),(24, A:4),(25, M:0)}
0 26 0
00000000001111100000000000
00000000000000010000000000
00000000000000001000000000
00000000000000000100000000
00000000000000000010000000
00000000000000000001000000
00000000000000000000100000
00000000000000000000010000
00000000000000000000001000
00000000000000000000000100
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000000
00000000000000000000000001
00000000000000000000000000
({}, {}, {(0, 1), (1, 1)})
({}, {}, {(0, 1), (5, 1)})
({}, {}, {(0, 1), (6, 1)})
({}, {}, {(0, 1)})
({}, {}, {(1, 1), (2, 1)})
({}, {}, {(1, 1), (24, 1)})
({}, {}, {(1, 1)})
({}, {}, {(2, 1), (3, 1)})
({}, {}, {(2, 1), (4, 1)})
({}, {}, {(2, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1), (24, 1)})
({}, {}, {(5, 1), (24, 1)})
({}, {}, {(5, 1), (8, 1)})
({}, {}, {(5, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(7, 1)})
({}, {}, {(7, 1), (9, 1)})
({}, {}, {(7, 1)})
({}, {}, {(8, 1)})
({}, {}, {(8, 1), (9, 1)})
({}, {}, {(8, 1)})
({}, {}, {(9, 1)})
({}, {}, {(9, 1)})
({}, {}, {(24, 1)})
"

let s0extra_to_parse =
"
{(0, A:4),(1, A:4),(2, A:4),(3, A:4),(4, A:4),(5, A:4),(6, A:4),(7, A:4),(8, A:4),(9, A:4),(10, U:0),(11, U:0),(12, U:0),(13, H:0),(14, M:0),(15, M:0),(16, M:0),(17, M:0),(18, M:0),(19, M:0),(20, M:0),(21, M:0),(22, M:0),(23, M:0),(24, A:4),(25, U:0),(26, M:0)}
0 27 0
000000000011111000000000010
000000000000000100000000000
000000000000000010000000000
000000000000000001000000000
000000000000000000100000000
000000000000000000010000000
000000000000000000001000000
000000000000000000000100000
000000000000000000000010000
000000000000000000000001000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000000
000000000000000000000000001
000000000000000000000000000
000000000000000000000000000
({}, {}, {(0, 1), (1, 1)})
({}, {}, {(0, 1), (5, 1)})
({}, {}, {(0, 1), (6, 1)})
({}, {}, {(0, 1)})
({}, {}, {(1, 1), (2, 1)})
({}, {}, {(1, 1), (24, 1)})
({}, {}, {(1, 1)})
({}, {}, {(2, 1), (3, 1)})
({}, {}, {(2, 1), (4, 1)})
({}, {}, {(2, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(3, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1)})
({}, {}, {(4, 1), (24, 1)})
({}, {}, {(5, 1), (24, 1)})
({}, {}, {(5, 1), (8, 1)})
({}, {}, {(5, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(6, 1)})
({}, {}, {(7, 1)})
({}, {}, {(7, 1), (9, 1)})
({}, {}, {(7, 1)})
({}, {}, {(8, 1)})
({}, {}, {(8, 1), (9, 1)})
({}, {}, {(8, 1)})
({}, {}, {(9, 1)})
({}, {}, {(9, 1)})
({}, {}, {(24, 1)})
"


let mov_lhs_to_parse =
"
{(0, A:4),(1, U:0),(2, A:4)}
0 3 2
01010
00000
00001
({}, {}, {(0, 1), (2, 1)})
({}, {a}, {(0, 1)})
({}, {b}, {(0, 1)})
({}, {c}, {(0, 1)})
({}, {d}, {(2, 1)})
({}, {e}, {(2, 1)})
({}, {f}, {(2, 1)})
"
let mov_rhs_to_parse =
"
{(0, A:4),(1, U:0),(2, A:4)}
0 3 2
00010
00000
01001
({}, {}, {(0, 1), (2, 1)})
({}, {a}, {(0, 1)})
({}, {b}, {(0, 1)})
({}, {c}, {(0, 1)})
({}, {d}, {(2, 1)})
({}, {e}, {(2, 1)})
({}, {f}, {(2, 1)})
"

let init_lhs_to_parse =
"
{(0, A:4),(1, U:0),(2, M:0)}
0 3 1
0111
0000
0000
({}, {x}, {(0, 1)})
({}, {a}, {(0, 1)})
({}, {b}, {(0, 1)})
({}, {c}, {(0, 1)})
"
let init_rhs_to_parse =
"
{(0, A:4),(1, U:0),(2, I:0)}
0 3 1
0101
0010
0000
({}, {x}, {(0, 1)})
({}, {a}, {(0, 1)})
({}, {b}, {(0, 1)})
({}, {c}, {(0, 1)})
"

let mark_lhs_to_parse =
"
{(0, A:4),(1, U:0),(2, A:4),(3, I:0),(4, M:0)}
0 5 2
0100010
0001000
0000101
0000000
0000000
({}, {}, {(0, 1), (2, 1)})
({}, {a}, {(0, 1)})
({}, {b}, {(0, 1)})
({}, {c}, {(0, 1)})
({}, {d}, {(2, 1)})
({}, {e}, {(2, 1)})
({}, {f}, {(2, 1)})
"
let mark_rhs_to_parse =
"
{(0, A:4),(1, U:0),(2, A:4),(3, I:0)}
0 4 2
010010
000100
000001
000000
({}, {}, {(0, 1), (2, 1)})
({}, {a}, {(0, 1)})
({}, {b}, {(0, 1)})
({}, {c}, {(0, 1)})
({}, {d}, {(2, 1)})
({}, {e}, {(2, 1)})
({}, {f}, {(2, 1)})
"

let download_lhs_to_parse =
"
{(0, U:0),(1, I:0)}
1 2 0
10
01
00
"
let download_rhs_to_parse =
"
{(0, U:0),(1, D:0)}
1 2 0
10
01
00
"

let s0 = Big.of_string s0_to_parse
let s0slim = Big.of_string s0slim_to_parse
let s0plus = Big.of_string s0plus_to_parse
let s0extra = Big.of_string s0extra_to_parse

let mov_lhs = Big.of_string mov_lhs_to_parse
let mov_rhs = Big.of_string mov_rhs_to_parse
let mov_residue = Fun.of_list [(0,0);(1,1);(2,2)]
let mov = TBrs.parse_react "mov" ~lhs:mov_lhs ~rhs:mov_rhs ~f_sm:None ~f_rnm:mov_residue
let mov_vanila = Brs.parse_react ~name:"mov" ~lhs:mov_lhs ~rhs:mov_rhs None |> Option.get

let init_lhs = Big.of_string init_lhs_to_parse
let init_rhs = Big.of_string init_rhs_to_parse
let init_residue = Fun.of_list [(0,0);(1,1)]
let init = TBrs.parse_react "init" ~lhs:init_lhs ~rhs:init_rhs ~f_sm:None ~f_rnm:init_residue
let init_vanila = Brs.parse_react ~name:"init" ~lhs:init_lhs ~rhs:init_rhs None |> Option.get

let mark_lhs = Big.of_string mark_lhs_to_parse
let mark_rhs = Big.of_string mark_rhs_to_parse
let mark_residue = Fun.of_list [(0,0);(1,1);(2,2);(3,3)]
let mark = TBrs.parse_react "mark" ~lhs:mark_lhs ~rhs:mark_rhs ~f_sm:None ~f_rnm:mark_residue
let mark_vanila = Brs.parse_react ~name:"mark" ~lhs:mark_lhs ~rhs:mark_rhs None |> Option.get

let dwn_lhs = Big.of_string download_lhs_to_parse
let dwn_rhs = Big.of_string download_rhs_to_parse
let dwn_residue = Fun.of_list [(0,0)]
let download = TBrs.parse_react "download" ~lhs:dwn_lhs ~rhs:dwn_rhs ~f_sm:None ~f_rnm:dwn_residue
let download_vanila = Brs.parse_react ~name:"download" ~lhs:dwn_lhs ~rhs:dwn_rhs None |> Option.get


module Gen = TBrs.Make(Tools.DigraphTools);;

(*
let num_of_trans,checked,unchecked,num_of_steps = Gen.explore_ss_slim ~trans_file_name:"transitions.csv" ~states_file_name:"states.csv" s0slim [mov;init;mark;download] 777;;
Printf.printf "TBRS: %d transitions, %d checked states, %d unchecked states, %d steps\n" num_of_trans (List.length checked) (List.length unchecked) num_of_steps
*)
(*
let _,stats = Brs.bfs ~s0:s0 ~priorities:[Brs.P_class [mov_vanila;init_vanila;mark_vanila;download_vanila] ] ~predicates:[] ~max:(80000) ~iter_f: (fun _ _ -> () );;
Printf.printf "BRS: %d transitions found, between %d states\n" (stats.trans) (stats.states)
*)

let initStateFun sizeAsString = 
	match sizeAsString with
	| "slim" -> s0slim
	| "default" -> s0
	| "extra" -> s0extra
	| "plus" -> s0plus
	| _ -> Printf.printf "Unknown variant of initial state. Using the slim one.\n" ; s0slim

let ttsMode init_state =
	let num_of_trans,checked,unchecked,num_of_steps = Gen.explore_ss_slim ~trans_file_name:"transitions.csv" ~states_file_name:"states.csv" init_state [mov;init;mark;download] 777
	in
		Printf.printf "TBRS: %d transitions found, %d checked states, %d unchecked states, %d steps\n" num_of_trans (List.length checked) (List.length unchecked) num_of_steps;;
let parttsMode init_state =
	let num_of_trans,checked,unchecked,num_of_steps = Gen.parexplore_ss_slim ~trans_file_name:"transitions.csv" ~states_file_name:"states.csv" init_state [mov;init;mark;download] 777
	in
		Printf.printf "TBRS parallel: %d transitions found, %d checked states, %d unchecked states, %d steps\n" num_of_trans (List.length checked) (List.length unchecked) num_of_steps;;

let ltsMode init_state =
	let _,stats = Brs.bfs ~s0:init_state ~priorities:[Brs.P_class [mov_vanila;init_vanila;mark_vanila;download_vanila] ] ~predicates:[] ~max:(80000) ~iter_f: (fun _ _ -> () )
	in
		Printf.printf "BRS: %d transitions found, between %d states\n" (stats.trans) (stats.states)

let modeFun mode initState = 
	match mode with
	| "tts" -> Printf.printf "TTS \n" ; ttsMode initState
	| "ptts" -> 
		Parmap.set_default_ncores (int_of_string Sys.argv.(3) );
		Printf.printf "TTS-par \nUtilizing %d cores" (Parmap.get_default_ncores ()) ; parttsMode initState
	| "lts" -> Printf.printf "LTS \n" ; ltsMode initState
	| _ -> Printf.printf "Unknown mode, exiting \n" ;;

modeFun Sys.argv.(1) (initStateFun Sys.argv.(2));;
