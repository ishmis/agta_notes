#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Mechanism Design w/ Money
#v(-1pt)

#definition(hh[Auction])[
  A _mechanism_ for buying or selling goods or services by means of eliciting bids from interested parties. 
]
#definition(hh[FPA])[
Each bidder submits their bid independently, w/o seeing the bid of others. The winner is the bidder with the highest bid (on ties, a random bidder is picked among those tied). The _winner_ must pay their bid and the rest pay nothing. *Note*: *FPA* is *not* _truthful_.
]
#v(-4pt)
== First-Price Auctions (FPA)
#v(-2pt)
#definition(hh[FPA (Formally)])[
#v(-3pt)
#grid(
  columns: (1fr, 1.5fr),
  [
    1. There are $n$ bidders from a set of $N$. 
    2. There is *one* item for sale
    3. Each bidder has a value $v_i$ for the item - i.e. the _willingness_ to buy it
    
  ],
  [
    4. Each bidder choses a bid $b_i eq beta(v_i)$ according to some function $beta$. 
    5. Let $W eq {i: b_i >= b_j, forall j}$ be the set of _possible winners_ 
    6. The #hh[utility] of bidder $i$ is 
      *$(v_i - b_i) dot 1/(bar W bar), "if" i in W, "else" 0$*
  ]
)]
#v(-3pt)
We can generalize the above to include two functions:
1. *Allocation func* $f: B^n -> {0,1}^n$, decides who wins given the bids
2. *Payment func* $p: B^n -> RR^n$, decides how much each bidder pays
#v(-3pt)
== Second-Price Auction (SPA)
#v(-1pt)
#definition(hh[SPA])[
  Similar to *FPA*, the winner is still the bidder with the highest bid, but now the _winner_ needs to pay the bid of the *second* highest bidder and the rest do not pay anything. 
]
#v(-2pt)
#proof([(informal) of truthfulness of SPA])[
  Assume you value is $v_i eq 5$ and you have the highest bid. Let the second highest bid $b_j eq 4$. If you bid more than $5$, you still get $u_i eq 5 - b_j eq 1$. If you bid less between 5 and 4, you still get $u_i eq 1$. If you go below $4$, you lose. No incentive to lie.\
  On the flip-side, if you are the second highest bidder and you bid your valuation $v_j$, you would need to bid higher to win. However, this means your utility will be negative, so you don't change. 
]
#v(-5pt)
== Beyond Single-Item Auctions
#v(-2pt)
#definition(hh[A (direct revelation) Mechanism] )[ This consists of two parts:
  1. A #hh[social choice function] or #hh[allocation function] $f: V_1 crossmark dots crossmark V_n -> A$ which selects an outcome given the valuations of the agents
  2. A #hh[payment function] $p_i: V_1 crossmark dots crossmark V_n -> RR$ which selects a payment for each agent $i in N$
  #v(-3pt)
  The utility of an agent is #hh[quasilinear]: $u_i (a, p_i) eq v_i (a) - p_i (v_1, dots, v_n)$
  #hh[Truthfulness:] $v_i (a) - p_i (v_1, dots, v_i, dots v_n) >= v_i^' (a) - p_i (v_1 ,dots, v_i^', dots, v_n)$
]
#v(-3pt)
== Grove's Mechanisms
#v(-3pt)
These mechanisms are designed for multi-item auctions. Under #hh[Grove's Mechanisms], the social choice and payment functions are:
#v(-3pt)
$
  "Social Choice Function:" f(v_1, dots, v_n) eq "arg" max_(a in A) sum_(i in N) v_i (a) \

  "Payment Function:" p_i (v_i, v_(-i)) eq h_i (v_(-i)) - sum_(j in N:hl(j!=i)) v_j (f(v_i, v_(-i)))
