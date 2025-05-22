#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Mixed Nash Equilibria + 2 Player Games
#v(-3pt)
*#underline[_Verifying Nash Equilibria_:]*\ 
An algorithm is called *efficient* if it runs in *polynomial time*, i.e., time which is a polynomial function of the size of the input parameters, n.
*Note*: Polynomial: $O(log(n)), O(n), O(n log(n)), O(n^2)$ & $O(n^alpha)$
#v(-3pt)
#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(booktabs: true, line-numbering: "1", numbered-title: [Verifying Nash Equilibria])[

    + *For* every player $i in N$ *do*:
      + Compute $u_(i)(x_(i), x_(-i)) ->$ see $[1]$ in proof of _Proposition 1_
        + *For* $s_(i j) in S_i$ *do*:
          + Compute $u_(i)(s_(i j), x_(-i))$
          + *if* $u_(i)(x_(i), x_(-i)) < u_(i)(s_(i j), x_(-i))$ *return* NO
      
    + *Return* YES
  ]
)<verify-nash-equilibrium>
#proposition(number: "2")[ 
A mixed strategy profile $x=(x_(i), x_(-i))$ is a *MNE* *iff*, for every player $i in N$, and for every pure strategy $s_i in S_i$ *in the support of $x_i$*, we have:
#v(-3pt)
$
  u_i (x_i, x_(-i)) = u_i (s_i, x_(-i))
$
]
#proof([of Proposition 2])[\
  We go by contradiction. Let $x = (x_i, x_(-i))$ be a *MNE* and assume that $exists s_i^' in "supp"(x_i)$ s.t. $u_i (s_i, x_(-i)) < u_i (x_i, x_(-i))$ (_Proposition 1_ strictly holds). Let $s_i^* in "argmax"_(s_i in "supp"(x_i)) u_(i) (s_i, x_(-i))$ and by definition this is $>=  u_i (x_i, x_(-i))$. \
  Consider an alternative mixed strategy $x_i^'$ s.t. $x_i^' (s_i) = x_i (s_i)$ for all pure strategies $s_i != s_i^', s_i^*$ and $x_i^' (s_i^') = 0$ and $x_i^' (s_i^*) = x_i ( s_i^') + x_i (s_i^*)$. However, $x_i^'$ results in a higher expected utility than $x_i$, but $x_i$ is the *MNE* - contradiction! Hence _Proposition 2_ holds. 
]
#v(-3pt)
#definition(hh[Fully Mixed])[
  Refers to any mixed strategy that assigns a positive probaility to all pure strategies. 
]
  #v(-3pt)
*#underline[Using _Proposition 2_:]*\
#v(-3pt)
#figure(table(
  columns: (0.5fr, 1fr, 1fr),
  stroke: (x, y) => (
    left: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    top: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    bottom: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    right: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt }
  ),
  inset: 3pt,
  align: center,
  "", 
  "Peep Show", 
  "FOTC", 
  "Peep Show",
  table.cell(
    fill: green.lighten(60%),
  )[$10, 7$],
  $5, 5$,
  "FOTC",
  $1, 1$,
  table.cell(
    fill: green.lighten(60%),
  )[$7, 10$],
),
  caption: [Choosing a TV Show (shaded are the PNEs)]) <table2>

#example([Finding a *MNE* using @table2])[ \ 
  By #hh[Proposition 2], we know that if there is a *MNE*, the utility gained from all pure strategies in its support must be equal. Let $x = (x_1, x_2)$ be the mixed strategy of Player 1 and $y = (y_1, y_2)$ be the mixed strategy of Player 2. Note further that $x_1 + x_2 = 1$ and $y_1 + y_2 = 1 "(1)"$. 
  $ 
    u_1 (x_1, y) eq u_1 (x_2, y) \
    10 y_1 + 5y_2 eq y_1 + 7 y_2 => 9y_1 - 2y_2 = 0 " (2)"
  $
]
Using (1) and (2) we get $y_1 = 2/11$ and $y_2 = 9/11$. Similarly, $x$ can be found.
== Support Enumeration (SE)
#v(-3pt)
What we did in the above example was use _Proposition 2_ and assume that both players will have a _fully mixed_ *MNE* - which it turns out is possible. #hh[Support Enumeration] takes that idea and involves:
1. *Guessing* pure strategies that go into each player's mixed strategy.  
2. Solving a set of linear equations (for two player games only!)
3. Verifying whether the _guess_ was correct, retrying otherwise
#v(-3pt)
The system of linear equations includes:
#v(-3pt)
$ 
forall i in N, forall s_j in "supp"(x_i), u_i (s_j, x_(-i)) = w_i "(Proposition 2)" \

forall i in N, forall s_j in.not "supp"(x_i), u_i (s_j, x_(-i)) <= w_i "(MNE condition)" \

forall i in N, sum_(s_j in S_j) x_i (s_j) = 1" (probabilities innit)" \

forall i in N, forall s_j in "supp"(x_i), x_i (s_j) > 0 "(Support Def)" \

