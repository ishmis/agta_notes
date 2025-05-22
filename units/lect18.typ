#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Bayesian Games and First-Price Auctions 
#v(-2pt)
#definition(hh("(Pure) Bayes-Nash Equilibrium"))[
  A (pure) strategy profile $s= (s_i, ..., s_n)$ such that every player maximises its expected utility. The expectation is taken over the uncertainty about the #hh[type] of the others.
  *Note:* We can similarly define a #hh("mixed Bayes-Nash equilibria").
]
#definition(hh("Baysian Games"))[ of #hh("incomplete information") model uncertainty about the values of the other players. It is a tuple $(N, A, Theta, p , u)$ where: 
#v(-3pt)
1. $N$ is a set of $n$ agents - *#hh("the bidders")*
2. $A = A_1 times ... times A_n$ is the set of _actions_ profiles. $A_i$ is the set of available actions to $i$. - *#hh("the bids") #hh($b_1, b_2, ..., b_n$)*
3. $Theta = Theta_1 times ... times Theta_n$, where $Theta_i$ is the set of #hh("types") of player $i$ - *#hh("the value") #hh($v_1, v_2, ..., v_n$)*
4. $p^i : Theta -> [0, 1]$ is the #hh("joint prior") over types, from the perspective of $i$ - *#hh("the distributions") #hh($F_(i j)$)*
5. $u = (u_1, ..., u_n)$ is the utility func for player $i$, with $u: A times Theta -> bb(R)$ 
6. A strategy $s_i$ is a function $s_i : Theta_i -> A_i$, which prescribes an action for every type - *#hh("A function") #hh($beta)$) #hh("mapping values to bids")*
7. $U_i (s_i, s_(-i); theta_i)$ is the expected utility of $i$ when their type is $theta_i$ and strategies $s_i, s_(-i)$. 
]
#v(-2pt)
*Note:* The expectation is taken over prior $p$. It follows that:
#v(-2pt)
$ 
  U_i (s_i, s_(-i); theta_i) = p_1 dot u_i (s_i (theta_(i 1)), s_(-i) (theta_(-i))) + p_2 dot u_i (s_i (theta_(i 1)), s_(-i) (theta'_(-i))) + dots \

  "where" p_1, p_2 "is the prob of" theta_(-i), theta'_(-i) "taken from the prior, respectively"
$
#v(-3pt)
== Auctions as Bayesian Games
#v(-3pt)
Model the #hh("beliefs") of bidders for #hh("other bidders") via #hh("probability distributions"):
- For each pair of bidders $i$ and $j$, there is a probability distribution $F_(i j)$ which captures the beliefs of bidder $i$ for the values of bidder $j$.
- Can be a #hh("discrete") or #hh("continuous") distribution.
#v(-2pt)
#definition(hh("Objective Beliefs"))[
  Given a bidder $J$, every bidder $i$ has the same beliefs about $j$, i.e., $F_(i j)=  F_j, forall i$
]
#v(-1pt)
#definition(hh("Symmetric Beliefs"))[
  The values of all bidders come from the same distribution, i.e., $F_(i)=  F_j, forall i, j$. Everyone bids the same.
]
#v(-3pt)
#underline[_The Bidder's Optimisation Problem_]: A bidder $i$ would like to come up with a function $beta_i : V -> B$, which given:
1. The bidding functions $beta_1, beta_2, ..., beta_(i-1), beta_(i+1), ... beta_n$ of all the other bidders
2. The beliefs $F_(i j)$ of the bidder for the values of any other bidder $j$.
#v(-4pt)
Maximises the expected utility of the bidder $i$:
#v(-3pt)
$ 
  bb(E)_(v_j ~ F_(i j), forall j eq.not i) [underbrace((v_i - beta(v_i)), "Winner's utility") dot underbrace(1/(W(beta_1 (v_1), ..., beta_n (v_n))), "Scale by # of winners")] 