$
#v(-5pt)
We *maximize* _social welfare_ with the social choice function. The function $h_i (v_(-i))$ is just some constant for a given agent $i$, the function does not depend on the value of the agent $i$.
#v(-3pt)
#example([*VCG*])[\
  Consider an auction of 3 items $A, B, C$ with 3 bidders $1,2,3$. The possible outcomes are all possible ways to assign $A, B, C$ to three disjoint sets. To avoid having to specify values $v_i (a)$ for every possible outcome, we will make the _reasonable assumption_ that an agent cares only about their own allocation of items.
  #v(-5pt)
  #figure(image("../figures/groves_example.png", width: 80%))
  #v(-3pt)
  If we consider the outcome that agent 1 gets $(A,B)$ and agent 2 gets $C$, then out payment functions are as follows:
  #v(-3pt)
  $
    p_1 eq h_1(v_2, v_3) - 7 "," p_2 eq h_2(v_1, v_3) - 11 "," p_3 eq h_3(v_1, v_2) - 18
  $
  #v(-4pt)
]
#theorem[
  Every Groves mechanism is *truthful*.
]
#v(-3pt)
#proof[ Fix an agent $i in N$, its _true valuation_ $v_i$ and any _misreported valuation_ $v_i^'$. Let $a eq f(v_i ,v_(-i))$ and $a' eq f(v_i^', v_(-i))$. We can write the #hh[utilities] in each case as:
#v(-4pt)
$
  u_i (v_i, v_(-i)) eq v_i (a) + sum_(j!=i)v_j (a) - h_i (v_(-i)) eq sum_(j in N) v_j (a) - h_(i) (v_(-i)) \
  
  u_i (v_i^', v_(-i)) eq v_i^' (a') + sum_(j!=i) hl(v_j (a')) - h_i (v_(-i)) eq sum_(j in N) v_j (a') - h_(i) (v_(-i))
$
#v(-4pt)
However, $u_(i) (v_i, v_(-i)) >= u_i (v_i^', v_(-i))$ as $sum_(j in N) v_j (a) >= sum_(j in N) v_j (a')$ from the fact that Grove's social choice function picks the social welfare maximizing outcome ($a$ in this case), via the #hh("Social Choice Function").
]
#v(-5pt)
== Desirable Properties and VCG Mechanism
#v(-2pt)
#definition(hh[Property: Individual Rationality])[
  A _mechanism_ satisfies _individual rationality_, or _voluntary participation_, if *all agents* always get *non-negative utility*, i.e. for every agent $i$ and any profile $(v_i, v_(-i))$, we have that $v_i (f(v_i, v_(-i))) - p_i (v_i, v_(-i)) >= 0$.
]
#definition(hh[Property: No Positive Transfers])[
  A _mechanism_ satisfies _no positive transfers_, or _budget balance_, if *no agent* is ever *paid any money*, i.e., for every agent $i$ and any profile $(v_i, v_(-i))$, we have $p_i (v_i, v_(-i)) >= 0$. 
]
#v(-2pt)
*Note*: In settings with costs, these properties become "all agents always get non-positive cost" and "no agent ever pays any money". 
#definition(hh[Vickery-Clarke-Groves (VCG) Mechanism])[
 This has exactly the same _social choice_ and _payment function_ as Grove's _mechanism_, except that it defines #hl($h_i (v_(-i)) eq max_(b in A) sum_(j in N: j!=i) v_j (b)$). Hence, the _payment function_, $p_i (v_i, v_(-i))$, is:
 #v(-4pt)
 $
  overbrace(max_(b in A) sum_(j in N: j!=i) v_j (b), "max social welware if bidder" i "did not participate") - overbrace(sum_(j in N: j!=i) v_j (f(v_i, v_(-i))), "the social welfare of the other bidders")
 $
 #v(-4pt)
 The first term above is the #hh[Clarke pivot rule] and it guarantees #hh[individual rationality] and #hh[no positive transfers]. 
]
#v(-4pt)
#theorem[
  The *VCG* _mechanism_ is _truthful_ and satisfies _individual rationality_ and _no positive transfers_. 
]
#v(-4pt)
#proof[
  Let $a eq f(v_i,v_(-i))$ be outcome maximizing $sum_(i in N) v_j (a)$ and let $b$ an outcome maximizing $sum_(i in N: i != j) v_j (b).$ Then the utility of agent $i$ is:
  $
    v_i (a) + sum_(j!=i) v_j (a) - sum_(j!=i) v_j (b) >= sum_(j) v_j (a) - sum_j v_j (b) >= 0
  $
  #v(-3pt)
  Above guarantees #hh[individual rationality]. The payment of the agent: 
  #v(-3pt)
  $
  sum_(j!=i) v_j(b) - sum_(j!=i) v_j (a) >= 0
  $
  #v(-3pt)
  The above guarantees #hh[no positive transfers]. 
]
#v(-5pt)
Referring back to the *VCG* example, we get the following:
#v(-3pt)
$
    p_1 eq h_1(v_2, v_3) - 7 "," p_2 eq h_2(v_1, v_3) - 11 "," p_3 eq h_3(v_1, v_2) - 18 \
    "becomes"\
    p_1 eq 17 - 7 eq 10 ", " p_2 eq 18 - 11 eq 7", " p_3 eq 18 - 18 eq 0
