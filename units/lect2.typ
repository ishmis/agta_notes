#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Solution Concepts (SC) for Strategy Equilibriums 
== Dominant Strategy Equilibrium (DSE)\
#notation[
  $s_(-i) eq.def (s_1, s_2, dots, s_(i-1), s_(i+1), dots, s_n)$
]
#definition(hh[Dominant Strategy])[
  A pure strategy $s_i in S_i$ for player $i in N$, if it results in _at least as high utility_ as any other strategy $s_(i)^' in S_i$, #highlight[_regardless of the strategies of the others_]. 
  $ 
  u_i (s_i, s_(-i)) #hl($>=$) u_i (s_i^', s_(-i)) forall s_i^' in S_i "if" #hh[weakly dominant] \ 
  u_i (s_i, s_(-i)) #hl[$>$] u_i (s_i^', s_(-i)) forall s_i^' in S_i "if" #hh[strictly dominant] \
  $
]
#definition(hh[Dominant Strategy Equilibrium])[
  A *DSE* is a strategy profile $s = (s_1, dots, s_n)$ s.t. each $s_i$ is a dominant strategy.
]
#v(-3pt)
*Note* that the above can be either *weakly or strictly* dominating. In the case of *PD*, we get a *strictly dominating strategy* at $(D,D)$\
*Notes:*
1. A game *can* have *multiple DSE* $->$ consider any where the utility is the same regardless of strategy. 
2. A game can *only* have one *strictly dominant strategy*. 
3. *Not all games have a dominant strategy* (_weak or strict_). DSE is *not universal*. Recall the "choosing the TV show" game.
#notation[$x_(-i) eq.def Delta (S_1) crossmark .. crossmark Delta (S_(i-1)) crossmark Delta (S_(i+1)) crossmark .. crossmark Delta (S_n) = Delta (S_(-i))$
]
#definition[#hh[Dominant Mixed Strategy]][
  A mixed strategy $x_i in Delta (S_i)$ for player $i in N$, if it results in _at least as high utility_ as any other _mixed_ strategy $x_(i)^' in Delta (S_i)$, #highlight[_regardless of the strategies of the others_]. 
  $ 
  u_i (x_i, x_(-i)) >= u_i (x_i^', x_(-i)) forall x_i^' in Delta (S_i) "if" #hh[weakly dominant] \ 
  u_i (x_i, x_(-i)) > u_i (x_i^', x_(-i)) forall x_i^' in Delta (S_i) "if" #hh[strictly dominant] \
  $
]
#proposition[
  Every pure strategy $s_i$ in the support of a mixed (weakly) dominant strategy $x_i$ is a (weakly) dominant pure strategy.
]
*Note*: A direct result of the above is that if there are no (weakly) dominant pure strategies, then there are also no (weakly) dominant mixed strategies! \
$checkmark$ *Obviously Reasonable* outcome - anything else is _unreasonable_. \
$crossmark$ It is *NOT* _universal_ - there are games for which there is no *DSE* \ 
== Iterated Elimination of Dominated Strategies Equilibrium (IEDSE)\
#definition(hh[Strictly Dominated Strategy])[
  A pure strategy $s_i in S_i$ for player $i in N$, if it results _in a lower utility_ than some other strategy $s_i^' in S_i$ #highlight[_regardless of the strategies of others_]. 
  $ exists s_i^' in S_i "s.t." u_i (s_i^', s_(-i)) > u_i (s_i, s_(-i)),  forall s_(-i)  $
 *OR* if it results _in a lower utility_ than some other #highlight[mixed] strategy $x_i^' in Delta (S_i)$ #highlight[_regardless of the strategies of others_]. 
  $ exists x_i^' in Delta (S_i) "s.t." u_i (x_i^', s_(-i)) > u_i (s_i, s_(-i)),  forall s_(-i)  $ 
]
*Note*: both definitions for _dominated strategy_ are valid!
#definition(hh[IEDSE])[ 
   Any (_mixed_) strategy profile that assigns zero prob to any strategy that would be removed through iterated elimination of strictly dominated strategies. Such strategies are not in its #hh[support]. 
]
#v(-3pt)
*Note*: 
- *DSE* means players will only play obviously reasonable strategies, while *IEDSE* says that players will not play _obviously unreasonable strategies_. Further, if $x$ is a *DSE*, then it is also an *IEDSE*.  
- In a $2 crossmark 2$ game, no pure strategy is strictly dominated by a mixed strategy, so #hh[IEDSE] will not simplify the game any further!
#v(-3pt)
$checkmark$ It is _universal_   
$crossmark$ Allows for some _unreasonable_ outcomes. 
  #v(-3pt)
