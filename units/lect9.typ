#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Extensive Form Games (EFG) w/ Perfect Information
#v(-3pt)
For _sequential_ games, we introduce *EFGs* that use _game trees_. 
#v(-1pt)
#definition(hh[Perfect Information EFG ])[
  _Tuple_ $G = (N, A, H, Z, chi, rho, sigma, u)$
#v(-3pt)
#grid(
  columns: (1fr, 1.2fr),
  [
    1. $N$ is a set of $n$ players 
    2. $A$ is the set of _actions_. 
    3. $H$ is a set of nonterminal #hh[choice nodes]
    4. $Z$ is a set of _terminal_ nodes, $Z union H eq emptyset$
    5. $chi : A -> 2^A$ is the #hh[action function], mapping to each choice node a set of possible action
  ],
  [

    6. $rho: H -> N$ is the #hh[player function], which determines which player takes an action at each choice node
    7. $sigma: H crossmark A -> H union Z$ is the #hh[successor function], which maps a choice node and an action to another node (choice or terminal)
    8. $u_i: Z -> RR$ is a #hh[utility function] for each player $i$, mapping terminal nodes to real-values utilities 
  ])
]
#v(-2pt)
#definition(hh[Pure Strategy in EFG ])[ 
  #v(-3pt)
    $
       S_i eq product_(h in H : rho(h) eq i) chi (h)
     $
] 
#v(-5pt)
#figure(image("../figures/pure_start_efg.png", width: 75%))

The above can also be given in _normal form_ as follows: 

