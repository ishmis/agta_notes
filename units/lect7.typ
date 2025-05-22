#import "proof_fmt.typ" : *
#import "@preview/wrap-it:0.1.0": wrap-content
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Lemke-Howson and Complexity of NEs
#v(-3pt)
#hh[Lemke-Howson] provides an alternative mechanism to finding *MNEs*. The main idea is to define an *LP* to which the solution must be the *MNE*. We begin by first creating such an *LP*. *Note* that this algorithm works for _general two-player games_ and not just zero-sum games. 
#v(-1pt)
#definition[
  Let $U_1^*$ represent the utility gained from any pure strategy in the support of a mixed strategy at an *MNE*. Recall that this utility is identical for every pure strategy - follows directly from _Proposition 2_. 
]
#v(-3pt)
$ 
  "Let"& \
  &A eq (a_(i, j))_(i in S_1, j in S_2)  "be the utility/payoff matrix of Player 1" \

  &B eq (b_(i, j))_(i in S_1, j in S_2)  "be the utility/payoff matrix of Player 2" \
$
#v(-3pt)
From the above, we have that: 
$
  sum_(j in S_2) a_(i j) x_(2 j) <= U_1^*, forall i in S_1 "and"  sum_(i in S_1) b_(i j) x_(1 i) <= U_2^*, forall j in S_2  \
  
  "which can be re-written with slack variables" r_(1 i), r_(2 j)  \
  
  sum_(j in S_2) a_(i j) x_(2 j) eq U_1^* - r_(1 i), forall i in S_1 "and"  sum_(i in S_1) b_(i j) x_(1 j) eq U_2^* - r_(2 j), forall j in S_2  \

  "where" r_(1 i), r_(2 j) >= 0
$
#v(-4pt)
Now, let a _general 2-player game_ be a *LP*, which has an *MNE* solution: 
#v(-1pt)
#definition(hh[Linear Complementarity Program (LCP)])[
  There is *no objective function*, but we have the following constraints: 
  #v(-3pt)
  $
    sum_(j in S_2) a_(i j) x_(2, j) eq U_1^* - r_(1 i), forall i in S_1 \ 
    
    sum_(i in S_1) b_(i j) x_(1 j) eq U_2^* - r_(2 j), forall j in S_2 \

    sum_(i in S_1) x_(1 i) eq 1 "and" sum_(j in S_2) x_(2 j) eq 1 \

    x_(1 i), r_(1 i) >= 0 ,forall i in S_1 "and" x_(2 j), r_(2 j) >= 0 ,forall j in S_2 \

    x_(1 i) dot r_(1 i) eq 0, forall i in S_1 "and" x_(2 j) dot r_(2 j) eq 0, forall j in S_2 "  (1)"
  $
  #v(-3pt)
  The constraint $(1)$ above follows directly from _Proposition 2_. If some pure strategy $s_i$ is played with probability $x_(1 i) > 0$, then the utility gained should be $U_1^*$ at an *MNE* - i.e. the related _slack variable_ $r_(1 i)$ *must* be 0. 
]
#v(-2pt)
== Lemke-Howson Example 
#v(-3pt)
#let fig = figure(table(
  columns: (auto, auto),
  inset: 3pt,
  align: center,
  [$0, 1$],
  [$6, 0$],
  [$2, 0$],
  [$5, 2$],
  [$3, 4$],
  [$3, 3$]
)
)
#grid(
  columns: (1fr, 2fr),
  gutter: 0pt,
  fig, [
    Let us run #hh[Lemke-Howson] on the example on the left. First, we must define all the slack variables as either $U_1^* - sum_(j in S_2) a_(i j) x_(2 j)$ or \ $U_2^* - sum_(i in S_1) b_(i j) x_(1 i)$ 
  ]
)
#underline[_Step 1: Define all slack variables_]
#v(-2pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 0pt,
  [
    $
      #underline[Player 1] \
      r_(1 1) eq U_1^* - 6x_(2 2) \ 
    
      r_(1 2) eq U_1^* - 2x_(2 1) - 5x_(2 2) \
    
      r_(1 3) eq U_1^* - 3x_(2 1) - 3x_(2 2)\
    $
  ],
    [
    $
      #underline[Player 2] \ 
      
      r_(2 1) eq U_2^* - x_(1 1) - 4x_(1 3)\
    
      r_(2 2) eq U_2^* - 2x_(1 2) - 3x_(1 3)\
    $
  ]
)
#v(-3pt)
#underline[_Step 2: Simplifying Notation + Substituting $U_i^*$_]\
Noting constraints defined in $(1)$ from the definition of #hh[LCP], we have a unique mapping from variable $x_(i j)$ to slack variable $r_(i j)$. We can then rewrite the slack/non-slack variables with a monotonically increasing index + use $c$ instead of $r$ to refer to slack variables for player 2 + use $y$ instead of $x$ to refer to variables from player 2:
#v(-3pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 0pt,
  [
    $
        #underline[Player 1] \
       
        r_1 eq 1 - 6y_5 \ 
        
        r_2 eq 1 - 2y_4 - 5y_5 \
      
        r_3 eq 1 - 3y_4 - 3y_5\
    $
  ],
    [
    $
      #underline[Player 2] \ 
      
      c_4 eq 1 - x_1 - 4x_3\
    
      c_5 eq 1 - 2x_2 - 3x_3\
    $
  ]
)
$
  bold("contraints:") r_1, r_2, r_3, c_1, c_2, x_1, x_2, x_3, y_4, y_5 >= 0 \ 
  
  sum_(i=1)^3 x_i eq 1 "and" sum_(j=1)^2 y_i eq 1\

  x_1r_1 eq 0, x_2r_2 eq 0, x_3r_3 eq 0, y_1c_1 eq 0, y_2c_2 eq 0 "  (*)"
