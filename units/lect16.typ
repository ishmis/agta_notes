#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Single Parameter Domains 
#v(-3pt)
Informally, a domain is #hh("single-parameter") if the value of each agent for the possible outcomes can be #hh("encoded by a single value") $v_i$. To summarize: #hh[single-parameter] $subset$ #hh[quasilinear domain] $subset$ #hh[unrestricted domain].
#v(-1pt)
#definition(hh("Single-Parameter Domain"))[
  $exists$ a set of "#hh("winning outcomes")" #hh($W_i$) for agent $i$, and $v_i (a) in [t^0, t^1]$ if $a in W_i$ and $v_i (a) = 0$ otherwise.
]
#v(-3pt)
#underline[_Examples of Single-Parameter Domains:_]\
*1. SPA*, *2. Bilateral-Trade*: one item for sale, seller has a value of $v_s$ for the item and the buyer has a value of $v_b$. The possible outcomes are {trade, no-trader}, *3. Public-Project*: a public project with cost $C$ is to be done, which is valued by each citizen at $v_i$. The gov wants to implement the project if $sum_i v_i > C$. 
#v(-1pt)
== Characterization of Single-Parameter Domains
#v(-1pt)
#definition(hh("Monotonicity (Single-Parameter)"))[
  A social choice function $f$ in the single parameter domain is called _monotone_ in the agents value $v_i$, if, for every $v_(-i)$ and every $v'_i >= v_i$: $ f(v_i, v_(-i)) in W_i => f(v'_i, v_(-i)) in W_i$
]
#v(-2pt)
If value of agent $i$ increases + $i$ was winning before $-> i$ is still winning.
#definition(hh("Critical Value"))[
  The critical value of a social choice function $f$ in the single parameter domain is 
  #v(-3pt)
  $ 
  c_i (v_(-i)) = sup_(v_i : f(v_i, v_(-i)) eq.not W_i) v_i \
  "sup is the supremum: the maximum not necessarily part of the set" V
  $
  #v(-1pt)
]
#v(-3pt)
The largest value for which $i$ *does not win* - exists by *monotonicity*. 
#v(-3pt)

#theorem([Myerson's Characterisation])[
  Let $(f, p_1, ..., p_n)$ be a mechanism on a single-parameter domain, _for which the losers pay 0_. Then $(f, p_1, ..., p_n)$ is *truthful* *iff* the following conditions hold:
  1. _Condition on the SCF (allocation)_: $f$ is *monotone*
  2. _Condition on the payments_: The payment $p_i$ of every winner is the *critical value*. For every $i, v_i$ and $v_(-i)$ such that $f(v_i, v_(-i))in W_i$, we have that $p_i = c_i (v_(-i))$.
]
#v(-3pt)
#proof([of Myserson's])[\
_#underline[One Direction: Monotone + Critical Value Payment (CVP) => Truthful]_\
Assume with real value $v_i$ that the agent $i$ is *winning*. \ 
Utility is: 
$ v_i -p_i = v_i - c_i (v_(-i))$  \
Utility $>=0$ as by definition of $i$ winning, must be true that $v_i >= c_i (v_(-i))$. \
1. Case 1: Misreport $> c_i (v_(-i))$: Still winning, utility is unchanged.
2. Case 2: Misreport $< c_i (v_(-i))$: Loses, utility of 0.
#v(-3pt)
There is no benefit of misreporting. \ 
Now assume with real $v_i$ that agent $i$ is *losing*.
1. Case 1: Misreport $> c_i (v_(-i))$: Winning but negative utility :(
2. Case 2: Misreport $< c_i (v_(-i))$: Still losing, utility is 0
#v(-2pt)
$therefore$ no agent misreports whether they win or lose $->$ *truthfulness*! \
*Note:* *CVP* is _dependent_ on _monotonicity_, so arguing w/ *CVP* suffices.\
#underline[_Other Direction: Truthful => Monotone + Critical Value Payment_]\
*_1. Proving Truthful $->$ Monotonicity_ *\
Assume by contradiction that $f$ is *not monotone*. That means that with a higher value $v_i ' > v_i$, the agent #highlight[loses], whereas with $v_i$ the agent #highlight[wins]. Let payment in the latter case be $p(v_i, v_(-i))$ and by _truthfulness_:
#v(-2pt)
#grid(
  columns: (1fr, 1fr), 
  [
    1. $u_i (v_i, p_i) = v_i - p(v_i, v_(-i)) #hl[>=] 0$, otherwise agent $i$ with real value $v_i$ could misreport $v_i '$, *lose*, and get 0 in utility.
  ], 
  [
    2. $u_i (v_i ', p_i) = v_i ' - p(v_i, v_(-i)) #hl[<=] 0$, otherwise agent $i$ with real value $v_i '$ could misreport $v_i$, *win*, and get _positive_ utility.
  ]
)
#v(-2pt)
This implies that $v_i ' <= v_i$, which contradicts our assumption. \
*_2. Proving Truthful $->$ Critical Value Payment_*\
First consider the claim below:\
*Claim*: Fix any $v_(-i)$. Let $v_i$ and $v_i '$ be such that bidder wins with both. Then $p( v_i, v_(-i)) = p(v_i ′, v_(-i))$ \
*Proof of claim*: An agent with true value $v_i$ or an agent with true value $v_i '$ could increase its utility by misreporting the other value (assuming $v_i != v_i^'$). This breaks _truthfulness_, so claim holds. \
Next, let $v_i$ and $v_i^'$ be two distinct valuations for which _$v_i$ is the winning valuation_ and $p eq p_i (v_i, v_(-i))$. We will show that for any price $p_i != c_i (v_(-i))$, _truthfulness_ is violated and go by contradiction. 
1. Assume $p > c_i (v_(-i))$. Let $v_i^'$ be s.t.  $c_i (v_(-i)) < v_i ' < p$. By definition of a _critical value_, $v_i '$ is a winning bid. However, using the claim above, $p( v_i, v_(-i)) = p(v_i ′, v_(-i))$. $therefore$ An agent with true value $v_i '$ has negative utility, so it would prefer to bid 0 and *lose*, violating truthfulness.
2. Assume $p < c_i (v_(-i))$. Let $v_i^'$ be s.t. $p < v_i ' < c_i (v_(-i))$. By definition of a _critical value_, $v_i '$ is a losing bid. $therefore$ An agent with true value $v_i '$ gets utility 0, so they prefer to bid $v_i$ and *win*, gaining positive utility, and violating truthfulness.
#v(-3pt)
This leaves us with the only option $p = c_i (v_(-i))$, which is exactly *CVP*
]
#v(-5pt)
#underline[_SPA is Truthful_]: $c_i$ and $p_i$ is the _*_second highest bid_*_ and $f$ is *monotone*. \
#underline[_FPA Not Truthful_:] $f$ is *monotone*, but $p_i$ is not $c_i$. \
*#underline[_SPA w/ Reserve_ :]* Just a *SPA* but the _winner pays the maximum of the bid of the second highest bidder and a reserve price_ $hat(p)$. For this, the $c_i$ and $p_i$ is the max of the second highest bid and $hat(p)$. 
#v(-3pt)
== Randomised Mechanisms
#v(-1pt)
#definition(hh("Deterministic Mechanism"))[
  An agent either wins or loses.
]
#v(-1pt)
#definition(hh("Randomised Mechanism"))[
  Agent is winning with some probability $w_i (v_i, v_(-i))$. The utility of an agent is 
  #v(-2pt)
  $
    v_i dot w_i (v_i , v_(-i)) - p_i (v_i, v_(-i)) 
  $
  #v(-2pt)
]