#let norm_table = figure(table(
  columns: (auto, auto, auto, auto, auto),
  stroke: (x, y) => (
    left: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    top: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    bottom: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    right: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt }
  ),
  inset: 3pt,
  align: center,
  "", 
  text("(C, E)", fill: red),
  text("(C, F)", fill: red), 
  text("(D, E)", fill: red),
  text("(D, F)", fill: red),
  text("(A, G)", fill: rgb("#027148")),
  [
      #text("3", fill: rgb("#027148")), 
      #text("8", fill: red)
  ],
  [
      #text("3", fill: rgb("#027148")), 
      #text("8", fill: red)
  ],
  [
      #text("8", fill: rgb("#027148")), 
      #text("3", fill: red)
  ],
  [
      #text("8", fill: rgb("#027148")), 
      #text("3", fill: red)
  ],
  
  text("(A, H)", fill: rgb("#027148")),
  [
      #text("3", fill: rgb("#027148")), 
      #text("8", fill: red)
  ],
  [
      #text("3", fill: rgb("#027148")), 
      #text("8", fill: red)
  ],
  [
      #text("8", fill: rgb("#027148")), 
      #text("3", fill: red)
  ],
  [
      #text("8", fill: rgb("#027148")), 
      #text("3", fill: red)
  ],
  
  text("(B, G)", fill: rgb("#027148")),
  [
      #text("5", fill: rgb("#027148")), 
      #text("5", fill: red)
  ],
  [
      #text("2", fill: rgb("#027148")), 
      #text("10", fill: red)
  ],
  [
      #text("5", fill: rgb("#027148")), 
      #text("5", fill: red)
  ],
    [
      #text("2", fill: rgb("#027148")), 
      #text("10", fill: red)
  ],
  
  text("(B, H)", fill: rgb("#027148")),
  [
      #text("5", fill: rgb("#027148")), 
      #text("5", fill: red)
  ],
  [
      #text("1", fill: rgb("#027148")), 
      #text("0", fill: red)
  ],
  [
      #text("5", fill: rgb("#027148")), 
      #text("5", fill: red)
  ],
    [
      #text("1", fill: rgb("#027148")), 
      #text("0", fill: red)
  ],)
)
#v(-3pt)
#grid(
  columns: (1.5fr, 1fr),
  norm_table, 
  [
    It is *always* possible to convert between an perfect info *EFG* to a *NFG*. However, this formation might result in an exponential blowup in the game representation. 
  ]
)
#v(-1pt)
The *PNEs* in the above game are given at $(B,H)$ & ($C,E$), $(A,H)$ & ($C,F$), and $(A,G)$ & ($C,F$). 
#v(-3pt)
#theorem([Zermelo])[
  Every _perfect information EFG_ *always* has a *PNE*.
]
#v(-3pt)
== Subgames
#grid(
  columns: (1fr, 1fr),
  gutter: 05pt,
  figure(
  image("../figures/gametree.png")
  ) , 
  [
    #definition(hh[Subgame])[
      A game rooted at node $h$ restricted to the subtree under $h$.
  ]
  #v(-2pt)
  #definition(hh[Subgame Perfect Equilibrium])[
    A (pure) strategy profile $s=(s_1, ..., s_n)$ s.t if we take the restriction $hat(s)$ of $s$ to any 
  ]
  ]
)
#v(-4pt)
subgame $hat(G)$ of $G$, $hat(s)$ is a PNE of $hat(G)$. This eliminates PNEs based on _non-credible threats_, e.g., $s_1 =(B, H)$ threatens P2 into taking $s_2=(C, bold(E))$.
#v(-2pt)
== Equilibrium in Extensive Form Games
#v(-5pt)
#theorem("Kuhn")[
  Every *perfect information* extensive form game *always* has a *subgame perfect* pure Nash equilibrium (*SPPNE*).
]
#v(-5pt)
#proof("of Kuhn's")[\
By backwards induction on the depth of the tree of the subgame. \
*Base Case, depth 0*: We are at leaf. There are no actions to take, so it is trivially true. Each agent gets the utility $u_i (w)$ prescribed by leaf $w$.
*Inductive Step, depth $k+1$*: Let $G_w$ be the subgame and let $A_w$ be the set of all actions available for each player who corresponds to the root of this subgame. Let $w_a = sigma (w, a)$ be the root of the subtree which is obtained when the player chooses strategy $a in A_w$, and let $G_w_a$ be the corresponding subgame. By construction, the depth of $G_w_a$ is $k$.\
By the induction hypothesis, every such $G_w_a$ has a *SPPNE* denoted by $s^(w_a) =(s_1^(w_a), ..., s_n^(w_a))$.\
Let player $i$ be the player that plays at node $w$. The player will chose the action $a^* in A_w$ to maximise their payoff in game $G_w$. So in the strategy profile for the game $G_w$ we define:
#v(-3pt)
$
  s_i^(w) = s_i^(w_a) union {w -> a^*} \ s_j^(w) = s_j^(w_a) 
$
#v(-14pt)
]
#v(-3pt)
#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(
      booktabs: true, 
      line-numbering: "1", 
      numbered-title: [Computing SPNE])[
        - *Function* #smallcaps[BackwardInduction] (node $h$) *returns* ($u(h)$)
        + *if* $h in Z$ *then*
          + *return* $u(h)$ 
        + _best_util_ $<- -infinity$
        + *forall* $a in chi(h)$ *do*
          + _util_at_child_ $<-$ #smallcaps[BackwardInduction]$(sigma (h, a))$
          + *if*  _$"util_at_child"_rho(h)$_ $>$ _$"best_util"_rho(h)$_ *then*
            + _best_util_ $<-$ _util_at_child_
        + *return* _best_util_
        ]
)<SPPNE>
#v(-5pt)
#figure(image("../figures/sppne.png", width: 90%))
#v(-3pt)
== Alpha-Beta Pruning 
#grid(
  columns: (1.5fr, 1fr), gutter: 2pt, figure(image("../figures/alpha_beta_pruning.png")),
  [
    Some _moves_ can be #hh[pruned] (
remove the subtree reached by that _move_). $alpha$-$beta$ pruning can be applied to _perfect information EFG zero-sum_ games. \ We can prune if:\
    *1)* The #hh[maximiser] can guarantee score of $alpha >= 0$ 
  ]
)
#v(-4pt) *2)* The #hh[minimiser] can guarantee score of $<= beta$. 