$
#v(-3pt)
*Note*: *SPA* is a special case of *VCG*. In *SPA*, the social-welfare maximizing outcome is when the person with the highest valuation wins. Then their payment is: 
#v(-3pt)
$
  overbrace("second highest bid", "max social welfare if bidder" i "did not particiapte") - overbrace(0, "social welfare of other bidders")
$
#v(-3pt)
== VCG Drawbacks
#v(-3pt)
Susceptible to #hh[collusion] between agents. Susceptible to #hh[shill bid] manipulations (auctioneer can add a fake bid to increase price). Lastly, it may be #hh[computationally inefficient]. (NP-hard to find social welfare maximizing allocation) \ 
#underline[*_Representation of Valuations_*] \ 
The agents currently need to specify their values for every possible subset of items ($2^N$!). There are ways to fix this:\
#underline[_Way 1: Additive Valuations_: ]\
Value of set of items is the sum of each individual item: $v_i (S) eq sum_(a in S) v_i (a)$. A poly-time algo to compute the social welfare-maximizing outcome is to just give each item to the agent which values it most\
#underline[_Way 2: Multi-Unit Auctions_: ]\ 
All items are identical and value depend on $\#$ of items only, i.e. $v_i (bar S bar)$\. The bidder only specifies the value for one item $v_i$ and the value for the set $S$ is $bar S bar dot v_i$.\
#underline[_Way 3: Single-Minded Valuations_: ]
#v(-2pt)
#definition(hh[Single-Minded Valuation])[
  A valuation function $v_i$ is single-minded, if there exists a set of items $S^*$ and a value $v^* >= 0$ s.t. $v_i (S) eq v^*$ for all $S subset.eq S^*$, and $v_i (S) eq 0$ for all other sets of items $S$. That is, there is a set of items s.t. if the agent receives that set (or any superset of it), the agent is happy and unhappy otherwise. 
]
#v(-5pt)
#theorem[
  Computing the social welfare-maximizing outcome for agents with *single-minded* valuations is NP-hard.  
]
#v(-4pt)
== Weak-Monotonicity
#v(-1pt)
#definition(hh[Property: Weak Monotonicity])[
  A _social choice_ function $f$ satisfies _weak monotonicity_ if for all $i in N$ and all $v_(-i)$ we have that:
  #v(-3pt)
  $
    f(v_i, v_(-i)) eq a != b eq f(v_i^', v_(-i)) -> v_i (a) - v_i (b) >= v_i^' (a) - v_i^' (b)
  $
  #v(-3pt)
  That is, if changing our valuation s.t. a different outcome occurs is only possible if the relative difference between $a$ and $b$ has decreased. 
]
#v(-4pt)
#theorem[
  If a _mechanism_ $(f, p_1, dots, p_n)$ is _truthful_, then the social choice function $f$ is *weakly monotone*. 
]
#v(-4pt)
Additionally, if the sets of valuations $V_i$ are #hh[convex], then for every social choice function $f$ that is #hh[weakly monotone], there exists payment functions $p_1, dots, p_n$ s.t. the mechanism $(f, p_1, dots, p_n)$ is _truthful_. \
*Note*: #hh[(weak) Monotonicity] is a  #hh[local] characterization (limited to a specific agent). There is a #hh[global] one due to _Roberts (1979)_ (not covered).
#v(-3pt)