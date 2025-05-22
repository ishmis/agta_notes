#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= LP-Duality and Minimax Theorem
#definition(hh("Primal and Dual"))[Given a linear program in *SFLP*, *the primal*, we can construct another linear program, *the dual*.
- The *variables* in the primal become the *constraints* of the dual.
- Maximisation becomes minimisation.
]
#definition(hh("The Primal"))[
  #v(-3pt)
  $ 
    bold("Maximise") #hl_custom($c$, "#8fbc8f")^(T)x = c_(1)x_(1) + c_(2)x_(2)+...+ c_(n)x_(#hl($n$)) 
  $
  #v(-3pt)
  $ bold("Subject to") #hl($A x #hl_custom($<=$, "#ffb6c1") #hl_custom($b$, "#87ceeb")$) \ a_(1,1)x_(1) + a_(1, 2)x_(2)+ ... + a_(1, n) x_(n)  #hl($<=$) b_(1) \
  a_(2,1)x_(1) + a_(2, 2)x_(2)+ ... + a_(2, n) x_(n)  #hl_custom($=$, "#ffb6c1") b_(2) \
  dots.v  \
  a_(m,1)x_(1) + a_(m, 2)x_(2)+ ... + a_(m, n) x_(n)  <= b_(#hl($m$)) \
  x_(1), ..., x_(n) >= 0
  $
  #v(-4pt)
  *$n$ variables* and *$m$ constraints*.
]
#v(-3pt)
#definition(hh("The Dual"))[

  #v(-3pt)
  $ 
    bold("Minimise") #hl_custom($b$, "#87ceeb")^(T)y = b_(1)y_(1) + b_(2)y_(2)+...+ b_(m)y_(#hl($m$)) 
  $
  #v(-3pt)
  $ bold("Subject to") #hl[$A^(#hl_custom($T$, "#ffb6c1")) y #hl_custom($>=$, "#ffb6c1") #hl_custom($c$, "#8fbc8f")$] \ = b_(1,1)y_(1) + b_(1, 2)y_(2)+ ... + b_(1, m) y_(m)  #hl($>=$) c_(1) \
  b_(2,1)y_(1) + b_(2, 2)y_(2)+ ... + b_(2, m) y_(m)  >= c_(2) \
  dots.v  \
  b_(n,1)y_(1) + b_(n, 2)y_(2)+ ... + b_(n, m) y_(m)  >= c_(#hl($n$)) \
  y_(1), y_3..., y_(m) >= 0 "and" y_2 "appears unrestricted"
  $
  #v(-3pt)
*$m$ variables* and *$n$ constraints*. $<=$ becomes $>=$ and $A$ is transposed.
#v(-3pt)
#grid(
  columns: (1fr, 1fr,),  
  [
    *Primal LP (minimize)* 
    #v(-3pt)
    $
    &#underline[constraints]"       "&#underline[variables]  \
      &>= #hl_custom($b_i$, "#87ceeb") &>=0 \
      &<= #hl_custom($b_i$, "#87ceeb") &<=0  \
      &eq #hl_custom($b_i$, "#87ceeb") &#hl_custom($=$, "#ffb6c1") "free"
    $
  ], 
  [
    *Dual LP (maximize)* 
        #v(-3pt)
    $
      &#underline[variables] "       "&#underline[constraints]  \
      &>= 0 &<=#hl_custom($c_i$, "#8fbc8f") \
      &<= 0 &>= #hl_custom($c_i$, "#8fbc8f")\
      &#hl_custom($=$, "#ffb6c1") "free" &eq #hl_custom($c_i$, "#8fbc8f")
    $
  ]
)
  #v(-3pt)
]
== An "Adversary" Interpretation
#v(-3pt)
#theorem([Weak Duality])[
  Let $x^* in bb(R)^n$ and $y^* in bb(R)^m$ be feasible solutions to the primal and the dual, respectively. Then: $ c^(T) x^* <= b^(T)y^* $
]
#v(-5pt)
#proof([of Weak Duality])[\
  Suppose you want to maximise the objective function of the primal. An adversary provides an $m$-vector $y in bb(R)^(m)_(>=0)$ such that $c^(T) <= y^(T) A$.\
// The coefficients of the objective function of the primal is upper bound by $y^T A$
Consider any solution $x$ for the primal, we observe that:
1. $c^(T) x <= (y^(T) A) x$  (Using condition: $c^(T) <= y^(T) A), x >=0$)
2. $(y^(T) A) x = y^(T) (A x) <= y^(T)b$ (Constraint of Primal: $A x <= b$)
Adversary is trying to minimise $y^(T)b$ subject to $c^(T) <= y^(T) A$ and $y>= 0$
]
#v(-6pt)
#theorem([Strong Duality])[
  One of the following is true:
1. Both the primal and the dual are feasible. Let $x^* in bb(R)^n$ and  $y^* in bb(R)^m$ be *optimal* solutions to the primal and the dual, respectively. Then: $ c^T x^* = b^T y^* $
2. The primal is infeasible and the dual is unbounded.
3. The primal is unbounded and the dual is infeasible.
4. Both the primal and the dual are infeasible.
]
#v(-4pt)
*Note*: _How to prove a solution $x^*$ to the primal is maximum?_ Find a solution $y^*$ to the dual with $c^T x^* = b^T y^*$.
#v(-2pt)
#proposition([Complementary Slackness])[
  Let $x^*$ and $y^*$ be feasible solutions to the primal and the dual respectively. Then $x^*$ and $y^*$ are both *optimal* iff both of the following conditions hold:
  1. For each $i=1,...,m$: 
  #v(-6pt)
  $ 
    ((A x^*)_(i) -  b_(i)) dot y^* _i = 0
  $
  #v(-7pt)
  2. For each $j = 1,...,n$:
  #v(-2pt)
  $ 
    ((A^(T) y^(*))_(j) -c_(j)) dot x^(*)_j = 0
  $
]
#v(-3pt)
// We know that $(A x^*)_(i) - b_(i) >= 0$ as $(A x^*)_i <= b_i. forall i in [1, m]$ and $y^* >= 0$ by constraint of the dual. 
For each constraint associated with $i$, _condition 1_ holds if either:
1. The variable $y_i$ associated with constraint $i$ in the _dual_ has value 0.
2. The corresponding constraint, $(A x^*)_i <= b_i$, of the _primal_ is *tight*, i.e., $(A x^*)_(i) = b_(i)$
#v(-3pt)
*Note:* Similar logic follows for for _condition 2_.
#v(-3pt)
#proof([of Complementary Slackness])[\
  We know that: 
  #v(-3pt)
  $ #hl_custom($c^T x^* <= ((y^*)^T A) x^*$, "ffb6c1") = #hl_custom($(y^*)^T (A x^*) <= (y^*)^T b$, "#87ceeb")"  (By Weak Duality)" $
#v(-3pt)
By Strong Duality, when both $x^*$ and $y^*$ are optimal, the #hl_custom("LHS", "ffb6c1") is equal to the #hl_custom("RHS", "#87ceeb") $->$ *all* inequalities hold with equality. From this, considering #hl_custom("LHS", "ffb6c1"), we have: $(((y^*)^T A) - c^T) dot x^*= 0$.
This is only possible if the product is 0 for each coordinate, since both terms are non-negative. So for each $j=1,...,n$, we have $((A^(T) y^(*))_(j) -c_(j)) dot x^(*)_j = 0$. Similarly for the case of $((A x^*)_(i) -  b_(i)) dot y^* = 0$.
#v(-10pt)
]
#v(-5pt)
== LP-Duality & Simplex 
#v(-3pt)
Consider the final dictionary of the simplex
method at which we compute an optimal solution $x^*$ to the _primal_. We can then compute the solution to the _dual_ as $y_j^* eq -w_j$, where $w_j$ is the _slack variable_ from the final dictionary of the _primal_.\
Looking at the example in the _simplex_ example run, let the *LP* there define the _primal_. It's _dual_ can be given as: 
#v(-3pt)
$ 
  bold("minimise") &5y_1 + 11y_2 + 8y_3 \ 
  bold("subject to") &2y_1 + 4y_2 + 3y_3 >= 5 &"(1)"\ 
                     &3y_1 + y_2 + 4y_3 >= 4 &"  (2)" \
                     &y_1 + 2y_2 + 2y_3 >= 3 &"(3)"\
                     &y_1,y_2,y_3 >= 0
$
#v(-3pt)
The final dictionary of the _primal_ (*FDICT*) had the following constants for the slack variables: $ -1 (w_1), 0 (w_2),-1 (w_3)$. Hence $y^* eq (1, 0, 1)$. We can verify this by subbing in these values into the *objective function of the dual*, which gives us $5 + 8 eq 13$, which is exactly the same as the solution to the _primal_ (so it is correct by _minimax theorem_).  \
Note that #hh[complimentary slackness] holds here. From *FDICT*, we know that $x^* eq (2, 0, 1)$. As $x_1^* > 0$, we expect $(1)$ in the _dual_ to be _tight_. If we use $y^*$, we get $2 + 3 eq 5$ - the bound is indeed tight. For $(2)$, $3 + 4 eq 7 >= 4$, so the bound is not _tight_ and this follows from $x_2^* eq 0$. 

