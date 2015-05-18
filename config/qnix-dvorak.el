(require 'quail)

(quail-define-package
 "qnix-dvorak" "English" "QX@" t
 "English (ASCII) input method for (qnix) Dvorak keyboard"
 nil t t t t nil nil nil nil nil t)


;;
;; `~ '1!  2@  3#  4$  5%  6^  7&  8*  9(  0)  [{  ]}
;;  '"  xX  qQ  uU  yY  zZ  lL  cC  rR  -_  /?  =+  \|
;;   aA  oO  eE  iI gG  dD  hH  tT  nN  sS  ;:
;;    ,<  kK  jJ  pP  fF  bB  mM  wW  vV  .>
;;


(quail-define-rules

 ("`" ?`) ("-" ?\[) ("=" ?\])
 ("~" ?~) ("_" ?{) ("+" ?})

 ("q" ?\')  ("w" ?x) ("e" ?q) ("r" ?u) ("t" ?y) ("y" ?z)  ("u" ?l) ("i" ?c) ("o" ?r) ("p" ?-) ("[" ?/) ("]" ?=) ("\\" ?\\)
 ("Q" ?\")  ("W" ?X) ("E" ?Q) ("R" ?U) ("T" ?Y) ("Y" ?Z)  ("U" ?L) ("I" ?C) ("O" ?R) ("P" ?_) ("{" ??) ("}" ?+) ("|" ?|)

 ("a" ?a)  ("s" ?o) ("d" ?e) ("f" ?i) ("g" ?g) ("h" ?d)  ("j" ?h) ("k" ?t) ("l" ?n) (";" ?s) ("'"  ?\;)
 ("A" ?A)  ("S" ?O) ("D" ?E) ("F" ?I) ("G" ?G) ("H" ?D)  ("J" ?H) ("K" ?T) ("L" ?N) (":" ?S) ("\"" ?:)

 ("z" ?,)  ("x" ?k) ("c" ?j) ("v" ?p) ("b" ?f) ("n" ?b)  ("m" ?m) ("," ?w) ("." ?v) ("/" ?.)
 ("Z" ?<)  ("X" ?K) ("C" ?J) ("V" ?P) ("B" ?F) ("N" ?B)  ("M" ?M) ("<" ?W) (">" ?V) ("?" ?>)

 )