$
#v(-3pt)
== Bayes-Nash Equilibria  
#v(-3pt)
*#underline[_Mixed Bayes-Nash Existence (MBNE)_]* \ 
Does a *mixed* #hh[Bayes-Nash] equilibrium always exist? 
- If the bids are infinite and/or the distributions are _continuous_, then #hh[Nash's Theorem] does not apply
- When the bids are finite and distributions are discrete, then we have a finite game. But as the game is #hh[Bayesian], it is not a *NFG* $->$ Nash does not apply here either.
- It can be proven that for a #hh[Bayesian] game with a finite #hh[type] space and finite _action_ space, a #hh[Bayes-Nash] equilibrium always exists. Idea is to transform the #hh[Bayesian] game into a _full-information_ *NFG*. 
#v(-3pt)
#underline[*_Pure Bayes-Nash Equilibrium (PBNE)_*] \ 
- If the distributions are #hh[discrete], then a *NE* might not exist
- If the distributions are #hh[continuous], then a *NE* _always_ exists. 
#v(-3pt)
#theorem([Vickey])[
  Consider a *FPA* with $n$ bidders whose values are drawn independently from the uniform distribution on $[0,1]$. Then the unique #hh[symmetric] equilibrium is for each bidder to bid $(n-1)/n dot v_i$.  
]
#v(-4pt)
*Note*: #hh[symmetric] refers to all bidders bidding the same $b_i$
#v(-3pt)
#proof([of Vickery (for when $n eq 2$)])[
  Let $s_i$ represent the bid of player $i$. We are trying to prove that a #hh[symmetric] equilibrium exists when $b eq (v_1/ 2, v_2/ 2)$. Assume the second player bids $s_2 eq v_2/2$. Then, the expected utility of bidder $1$ can be written as: 
  #v(-4pt)
  $
    EE[u_1] &eq integral_(0)^1 u_1 d v_2 &"  (1)" \
    &eq integral_(0)^(2 s_1) (v_1 - s_1) d v_2 + integral_(2 s_1)^1 0 d v_2 &"(2)" \
    
    &eq (v_1 - s_1) dot 2s_1 eq 2v_1 dot s_1 - 2 dot s_1^2 &"(3)"
  $
    #v(-3pt)
  If we maximize $(3)$ by checking where its derivative (w.r.t $s_1$) is 0:
  #v(-4pt)
  $
    d/(d s_1) (2v_1 s_1 - 2s_1^2) eq 0 => 
    2v_1 - 4s_1 eq 0 =>
    s_1 eq v_1/2 
  $
  #v(-4pt)
  Hence, the expected utility of player 1 is maximized (i.e. their best strategy) when they bid $v_1/ 2$!
]
#v(-6pt)
*Notes:*
1. In $(1)$ above we integrate (coz _uniform_ distribution) w.r.t to $v_2$ as the utility of a player is dependent on the prob of the other player's bids, which in this case happens to be linearly dependent on $v_2$ ($s_2$ is $v_2/ 2$)
2. In $(2)$, we split the integral depending on when player $1$ wins and loses. They *win* if $s_1 > v_2/2$, i.e. when $0 <= v_2 < 2 dot s_1$ (_our first range_). Similarly, they *lose* if $2 * s_1 < v_2 <= 1$ (_second range_).  
#v(-3pt)
#underline[_Beyond Uniform Distributions_]: Settings with symmentric beliefs have been show to have #hh("close form solutions (CFS)"), provided by Vickrey. For general settings, CFS may not exist. An alternative is describing an equilibrium via, e.g., a set of differential equations. These are not easy solve and may not exist.
#v(-3pt)
== Revenue of SPA
#v(-3pt)
#theorem("Bulow & Klemperer Corollary")[
  For $n$ bidders with regular, e.g., uniform, iid priors, the SPA achieves at least a #hl($(n-1)/ n$) fraction of the optimal expected revenue.
]
#v(-4pt)
#theorem("FPA")[
  For $n$ bidders with regular, e.g., uniform, iid priors, the *FPA* achieves #hl($ >= (n-1)/ n$) fraction of the optimal expected revenue.
]
#v(-4pt)
#theorem("Revenue Equivalence")[
  Suppose that the values of the bidders are drawn iid from a distribution. Then any *symmetric* and *increasing* equilibrium of any *direct revelation* (auction) mechanisms such that:
  1. The winner is the bidder with the highest bid
  2. The expected payment of any bidder with value 0 is 0
  #v(-3pt)
  has the same *expected revenue*
]#v(-4pt)
In other words, any auction mechamism that has the *same outcome* has the *same expected revenue* in equilibrium. \
#underline[_Example: All-Pay Auction_]: Winner is the highest bidder but every bidder pays their bid. #hh("Theoretically, in equilibrium"), does not make more money.
#v(-3pt)
== Representation of Auctions
#v(-1pt)
#definition(hh[Concrete CS Problem])[
  Given a *FPA* as input, design an efficient algorithm for finding an *NE* in an auction.
]
#v(-4pt)
#underline[_Discrete *FPA* representation_] \
*Input:* Each $v_i$ is given as a number in binary and each $F_(i j)$ is given explicitly as pairs $(v_(j k)^i, p_(j k)^i)$ in binary for every possible value $v_(j k)^i$. \
*Output*: $beta_i$ given explicitly as a vector $(beta_i (v_i 1), beta_i (v_(i 2)), dots)$\
#underline[_Continuous *FPA* representation_] \
*Input:* Each $v_i$ is given as a number in binary, but each $F_(i j)$ is now _continuous_. To represent distributions, we could do one of the following:
1. *Piece-wise constant densities*: Specify the tuples $(cal(l)_k, h_k, r_k)$ 
2. *Piece-wise linear densities*: Specify the tuples $(cal(l)_k, "angle", r_k)$ 
3. *Piece-wise polynomial densities*: For the $k$-th subinterval $[cal(l)_k, r_k]$, a list of rational coefficients of the polynomial 
#v(-3pt)
*Output*: $beta_i$ is now also _continuous_. Though we generally assume a #hh[discrete bidding space] (bids come from a _finite set_). E.g: multiples of 1p. We also assume a #hh[increasing bidding function], i.e. one with the property that $v_(i j) >= v_(i k) -> beta_i (v_(i j)) >= beta_i (v_(i k))$. \
*Fact* _(Athey)_: The _continuous_ *FPA* has *NE* where all $beta_i$ are #hh[increasing]. \
#grid(
  columns: (1fr, 1fr),
  figure(image("../figures/continuous_fpa.png", width: 70%)),
  [
    So, for each bid $b_j$, we specify the value $v_(i cal(l))$ for the bidder for which $beta_i (v_(i cal(l))) eq b_j$, thereby giving a _jump-point_ representation.
  ],
  
)




== Finding Equilibria in Auctions
#v(-3pt)
#underline[_Handling Irrational Numbers_]: Choose a rational number close to the irrational number to get an #hh("approximate NE").
#definition(hh[Discrete FPA Problem])[
  Given a discrete *FPA* and an $epsilon$ as input, decide if the auction has an *$epsilon$-NE* or not. If it does, return it.
]

#definition(hh[Continuous FPA Problem])[
  Given a continuous *FPA* and an $epsilon$ as input, find an *$epsilon$-NE* of the auction.
]
#v(-4pt)
#theorem()[
  The _discrete_ *FPA* problem is *NP*-complete.
]
#v(-4pt)
#theorem()[
  The _continuous_ *FPA* problem is *PPAD*-complete.
]
#v(-4pt)
Thus, cannot design efficient algors for finding Nash equilibria in the FPA in
general. But we are actually far from understanding the complexity of the problem:
- The hardness results require #hh[subjective beliefs] $(F_(i j) eq.not F_(cal(l) j))$ 
- For #hh[objective beliefs] $(F_(i j) eq F_(cal(l) j))$, we don't know similar hardness results or poly time algos
- For #hh[symmetric beliefs] $(F_(i) eq F_(j))$, we have poly time algos.
#v(-3pt)