forall i in N, forall s_j in.not "supp"(x_i), x_i (s_j) = 0 "(Support Def)" \
$
#v(-3pt)
$checkmark$ As per Nash's Theorem, *SE* is bound to give a *MNE* \ 
$crossmark$ The number of potential supports to try is $2^(bar S_i bar)$!
#v(-3pt)
== 2-Player Zero-Sum Games
#definition(hh[Two Player Zero Sum Game])[
  Let $S = {s_1, dots, s_(m 1)}$ and $T= {t_1, dots, t_(m 2)}$ be the two strategy sets of the two players. Then, their utility functions are such that for any $s_i in S$ and $t_i in T$, we have:
  #v(-3pt)
  $ 
    u_1 (s_i, t_i) eq -u_2 (s_i, t_i) 
  $
  #v(-3pt)
  In this case, we drop the subscript from the utility function and just write $u(i,j)$. Player 1 is the #hh[maximizer] and player 2 is the #hh[minimizer]. 
]
  #v(-3pt)
*Note:* for matrix operations, we assume the _column-vector_ notation. That is, $z = (z_1, dots, z_m) in RR^m$, i.e. $z = vec(z_1, z_2, dots.v, z_m)$ \ 
#definition(hh[Utility in Minimax])[
 Let $A = (a_(i j)) in RR^(m crossmark n)$  be the payoff matrix a 2-player zero-sum game, where $x in RR^m$ and $y in RR^n$ are the strategies of the #hh[maximiser] and #hh[minimiser]. The expected utility is: 
 #v(-3pt)
 $ 
  u(x,y) eq x^T A y eq sum_(i = i)^(m) sum_(j = i)^(n) (x_i dot a_(i j) dot y_j) 
 $
]
  #v(-3pt)
== Minimax (Optimal) Strategy Equilibrium
#definition(hh[Maxmiser's Strategy ])[ Maximise over the minimum:
  #v(-3pt)
  $ x^* in "arg" max_(x in Delta (X)) min_(y in Delta (Y)) x^T A y  $
]
  #v(-3pt)
#definition(hh[Minimiser's Strategy ])[  Minimise over the maximum:
  $ y^* in "arg" min_(y in Delta (Y)) max_(x in Delta (X)) x^T A y  $ 
  
]
#definition(hh[Maxmisier's Payoff ])[ 
  #v(-3pt)
  $ 
  "Let "v_x eq max_(x in Delta (X)) min_(y in Delta (Y)) x^T A y  \
  "be the payoff of the" #hh[maximiser] "from" x^*
  $
]
#v(-3pt)
#definition(hh[Minimiser's Payoff])[
  #v(-3pt)
  $ 
  "Let "v_y eq min_(y in Delta (Y)) max_(x in Delta (X))  x^T A y  \
  "be" #highlight[minus the payoff] "of the" #hh[minimiser] "from" y^*
  $
]
#v(-3pt)
*Observe* that $v_x <= v_y$:
#v(-3pt)
#proof[ 
  #v(-10pt)
  $ 
  v_x eq max_(x in Delta (X))  min_(y in Delta (Y))  x^T A y eq min_(y in Delta (Y)) (x^*)^T A y \ 
  
  <= (x^*)^T A y^* <= max_(x in Delta (X)) x^T A y^* eq min_(y in Delta (Y)) max_(x in Delta (X))  x^T A y  eq v_y
  $
  #v(-10pt)
]
#v(-5pt)
#theorem([von Neumann's Minimax Theorem])[ $v_x eq v_y$ ]
#v(-2pt)
#definition(hh[Value of a 2-player zero-sum game])[
  $v eq v_x eq v_y$
]
#v(-2pt)
#theorem[
  Let $(x^*, y^*)$ be the mixed strategies of a 2-player zero-sum game. Then $x^*$ and $y^*$ are both optimal strategies *iff* $(x^*, y^*)$ is a *MNE*. 
]
#v(-4pt)
#proof[\
  #underline[One direction:] $(x^*, y^*)$ are optimal strategies $->$ they are an *MNE*. Consider a deviation of the _maximiser_ to $x'$. From the minimax theorem, it must be the case that: 
  $(x')^T A y^* <= max_(x in Delta (X)) x^T A y^* eq (x^*)^T A y^*$, i.e the utility of the _maximiser_ cannot increase. Similarly for the _minimiser_. $therefore$ $(x^*, y^*)$ must be an *MNE*.  \
  #underline[Other direction:] $(x^*, y^*)$ is an *MNE* $->$ they are optimal strategies. By definition, we have that:
  #v(-2pt)
  $ 
  (x^*)^T A y^* eq max_(x in Delta (X)) x^T A y^* >= min_(y in Delta (Y)) max_(x in Delta (X)) x^T A y "   (1)"  \ 

  (x^*)^T A y^* eq min_(y in Delta (Y)) (x^*)^T A y <= max_(x in Delta (X)) min_(y in Delta (Y)) x^T A y " (2)"  \ 
  $ 
  #v(-2pt)
  We know that the RHS of (1) and (2) must be equal, which by the minimax theorem means that $(x^*, y^*)$ are optimal strategies. 
]
#v(-2pt)
#corollary[By this theorem, any technique of finding *MNEs* can be used to find optimal strategies in zero-sum. For example, *SE* can be used!
]