$
#v(-3pt)
Also note that both $U_1^*$ and $U_2^*$ get replaced by 1. The solution remains the same, and we _leave the proof as an exercise to the reader_ $-$ yeah idk$dots$\
#underline[_Step 3: Relaxing the probability constraints_]\
We just change the following:
#v(-3pt)
$
  sum_(i=1)^3 x_i #highlight[<=] 1 "and" sum_(j=1)^2 y_i #highlight[<=] 1
$
#v(-3pt)
#underline[_Step 4: Run a modified Simplex_]\
The remainder of the algorithm is near identical to _Simplex_, but as there is no objective function - the decision on the _entering_ and _leaving_ variables are changed, and when the algorithm stops is different. At this stage, we have the following _dictionary_: 
#v(-3pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 0pt,
  [
    $
        #underline[Player 1] \
       
        r_1 eq 1 - 6y_5 \ 
        
        r_2 eq 1 - 2y_4 - 5y_5 \
      
        r_3 eq 1 - 3y_4 - 3y_5\
    $
  ],
    [
    $
      #underline[Player 2] \ 
      
      c_4 eq 1 - x_1 - 4x_3\
    
      c_5 eq 1 - 2x_2 - 3x_3\
    $
  ]
)
#v(-3pt)
Just like before, we get an initial #hh[basic feasible solution] by setting all #hh[non-basic variables] to 0 ($x_1 eq x_2 eq x_3 eq y_4 eq y_5 eq 0$). All our variables are *associated* as follows: $(x_1, r_1), (x_2, r_2),(x_3, r_3),(y_4, c_4),(y_5, c_5)$. 
#definition(hh[Lemke-Howson Pivoting])[
 The #hh[entering variable] is picked s.t. it is the associated variable of that which previously was the #hh[leaving variable], and at the _beginning_, the choice is *arbitrary*.\ 
 The #hh[leaving variable] is a variable that *clashes* with the #hh[entering variable] with the _smallest ratio_ $hat(b_i)/hat(a)_(i k)$. 
]
#definition(hh[Clashing Variable])[
  Consider a *non-basic* variable $z$. We say that another *basic* variable $hat(z)$ clashes with $z$, if $hat(z)$ appears on the LHS of the equation that involves $z$. For example, $c_4,c_5$ clash with $x_3$ above. 
]
#underline[_First Pivot_]\ 
In this example, we pick $x_2$ as the first #hh[entering variable] arbitrarily. Then, the #hh[leaving variable] can only be $c_5$ in this case (it is the only #hh[clashing variable]). Then we rewrite the dictionary as per this _pivot_: 
#v(-3pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 0pt,
  [
    $
        #underline[Player 1] \
       
        r_1 eq 1 - 6y_5 \ 
        
        r_2 eq 1 - 2y_4 - 5y_5 \
      
        r_3 eq 1 - 3y_4 - 3y_5\
    $
  ],
    [
    $
      #underline[Player 2] \ 
      
      c_4 eq 1 - x_1 - 4x_3\
    
      x_2 eq 1/2 - 1/2c_5 - 3/2x_3\
    $
  ]
)
#v(-3pt)
#underline[_Second Pivot_]\ 
As the previous #hh[leaving variable] was $c_5$, which has the associated variable $y_5$. Hence, in this pivot $y_5$ is the #hh[entering  variable]. All $r_1, r_2, r_3$ *clash*, but we pick $r_1$ as it will have the _smallest ratio_. 
#v(-3pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 0pt,
  [
    $
        #underline[Player 1] \
       
        y_5 eq 1/6 - 1/6r_1 \ 
        
        r_2 eq 1/6 - 2y_4 + 5/6r_1 \
      
        r_3 eq 1/2 - 3y_4 - 1/2r_1\
    $
  ],
    [
    $
      #underline[Player 2] \ 
      
      c_4 eq 1 - x_1 - 4x_3\
    
      x_2 eq 1/2 - 1/2c_5 - 3/2x_3\
    $
  ]
)
#v(-3pt)
We keep _pivoting_ until we find the *next feasible solution* after the initial _basic feasible solution_. This is determined by the constraint marked with $(*)$. Another way to see this, is to get to a dictionary where where the basic variables *do not* contain any pair of _associated variables_. The above example completes at the _fourth pivot_.\
The algorithm terminates with the following values: 
#v(-3pt)
$ 
  x_1 = 1, x_2 = 1/2, x_3 = 0, y_4 = 1/12, y_5 = 1/6 