== Minimax as LP 
#proposition[
  #v(-5pt)
  $
    min_(y in Delta(Y)) x^T A y eq min_(t_j in T)sum_(i=1)^n x_i a_(i,j) bold("and")
    
    max_(x in Delta(X)) x^T A y eq max_(s_i in S)sum_(j=1)^m y_j a_(i,j)
  $
]
#v(-3pt)
While expressing _minimax_ as an *LP* from the point of view of the #hh[maximiser], we cannot simply set the objective function as: 
#v(-3pt)
$ 
bold("maximise  ") min_(t_j in T) sum_(i=1)^n x_i a(i, j) 
$
#v(-3pt)
As the above is *not* a _linear_ function. Instead, recall that as per the _minimax theorem_, $v = v_x = v_y$ is the #hh[value of the game]. This is precisely what we use for our *LP*. Let the _primal_ represent the _maximiser_ and the _dual_ represent the _minimiser_: 
#v(-5pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    $
      &#underline[Primal/Maximiser] \
      
      bold("maximise") &v_x \ 
      
      bold("Subject to") &v_x - sum_(i=1)^n x_i a_(i, j) <= 0, forall j \

      &sum_(i=1)^n x_i = 1 \

      &x_i >= 0, forall i
    $
  ],
    [
    $
      &#underline[Dual/Minimiser] \
      
      bold("minimise") &v_y \ 
      
      bold("Subject to")  &v_y - sum_(j=1)^m y_j a_(i, j) >= 0, forall i \

      &sum_(j=1)^m y_j = 1 \

      &y_j >= 0, forall j
    $
  ]
)
#v(-6pt)
#underline[*Observations*:]\
1. We know that by #hh[strong duality], $v_x eq v_y$. This is _exactly_ the #hh[minimax theorem]! Hence, connecting 2-player zero-sum games to *LPs* give us a way to compute _optimal strategies_ via a solution to the primal/dual. 
2. #hh[Complimentary slackness] applies here. For the _primal_ representing Player 1, if some pure strategy $t_j$ is in the #hh[support] of $y_j$ (_minimiser_'s strategy), then its corresponding constraint in the _primal_ must be *tight*: $v_x - sum_(i=1)^n x_i a_(i, j) = 0$. We use this to get _optimal strategies_. 
#v(-2pt)
== Solving Zero-Sum w/ Complimentary Slackness
#v(-3pt)
#let fig = figure(table(
  columns: (auto, auto, auto, auto),
  stroke: (x, y) => (
    left: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    top: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    bottom: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    right: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt }
  ),
  inset: 3pt,
  align: center,
  "", 
  "R",
  "P", 
  "S",
  "R", 
  [$0,0$],
  [$-1,1$],
  [$1,-1$],
  "P", 
  [$1,-1$],
  [$0,0$],
  [$-1,1$],
  "S", 
  [$-1,1$],
  [$1,-1$],
  [$0,0$],
),
caption: [Rock, Paper, Scissors (RPS)])

#grid(
  columns: (1fr, 1.3fr),
  gutter: 0pt,
  fig, 
  [
    Technique here is to use #hh[complimentary slackness] and "guess" the optimal strategy of the opponent. Say we wanted to find an optimal strategy $y^*$ of the _minimiser_. Then, we would guess in *RPS* that the _maximiser_ plays all three $R, P, S$ with positive probability. Let us first give the *LP* for both players.
  ]
)
#v(-2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    $
      &#underline[Maximiser] \
      
      bold("maximise") &v_x \ 
      
      bold("Subject to") &v_x + x_3 - x_2 <= 0 \

      &v_x + x_1 - x_3 <= 0 \

      &v_x + x_2 - x_1 <= 0 \

      &sum_(i=1)^3 x_i = 1 \

      &x_i >= 0, forall i
    $
  ],
    [
    $
      &#underline[Minimiser] \
      
      bold("minimise") &v_y \ 
      
      bold("Subject to")  &v_y + y_2 - y_3 >= 0 \

      &v_y + y_3 - y_1 >= 0 \

      &v_y + y_1 - y_2 >= 0 \

      &sum_(j=1)^3 y_j = 1 \

      &y_j >= 0, forall j
    $
  ]
)
#v(-3pt)
The "guess" is that $x^*$ is #hh[fully mixed]. Hence all corresponding constraints in the _minimiser_ are *tight* and hence equal to each other. We get:
#v(-5pt)
$ 
  y_3 - y_2 eq y_1 - y_3 eq y_2 - y_1 "and" sum_(j=1)^m y_j = 1 
$ 
#v(-3pt)
This is solved exactly when $y_1 eq y_2 eq y_3 eq 1/3$! Thus $v_y eq 0 eq v_x$!
#v(-3pt)