#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Exam FAQ/Additional Notes
#v(-4pt)
*#underline[_Normal Form Games_]*\
1. Before finding *MNE* through *SE* or constructing a *LP* for minimax, run *IEDSE* first.
2. For *IEDSE* on _zero-sum_, rmb that *the col player has negative utils* 
3. For *LP* probs, use the "*tight constraint*" to get $v_x$ or $v_y$
4. When computing all *MNE*, don't exclude *PNEs*! Justify that there are/aren't any *PNEs*. (if there aren't, justfy by inspection) 
5. _2-player zero sum_ *is* solvable in polynomial time via primal/dual *LP*
6. *LPs* (not *ILP*) can run in *worst-case polynomial running time* (_Ellipsoid Method, Interior Point Methods_). However, *LCP* (used in _Lemke-Howson_) does not count.
#v(-2pt)
#definition(hh[Correlated Equilibrium])[
  Let $sigma$ be joint distribution $sigma in Delta(S_1 crossmark S_2 crossmark dots crossmark S_n)$ over strategy profiles, which we will refer to a a correlated strategy in the game. Such a correlated strategy profile $sigma$ is a correlated equilibrium (CE) if, for any player $i in N$ and any swap function $delta_i : S_i → S_i$, it holds that:
  #v(-3pt)
  $ 
    EE_(s tilde sigma) [u_i (s)] >= EE_(s tilde sigma)[u_i (delta_i (s_i), s_(-i))]
  $
  #v(-3pt)
  Essentially, at a *CE*, any player swapping off their recommendation is worse given that the other player follows the advise too (conditional probability here!) Every *MNE* is a *CE*, converse is not true!
]
#grid(
  columns: (1fr, 1fr),
  figure(table(
  columns: (auto, auto),
  inset: 3pt,
  align: center,
  [$4, 2$],
  [$0, 0$],
  [$0, 0$],
  [$2, 4$],
    ),
    caption: [CE as LP Example]
  ),
  [
    Let there $exists$M $eq sum_(i,j) p_(i j)$ s.t. each entry in this matrix corresponds to the probability that the mediator recommends the action of choosing element $i j$.
  ]
)
The *LP* should have a objective function $6 p_(1 1) + 6 p_(2 2)$ ($4 + 2 eq 6$ *SW*). For Player 1 if mediator recommends _R1_ over _R2_, then we use the probabilities associated with recommending and the fact that Player 1 will(weakly) prefer the mediators recommendation: $4 p_(1 1) + 0 p_(1 2) >= 0 p_(1 1) + 2 p_(1 2) -> 4p_(1 1) >= 2p_(2 2)$. Likewise for the others we must get the following: $2p_(2 2) >= 4p_(2 1)$ (_R2_ over _R1_), $2p_(1 1) >= 4p(2 2)$ (_C1_ over _C2_) and $4p_(2 2) >= 2p_(1 1)$ (_C2_ over _C1_). 
#v(-3pt)
*#underline[_Extended Form Games_]*\
#v(-2pt)
#definition(hh[subtree])[ Notice that for a subtree to induce a subgame, it must contain *all of the nodes that are in the same information set*]
#v(-5pt)
#figure(image("../figures/subtree_tip.png", width: 70%), caption: [ Red Circles Highlight Proper Subtree. At unique *SPNE*, the behavioral strategy for *P1* is:
 - play $R$ with prob 1 at the root and $L$ with prob 0
 - play $a$ with prob $3/4$ at left subtree and $b$ with prob $1/4$
 - play $x$ with prob $0$ at right subtree and $y$ with prob 1
#v(-3pt)
 The behavioral strategy of *P2* is:
 - play $l_1$ with prob $1/2$ at left subtree and $r_1$ with prob $1/2$
 - play $l_2$ with prob $1$ at right subtree and $r_2$ with prob 0 
])