== Pure Nash Equilibrium (PNE)
#definition(hh[PNE])[
  A pure strategy profile $(s_1, s_2, dots, s_n)$ s.t. for any player $i in N$, #highlight[fixing the pure strategies #hl[$s_(-i)$] of other players], player $i$ _cannot get a higher utility_ from choosing a different pure strategy.  
  #v(-3pt)
  $ s_i in "argmax"_(hat(s_i) in S_i) u_i (hat(s_i), s_(-i)) "or" \ u_i (s_i, s_(-i)) >= u_i (s_i^', s_(-i)), forall s_i^' in S_i "and" s_(-i) "is fixed" $
]
#v(-2pt)
#definition[
  If $s_i$ is a *PNE* with fixed $s_(-i)$, then $s_i$ is the #hh[pure best response] to $s_(-i)$ - player $i$ does not have a profitable #hh[unilateral deviation]. 
]
#corollary[
  From the definitions of both, we note that "$s$ is a *DSE* $->$ $s$ is a *PNE*". The converse is false! 
]
#v(-3pt)
$checkmark$ Much more _reasonable_ and _stable_ outcome. \
$crossmark$ It is *not universal*. May not always exist (e.g. rock-papers-scissors). 
#v(-3pt)
== Mixed Nash Equilibrium (MNE)
#definition(hh[MNE])[
  A mixed strategy profile $(x_1, x_2, dots, x_n)$ s.t. for any player $i in N$, #highlight[fixing the mixed strategies #hl[$x_(-i)$] of other players], player $i$ _cannot get a higher utility_ from choosing a different mixed strategy.  
  #v(-3pt)
  $ 
  x_i in "argmax"_(hat(x_i) in Delta (S_i)) u_i (hat(x_i), x_(-i)) \ 
  "where" 
   u_i (x_i^', x_(-i)) eq EE_((s_i, s_(-i))tilde (x_i, x_(-i))) [u_i (s_i, s_(-i))] \ "or" 
   u_i (x_i, x_(-i)) >= u_i (x_i^', x_(-i)), forall x_i^' in Delta (S_i) "and" x_(-i) "is fixed" 
  $
]
#definition[
  If $x_i$ is a *MNE* with fixed $x_(-i)$, then $x_i$ is the #hh[mixed best response] to $x_(-i)$ - player $i$ does not have a profitable #hh[unilateral deviation]
]
#proposition(number: "1")[
  A mixed strategy profile $x = (x_i, x_(-i))$ is a *MNE* *iff* $forall i in N$ and *every pure strategy $s_i^' in S_i$*, we have:
  #v(-3pt)
  $ 
    u_i (x_i, x_(-i)) >= u_i (s_i^', x_(-i))
  $
] <prop1>
#proof([of Proposition 1])[\
  #underline[One direction:] $(x_i, x_(-i))$ is a *MNE*, so by definition that implies $u_i (x_i, x_(-i)) >= u_i (x_i^', x_(-i)), forall x_i^' in Delta (S_i)$. However as all pure strategies are also within the set of all mixed strategies (single strategy in their #hh[support]), we have that $u_i (x_i, x_(-i)) >= u_i (s_i^', x_(-i)), forall s_i^' in Delta (S_i)$ \
  #underline[Other direction:] $u_i (x_i, x_(-i)) >= u_i (s_i^', x_(-i)) -> (x_i, x_(-i))$ is a *MNE*. To prove $(x_i, x_(-i))$ is a *MNE*, we need to prove that $u_i (x_i, x_(-i)) >= u_i (x_i^', x_(-i)), forall x_i^' in Delta (S_i)$:
  #v(-2pt)
  $ u_i (x_i^', x_(-i)) 
    &eq EE_((s_i, s_(-i))tilde (x_i, x_(-i))) [u_i (s_i, s_(-i))] \ 
    &eq sum_(s_1 in S_1) dots sum_(s_n in S_n) x_1 (s_1) dot dots dot x_n (s_n) dot u_i (s_1, dots, s_n) text("    (1)")\ 
    &eq sum_(s_i in S_i) x_i^' (s_i) dot EE_(s_(-i)tilde x_(-i)) [u_i (s_i, s_(-i))] eq sum_(s_i in S_i) x_i^' (s_i) u_i (s_i, x_(-i)) \ 
    &<=  sum_(s_i in S_i) x_i^' (s_i) u_i (x_i, x_(-i)) \
    &eq u_i (x_i, x_(-i)) dot sum_(s_i in S_i) x_i^' (s_i) eq u_i (x_i, x_(-i)) $
    #v(-12pt)
] 
#v(-5pt)
*Note* the above proposition is handy when proving that some $x$ is an *MNE* as one does not need to compare against infinitely many mixed strategies, but only against some pure (_likely finite_) pure strategies.  
#v(-3pt)
#theorem("Nash")[
  Every finite normal-form game has at least one _MNE_
]
#v(-3pt)