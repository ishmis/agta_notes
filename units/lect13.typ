#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Mechanism Design
#v(-4pt)
#underline[*_Social Choice Setting_*] \
There is a set $N = {1, dots, n}$  of _voters_ (synonymous with players) and a set $A = {1, dots, m}$ of _candidates_ or _alternatives_. Every agent $i in N$ has a #hh[cardinal] (referring to how much something is preferred) utility $u_(i j)$ for each _candidate_ $j in M$. *Assumption*: all utilities are _distinct_. \
Sometimes, we only consider the #hh[preference ranking] of these utility values (i.e. their #hh[ordinal] value). 
#notation[
  Let $succ_(i)$ denote the #hh[ordinal] preference ranking of _voter_ $i in N$, where $alpha succ_i beta <-> v_(i alpha) > v_(i beta)$. That is, $alpha$ is ranked higher than $beta$, only if agent $i$ gains a higher utility $v_(i alpha)$ than $v_(i beta). $
]
#notation[
  Let $succ = (succ_1, dots, succ_n)$ denote a #hh[preference ranking profile]. 
]
#definition([#hh[Social Choice Function] or #hh[Voting Rule] or #hh[Mechanism]])[
  A function $f : (succ)^n -> A$ mapping preference profiles to candidates, where $(succ)^n$ is the space of all possible preference profiles. \
  The #hh[unrestricted domain] $(succ)^n$ can contain any preference profile, i.e. for any voter $i in N$, $succ_i$ is the set of _all permutations_ of ${1, dots, m}$. 
]
#v(-4pt)
#underline[*_Truthfulness_*:]\
#definition(hh[Truthfulness])[
  A voting rule is _truthful_, _strategyproof_, or _incentive-compatible_, if for any voter $i in N$, any *true* preference ranking $succ_i$ for the voter, any *reported* preference ranking $succ_i^(')$ of the voter, and any *reported* preference ranking $succ_(-i)$ of the remaining voters, it holds: 
  #v(-3pt)
  $
    f (succ_i, succ_(-i)) succ_i f(succ_i^', succ_(-i))
  $
]
#v(-3pt)
In other words, if $succ_(-i)$ are the reported preferences of other voters, let $alpha = f(succ_i, succ_(-i))$ be the candidate that gets _elected_ when _voter_ $i$ is telling the truth and let $beta eq f(succ_i^', succ_(-i))$ be the candidate _elected_ when _voter_ $i$ is lying. Then, the utility $v_(i alpha) > v_(i beta)$, i.e. being _truthful_ is more _favorable_.\  
*Note*: If the mechanism is #hh[truthful], then for each player, reporting their *true* preference ranking is the *dominant* strategy.\ 
#underline[*_Social Choice Functions_*:]\
#definition(hh[*Ordinal* Choice Function])[
  $f : (succ)^n -> Delta(A)$, mapping _reported_ *preference profiles* to _probability distributions_ over candidates. 
]
#definition(hh[*Cardinal* Choice Function])[
  $f : U^n -> Delta(A)$, mapping _reported_ *utility profiles* to _probability distributions_ over candidates. 
]
#v(-3pt)
where $(succ)^n$ is the space of all _preference profiles_ and $U^n$ is the space of all _utility profiles_. In simpler terms, a #hh[cardinal] voting rule is #hh[ordinal], if it disregards the numbers and only keeps the information about the relative ranking between the candidates. \
#underline[*_Expected Utility_*:]\
Given a reported utility profile $s$ as input, the expected utility of a voter $i in N$ from a randomized voting rule $f$ is $EE[u_i (f(s))]$, where the expectation is taken over the randomness of the algorithm.\
A #hh[mechanism] is #hh[truthful] (_in expectation_) if for any reported utilities $s_(-i)$ of the other voters, reporting the true utility $u_i$ maximizes the voter's expected utility, for all voters. \ 
#underline[*_Assumptions_*:]\
Our _voting rules_ are *deterministic* and *ordinal*.
#v(-4pt)
== Truthful Voting Rule w/ Unrestricted Domain 
#v(-3pt)
#underline[_Option 1: Fixed Candidate Rule_]\
_Idea_: completely disregard the preferences of the voters and always elect a fixed candidate. That is, $f(succ) eq alpha, forall succ$  $ in (succ)^n$. However, this violates the following #hh[property] or #hh[axiom]: 
#v(-2pt)
#definition(hh[Property: Onto])[
  A voting rule is #hh[onto] or #hh[surjective], if for any candidate $beta$, there exists some preference profile $succ$ such that $f(succ) eq beta$. 
]
#v(-3pt)
In other words, #hh[onto] ensures that no candidate is _a-priori_ excluded. \
#underline[_Option 2: Dictatorship_] \
Always elect the favorite candidate of a fixed voter, e.g. voter 1. Formally: $f(succ_i, succ_(-i)) eq "top"_(succ_i)$, where $"top"_(succ_i)$ is such that $"top"_(succ_i) succ_i beta$ for any other candidate $beta$. *Note*: this option _is_ #hh[onto]. 
#v(-3pt)
#theorem([Gibbard-Satterthwaite])[
  In the _unrestricted domain_, where there are $m >= 3$ candidates, a voting rule is *truthful* and *onto* if and only if it is *dictorial*. 
]
#v(-3pt)
*Note*: the above result is  a #hh[characterisation] as it identifies a class of rules. 
#v(-3pt)
== Proving the *GS* theorem
#v(-3pt)
In order to prove *GS*'s theorem, we need more #hh[properties]. 
#definition(hh[Property: Pareto Optimality])[
  A voting rule $f$ is #hh[Pareto optimal] or #hh[Pareto efficient] if, for any candidate $alpha in A$, if there is another candidate $beta in A$ that is _at least as good_ as $alpha$ for all voters, and _strictly better for one voter_, then $f(succ) != alpha$.
]
#v(-2pt)
As our setup involves _strict preferences_, the above #hh[property] translates to: if there exists $alpha, beta in A$ s.t. $beta succ_i alpha, forall i in N$, then $f(succ) != alpha$. 
#v(-3pt)
#lemma([13.1])[
  A voting rule $f$ is *Pareto optimal* if it is *truthful* and *onto*.  
]
#v(-4pt)
#proof[
  Assume by contradiction that $f$ is _truthful_ and _onto_, but it is *not Pareto optimal*. This means that for some input preference profile $succ$, $A succ B, forall i$, but $f(succ) eq B$. Let $succ^'$ be derived from $succ$ s.t. $A$ is ranked highest $forall i$. By _monotonicity_ (see _Lemma 13.2_), as the relative order of $A$ and $B$ has not changed, $f(succ^') eq B$ must be true. \
  Since $f$ is onto, for some $succ_("onto")$, $f(succ_("onto")) eq A$ must occur. If we move $A$ to the top for all voters, $succ_("onto-top")$ still gives $A$ as the winner via _monotonicity_. Finally, if we derive $succ^'$ from $succ_("onto-top")$ by rearranging everything but the top, by _monotonicity_ the winner should be $A$. This is a contradiction as we earlier we stated $f(succ^') eq B$. 
]
#v(-8pt)
#theorem([Gibbard-Satterthwaite, rephrased])[
  In the _unrestricted domain_, where there are $m >= 3$ candidates, a *ordinal*, *deterministic* voting rule is *truthful* and *Pareto optimal* if and only if it is *dictorial*. 
]
#v(-4pt)
#definition(hh[Property: Monotonicity])[
  Let $f(succ_i, succ_(-i)) eq alpha$ and $f(succ_i^', succ_(-i)) eq alpha^'$. A voting rule $f$ is #hh[monotone] if $alpha != alpha^'$ $->$ $alpha succ_i alpha^'$ and $alpha^' hl(succ_i^') alpha$. In other words, if voter $i$ changes its _reported_ ranking from $succ_i$ to $succ_i^'$, the winner changes from $alpha$ to $alpha'$ only if $alpha^'$ moved from *below* $alpha$ to *above* $alpha$ in ranking. 
]
#v(-3pt)
#lemma([13.2])[
  A voting rule $f$ is *truthful* *iff* it is *monotone*. 
]
#v(-3pt)
#proof([of 13.2])[\
  We go by contradiction. Assume that voter $i$ has two preference profiles $succ_i$ and $succ_i^'$, where $alpha succ_i alpha^'$ and $alpha succ_i^' alpha^'$ for two distinct candidates $alpha, alpha^' in A$. Furthermore, assume that under the profile $(succ_i, succ_(-i))$ the winner is $alpha$ and under the profile $(succ_i^',succ_(-i))$ the winner is $alpha^'$. That is, *monotonicity* is not followed. Assume that the _true ranking_ is $(succ_i^')$, but then voter $i$ could report $(succ_i)$ and make $alpha$ win, which the voter prefers *without* reporting the _truth_. Therefore, we have that *truthfulness* cannot follow when *monotonicity* is not present.
]
#v(-5pt)
*#underline[_Standard Truthfulness Argument_]*:\
Consider two profiles $(succ_i, succ_(-i)) "and" (succ_i^', succ_(-i))$. Assume that $f(succ_i, succ_(-i)) eq alpha$. Let $alpha'$ be such that the relative order of $alpha$ and $alpha'$ is the same in both rankings $succ_i$ and $succ_i^'$. #hh[Truthfulness] implies that $f(succ_i^', succ_(-i)) eq alpha$ too. 

#corollary([from monotonicity])[
  Assume that the winner is $alpha$. Then, any permutation of the rankings of candidates across different voters below $alpha$ will not affect the winner.  
]
#v(-4pt)
#lemma([13.3])[
  Consider a truthful voting rule $f$ s.t. $f(succ_i, succ_(-i)) eq beta$. Let $succ_i^'$ be such that some candidate $x$ is ranked higher in $succ_i^'$ than in $succ_i$. Then $f(succ_i^', succ_(-i)) in {beta, x}$.  
]
#v(-3pt)
#proof([Sketch of *GS*])[
  Consider any preference profile $succ$, with $n$ voters, in which all voters rank candidate $b in A$, last. In this case $f(succ) != b$ given #hh[Pareto optimality]. Assume that $f(succ) eq y$ for some $y in A$.  
  #v(-3pt)
  #figure(image("../figures/gs_proof_1.png", width: 80%)) 
  #v(-3pt)
  The above is a new preference profile after modifying $succ$ s.t. $b$ is now the top choice of the first $r-1$ voters. By _lemma 13.3_, it must be the case that we select with $b$ or $y$. Assume that we only switch to $b$ if the _pivotal voter_ $r$ also picks $b$ to be their top choice, by #hh("Pareto Optimality").
  #v(-3pt)
  #figure(image("../figures/gs_proof_2.png", width: 80%)) 
  #v(-3pt)
  In the case above, by _monotonicity_, regardless of any permutation of the above, as long as the ranking of $b$ is not changed - $b$ will be elected. To summarise, our #hh[established facts] are that: *1)* whenever the first $r$ voters rank $b$ first, then $b$ is elected and *2)* whenever the last $n - r + 1$ voters rank $b$ last, $b$ is not elected.\
  The rest of this proof involves making arguments about #hh[monotonicity], #hh[Pareto optimality], #hh[lemma 13.3] and our #hh[established facts]. *Conclusion*: winner is the candidate $r$ puts on top, regardless of others rankings. Voter $r$ is a _dictator_.
]
#v(-5pt)