$  
#v(-2pt)
Since the $sum_(i=1)^3 x_i <= 1 "and" sum_(j=1)^2 y_i <= 1$, the values above need to be *normalised*. We update each variable's value as below: 
#v(-3pt)
$ 
  x_(i) = x_(i) / (sum_(i) x_(i))  "and"
  y_j eq y_j / (sum_j y_j)
$
#v(-3pt)
Then, we map the values of these variables to the original variables. Final answers: $x_(11) = 2/3, x_(12) = 1/3, x_(13) = 0, x_(21) = 1/3, x_(22) = 2/3$ \
*Notes*
1. We only ever consider the *basic solution* at every pivot. 
2. #hh[Lemke-Howson] will always find an (actually all) *MNE* and it proves the existence of a _rational_ equilibrium. 
3. #hh[Lemke-Howson] is not polynomial time and only works for 2 players :( 
#v(-3pt)
== Geometric Interpretation of Lemke-Howson
#v(-2pt)
#definition(hh[Labelling])[ $L(x_(i j))$ for  $i in {1,2}$ and $forall j in S_i$ consists of:
1. The pure strategy $s_(i j)$, *if* $x_(i j)(s_(i j)) = 0$ (not in the _support_)
2. For every strategy $s_(3-i, j)$ of the other player, $s_(i j) in L(x_(i j))$ *if* $s_(3-i, j)$ is a #hh[best response] to $x_i$. That is, the opponent's best response.   
]
#v(-1pt)
#definition(hh[Fully Labelled])[
  For a pair of mixed strategies $(x_1, x_2)$, they are fulled labelled only if 
  #v(-3pt)
  $
    union_(i in {1,2}) union_(j in S_i) L(x_(i j)) eq S_1 union S_2 
  $
  #v(-3pt)
]
  That is, for every strategy $j in S_i$ for $i in {1,2}$ appears in the total set of labels means that either $j$ is *not* in the _support_ of $x_i$, or $j$ is the #hh[best response] to the mixed strategy $x_(3-i)$ of the other player. This is equivalent to the condition $x_(i j) > 0 -> r_(i j) = 0$
#v(-4pt)
#figure(
  image("../figures/labelling.png", width: 100%),
)
#v(-8pt)
#figure(
  image("../figures/lemke_howson.png", width: 100%),
)
#v(-3pt)
Above, you begin at $(0,0,0)$ and $(0,0)$ then do the _initial_ pivot. The pivoting is carried out till $(x_1,x_2)$ is #hh[fully labelled] $->$ *MNE* is found! 
#v(-3pt)