When finding *SPPNE*, always state sub-trees upfront!\
#grid(
  columns: (1fr, 1fr), figure(image("../figures/nature_game_eg1.png", width: 100%)),
  figure(image("../figures/nature_game_eg2.png", width: 100%))
)
#v(-3pt)
*#underline[_Congestion Games_]*\
#v(-4pt)
#underline[_Representation_:]\
- Number of player $n$ and the number of resources $m$. As we need to specify strategies and costs for each resource, we need to be able to iterate over $n$ and $m$, $therefore$ these will not be represented in binary.
- The strategy set of each agent is given explicitly in the input as a set $S_i subset 2^m$ - it could be exponential in the number of resources $m$. Still, an algorithm that runs in time $"poly"(m, n, max_i|S_i|)$ is polynomial.
- Furthermore, the cost functions  in general will have to represented as a map by explicitly stating for each possible input, the corresponding output: a number $c_r$, s.t. $c_r = c_r(n_i)$, where $c_i$ is represented in binary. 
- 1 entry of map: the input is bounded by n, and the output is bounded by the binary representation of $c_r$ - num bits needed to represent cr.
- In terms of space, this is $Theta(log c_r)$. An algorithm that runs in time $"poly"(m, n, max_i|S_i|, log max_r c_r)$ is polynomial in the size of the input, but one that runs in time $"poly"(m, n, max_i|S_i|, max_r c_r)$ is exponential (and in fact, pseudopolynomial).
#v(-3pt)
*#underline[_Mechanism Design w/o Money_]*\
To show some valuation function can be used in a _social choice setting_, it needs to have two properties: *1.* induce a strict preference ranking and *2.* for any ranking, there is a valuation function that induces it.
#v(-4pt)
#theorem[
  Every deterministic *truthful *mechanism is *ordinal*.
]
#v(-4pt)
#proof[
  Assume by contradiction that there exists a deterministic truthful mechanism that is not ordinal. This means that there are two different valuation function $v_i$ and $v_i^'$ of some voter $i$ s.t. $f(v_i, v_(−i)) = a != b = f(v_i^', v_(−i))$, while at the same time $a succ_i b -> a succ_i^' b$.\ Assume first that $b succ_i a$. In that case, voter $i$ with true value $v_i$ would have an incentive to misreport $v_i^'$
  and force the mechanism to output $b$ instead, a more preferable outcome, contradicting truthfulness.
  Similarly, assume that $a succ_i b$ with also implies $a succ_i^' b$. Then, voter $i$ with true value $v_i^'$ would have an
  incentive to misreport $v_i$ and force the mechanism to output a instead, $a$ more favourable outcome. In each case, truthfulness is contradicted.
]
#v(-6pt)
*Q*. _Why is the Median Voter Rule optimal for *TFL* for total social cost?_  Observe that any location lower than the median would make more than half the agents more unhappy and any location higher than this would make more than half the agents more unhappy, and
the rate at which the cost decreases or increases is the same\
*#underline[_Mechanism Design w/ Money_]*\
- Only possible monotone allocation $f$ gives item to the highest bidder
- *SPA* maximises social welfare, so its approximation ratio $eq$ 1. 
- *PoA* for *SPA* is not 1. Consider a *SPA* with two bidders having values $v_1, v_2$ such that $v_1 > v_2$. Then, the strategy profile where bidder $1$ bids $0$ and bidder $2$ bids $b > v_1$ is a *PNE* (bidder $2$ wins). At this equilibrium, the social welfare is $v_2$. Hence, the resulting *PoA* is $v_1/ v_2$, which is unbounded as $v_2 eq 0$ is possible.
#v(-3pt)
*#underline[_Revenue Calculation_]* \ 
*Note*: $X eq min{X_1, X_2}$ $->$ $Pr(X) eq Pr(X_1 > x, X_2 > x) eq Pr(X_1 > x) dot Pr(X_2 > x) $. The same works for _max_ but switch to $<$. 
#v(-3pt)
#example([Consider a single-item auction with two bidders with values drawn independently from the
uniform distribution over $[0, 1]$])[\
  Let $v_1, v_2$ be the valuations of the two bidders, \ 
  #underline[Expected revenue of *SPA*] 
  #v(-6pt)
  $
    EE_(v_1,v_2 tilde U[0,1]) eq EE(min{v_1, v_2}) eq integral_0^1 Pr(v_1 > x, v_2 > x) "d"x \
  $
  #v(-8pt)
  $
    eq integral_0^1 Pr(v_1 > x) dot Pr(v_2 > x) "d"x "(independent vars)" eq integral_0^1 (1 - x)^2
   $
   #v(-4pt)
   The above will be $1/3$\

  #underline[Expected revenue of *SPA* w/ generic Reserve Price]

  $EE["Rev"] eq EE[v_1,v_2<r] + EE[v_1>=r, v_2<r] \ + EE[v_1<r,v_2>=r] + EE[v_1, v_2 >= r] \
  eq 0 + 2 dot integral_0^r integral_r^1 r d x d y + integral_r^1 integral_r^1 min(x, y) d x d y \
            eq 2r^2 (1 - r) + integral_r^1 [ integral_r^y x d x + integral_y^1 y d x ] d y \
            eq 2r^2 (1 - r) + integral_r^1 ( [ x^2 / 2 ]_r^y + y(1 - y) ) d y \
eq 2r^2 (1 - r) + 1/2 [ y^3 / 3 - r^2 y ]_r^1 + [ y^2 / 2 - y^3 / 3 ]_r^1 = 1/3 + r^2 - 4/3 r^3 $
  
   
  #underline[Expected revenue of *SPA* w/ Reserve Price of 0.5] \
   Four cases: $min{v_1, v_2} > 1/2$, $v_1 < 1/2$, $v_2 < 1/2$, and $1/2 > max{v_1, v_2}$. \
   1. $
        Pr{"Rev" bar v_1, v_2 >= 0.5} eq integral_0.5^1 integral_0.5^1 min{x,y} "d"x "d"y  \ 
        
        eq integral_0.5^1 (integral_0.5^y x "d"x + integral_y^1 y "d"x) "d"y 

        eq integral_0.5^1 ([x^2/2]_0.5^y + y(1-y)) \
        
        eq integral_0.5^1 y^2/2 - 1/8 + y - y^2 eq integral_0.5^1 y - 1/8 -y^2/2 eq [y^2/2 - y/8 - y^3/6]_0.5^1 \
        
        eq  5/24 - 1/24 eq 4/24
      $
   2. $1/2 dot Pr(v_1 < 1/2, v_2 > 1/2) "(rev is 1/2 from reserve)" eq 1/2 * 1/2 * 1/2 eq 1/8$
   3. $1/2 dot Pr(v_1 > 1/2, v_2 < 1/2) eq 1/8$ (symmetric to above)
   4. $Pr{v_1 < x, v_2 < x, v_1 < 1/2, v_2 < 1/2} eq 0$ (no revenue!)
   #v(-2pt)
   Summing up all the above, we get $5/12$ \
    #underline[Maximum possible expected revenue] \
   Use _Myerson's optimal auction_ max revenue: $EE_(bold(v) tilde U[0,1])[max_(i in [n]) phi.alt_i (v_i)^+]$\ 
   Since we are dealing with a uniform dist, $phi.alt(v_i) eq 2 dot v_i - 1$. \
   Let $M eq max_(i in [v_1, v_2]) phi.alt_i (v_i)^+ eq max{2v_1 - 1, 2v_2 - 1}^+$. \
   To get $EE[M]$, we need its _pdf_, as $EE[M] eq integral_0^1 m * f_M (m)$ \ 
   To get the _pdf_, we first get the _cdf_. 
   #v(-4pt)
   $
    "F"_M (m) eq Pr(M <= m) \
    
    eq Pr(2v_1 - 1 <= m) dot Pr(2v_2 - 1 <= m) \

    eq Pr(v_1 <= (m+1)/2) dot Pr(v_2 <= (m+1)/2) 

    eq ((m+1)/2)^2
   $
   #v(-2pt)
   Then $f_M (m) eq "d"/("d"m)  ((m+1)/2)^2 eq (m+1)/ 2$\
   $therefore$ $EE(M) eq integral_0^1 m * (m+1)/2 eq [m^3/6 + m^2/4]_0^1 eq 5/12$. (same as *SPA* w/ reserve!)
]
Quadratic formula (why not?): $(-b plus.minus sqrt(b^2 - 4 a c))/(2a)$