#definition(hh("Normalised Mechanisms"))[
  Lowest $v_i$ has $Pr eq 0$ of winning, i.e $w_i (v_i ^ cal(l))=0 "for" v_i ^cal(l) = min_i v_i$, and incurs 0 payment: 
  $p(v_i ^cal(l), v_(-i)) = 0$
]
#v(-3pt)
#theorem([Myerson's Characterisation for Randomised Mechanisms, Myserson's Lemma])[
  Let $(f, p_1, ..., p_n)$ be a _normalised_ randomised mechanism on a single-parameter domain, _for which the losers pay 0_. Then $(f, p_1, ..., p_n)$ is *truthful* *iff* the following conditions hold:
  1. _Condition on the SCF (allocation)_: $w_i (v_i, v_i ')$ is *monotonically non-decreasing* in $v_i$
  2. _Condition on the payments_: The payment $p_i$ of every winner is given by the following: $p_i (v_i, v_(-i)) = v_i dot w_i (v_i , v_(-i)) - integral_(v_i ^cal(l))^(v_i) w_i (t, v_(-i))"dt"$.
]
#v(-6pt)
#figure(image("../figures/randomised_payment_and_utility.png", width: 80%), caption: [
  Pictorial proof of _Myerson's Characterization_. The above shows an agent being _truthful_ and reporting $v_i$ for their true value $v$. If $v_i > v$, the utility does not change and if $v_i < v$, then utility would be 0. That is, there is no reason for the agent to _misreport_. 
]) 
#v(-3pt)
*Note*: Monotonicity *is* important, as otherwise area under the integral could be larger when misreporting. Intuitively, the higher the valuation, the more likely the agent wins. 
#v(-3pt)
== Direct Revelation & General Mechanisms
#v(-4pt)
So far we have seen *truthful, direct revelation mechanisms*;
#v(-2pt)
#definition(hh("Direct Revelation Mechanism (DR)"))[
  All the mechanisms that we have seen so far are of the following form: *1.* The agents declare their values/preferences up front, and *2.* The mechanism chooses an outcome (and payments) based on this declaration.
]
#v(-3pt)
#underline[_Properties of DR Mechanisms_]
*1.* For every valuation/preference profile, the corresponding game has a #hh("DSE"). *2.* At this #hh[DSE], every agent *truthfully* reports her true value\
*#underline[_More General Mechanisms_]* \
Should we look for a _non truth-telling_ mechanism w/ a *DSE*? No point.
#v(-3pt)
#theorem([The Revelation Principle])[
If there is an _arbitrary mechanism_ which has a *DSE*, then there is a _direct revelation truthful mechanism_ (which uses the same payments and those obtained in the *DSE*).
] 
#v(-3pt)
