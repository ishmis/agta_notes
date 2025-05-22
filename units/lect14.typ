#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Approximate Mechanism Design: To Escape *GS* Thm
#v(-3pt)
#underline[_Option 1: Only have 2 candidates_]\
The *GS* theorem applies when there are $m >= 3$ candidates. If there were only two, then we can use #hh[threshold voting rules]. Assume there are only two candidates $a$ and $b$, then for every voter $i in N$, either $a succ_i b$ or $b succ_i a$
#v(-1pt)
#definition(hh[Majority Voting Rule])[
  If at least $n/2$ voters have $a succ_i b$, elect $a$, otherwise elect $b$
]
#v(-1pt)
#definition(hh[Threshold ($tau$) Voting Rule (TVR)])[
  If at least $tau dot n/2$ voters have $a succ_i b$, elect $a$, otherwise elect $b$, for some $tau in [0, 1].$
]
#v(-3pt)
*Note*: #hh[Majority] is just #hh[Threshold (1)].\ 
*Claim:* For settings with 2 candidates, every *TVR* is #hh[truthful]. 
#v(-3pt)
#proof[
  Assume $a$ is the winner, and consider a voter $i$. Then there are two cases: *1.* If $a succ_i b$, then $i$ has its top choice elected. *2.* If $b succ_i a$, then if voter $i$ misreports $a succ_i^' b$, $a$ still wins - so there is no point in _lying_. 
]
#v(-7pt)
*_Why does this not work for m $>=$ 3_?*\
Consider the following preference ranking profile:
#v(-3pt)
#grid(
  columns: (1fr, 2.4fr),
  [
    $
      "Alice:" a succ b succ c \ 
      "Bob:" b succ c succ a \
      "Caroll:" c succ a succ b
    $
  ],
  [
    There is *no* pairwise majority winner! (otherwise called a #hh[Condorcet] winner). The winner can be selected arbitrarily, but then #hh[truthfulness] can be violated if someone misreports!
  ]
)
#v(-3pt)
#underline[_Option 2: Remove ordinal + deterministic assumption_]\
Turns out that the *GS* theorem still applies even if we look at #hh[cardinal] rules due to the following result:
#v(-3pt)
#theorem[
  Every *truthful cardinal* rule has to be *ordinal*. 
]
#v(-3pt)
The *GS* theorem does *not* apply if we have _randomized_ voting rules which are _truthful in-expectation_ to replace _determinism_. However, the easier option is below: \
#underline[_Option 3: Remove unrestricted domain_]
Consider #hh[single-peaked preferences]
#v(-3pt)
== Single-Peaked Preferences
#v(-3pt)
Assume a finite set of outcomes and that for any given agent $i in N$, they prefer a particular "peak" from the outcomes and their utility falls as the actual outcome moves away from their _peak_. Finding the #hh[Condorcet] winner in this case can be found in two ways: \
*#underline[_Way 1: Median Voter Rule_]* \
#definition(hh[Median Voter Rule])[
  Select the median of the _reported_ peaks $x_i$, i.e. $f(succ) eq "med"{p_1, p_2, dots, p_n}$
]
#v(-3pt)
#theorem[
  The *median voter rule* is _truthful_
]
#v(-3pt)
#proof()[
  To affect the _median_, a voter with $p_i <= f(succ)$ must report something to the right of the median. However, the median will move farther away from $p_i$, so the _voters_ have no incentive to do that. Likewise, for all voters with $p_i >= f(succ)$, falsely reporting to the left of the median is not in their interest. 
]
#v(-5pt)
*#underline[_Way 2: Ordered Statistic Voter Rule_]* \
#definition(hh[K-th Order Statistic Voter Rule])[
  Select the _k-th ordered statistic_ of the reported peaks $x_i$, i.e. 
  #v(-3pt)
  $ 
    f(succ) eq {p_i : p_i "is at least as large as exactly" k "peaks"} 
  $
]
#v(-3pt)
#theorem[
  For any $k$, the _k-th order statistic voter rule_ is *truthful*
]
#v(-3pt)
#proof[
  This is near identical to the proof using _median_. Regardless of which order statistic is picked, no voter would prefer to report a peak that is on the other side of the statistic as this shifts the median further away from their actual peak. 
]
#v(-5pt)
== Characterization 
#definition(hh[Property: Anonymity])[
  A voting rule $f$ is #hh[anonymous] if renaming the voters does not change the outcome. 
]
#v(-4pt)
#theorem([Moulin])[
  A voting rule $f$ is _truthful_, _onto_ and _anonymous_, *iff* there exists $y_1, y_2, dots, y_(n-1)$ (candidates) s.t. for all $succ$, it holds that 
  #v(-3pt)
  $
    f(succ) eq "med"{p_1, p_2, dots, p_n, y_1, dots, y_(n-1)}
  $
]
#v(-3pt)
== Optimizing A Global Objective
#v(-3pt)
So far, we have not looked at any metric, i.e. a global objective, to actually pick a _truthful voting rule_. An objective could be to _maximize the social welfare_ or _minimize the social cost_ for example. For this, we look at comparing a picked _voting rule_ against approximations of the optimum. 
*#underline[_Approximation_]*\
If we cannot have an optimal voting rule, we can _approximate_ close to it. 
#v(-2pt)
#definition(hh[Approximation Ratio])[
  Measures the value of the optimal over the value of "our" algorithm, or the inverse of this ratio (or _minimization_ problems), taken worse-case over all possible inputs. 
]
#v(-3pt)
Now the question becomes _among all truthful voting rules or mechanisms, what is the one with the smallest possible approximation ratio?_
#v(-3pt)
== Truthful Facility Location (TFL) Problem
#v(-1pt)
#definition(hh[TFL])[ 
  1. There is a set of $N eq {1, dots, n}$ agents, each of which has an ideal location ("peak") $x_i$ on the real line $RR$ (making _TFL_ continuous!).
  2. Aim is to place a facility at some location $y in RR$. 
  3. The cost of an agent $i$ is defined as $bar y - x_i bar$. 
  4. A _mechanism_ asks the agent to report their peaks $x_i$ and output a location $y eq f (x_1,  dots, x_n)$. 
  5. Each agent aims to _minimize_ its cost. 
]
#v(-3pt)
The *TFL* problem can be given in two different objectives:\
#underline[_Objective 1: Minimizing Social Cost_]\
Goal is to design a truthful mechanism that aims to minimize the approximation ratio for the _social cost objective_, i.e. $sum_(i in N) bar y - x_i bar$. \
For this, we can use the #hh[median voter rule] (*MVM*). For comparisons, let $z in RR$ be some location other than the median
#figure(image("../figures/tfl_median_voter.png", width: 60%)) 
#v(-5pt)
Turns out, the social cost of the median is at most the social cost of any other location, hence we achieve a _approximation ratio_ of $1.0$. ($z$ has be the optimal at some point but this result still stands!) \
#underline[_Objective 2: Minimizing the Maximum Cost_]\
Goal is to minimize the approximation ratio for the #hh[maximum cost objective], i.e. $max_(i in N) bar y - x_i bar$. Turns out, the optimal in this case is exactly $(x_n + x_1) / 2$, i.e. the halfway point. Consider the below: 
#figure(image("../figures/tfl_median_voter_max_cost_objective.png", width: 70%)) 
#v(-3pt)
In this case, the median value gives a maximum cost that spans the entire range, whereas picking the halfway point will only give half that cost. Hence the approximation ratio of the *MVM* is at least 2 and at most 2. *Note*: the approximation ratio of *any* _k-th order statistic_ is exactly 2.
#v(-3pt)
#theorem([Procaccia and Tennenholtz])[
  The best possible approximation ratio achieved by any truthful mechanism for the maximum cost objective is *2*. This is achieved by any *k-th ordered statistic mechanism*.
]
#v(-3pt)
#proof[
  Assume by contradiction that there exists some truthful mechanism with approximation ratio $< 2$. The facility needs to be placed in the interior of the interval, *WLOG*, closer to the right endpoint Assume that agent with peak $x_5$ now reports $x_5^' eq y$: 
#v(-5pt)
#figure(image("../figures/tfl_lb_1.png", width: 60%))
#v(-7pt)
*_Claim_:* $y$ cannot move. If $y$ is moved beyond the right endpoint, then the ratio is bound to be $> 2$. If $y$ is moved between its current position and $x_5$, then we have that a misreport is bringing the outcome closer to the actual peak, violating _truthfulness_ of the mechanism. 
Lastly, we cannot have $y$ moved to any place left of its current position either. Imagine that $x_5$ was the misreport and $x_5^'$ is the true peak. On $x_5^'$, if y is moved left to some $y'$, then the agent could again misreport $x_5$ and $y'$ moves to $y$. 
#v(-3pt)
#grid(
  columns: (1fr, 1fr), 
  column-gutter: 3pt,
figure(image("../figures/tfl_lb_2.png", width: 100%)),
  [
     However, this means that the _truthfulness_ property is violated! *$therefore$* $y$ does not move. By extending this argument to $x_6$ and $x_7$, we get an _approximation ratio of 2.0_. 
  ]
)
#v(-6pt)
]
#v(-13pt)