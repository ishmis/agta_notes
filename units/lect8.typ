#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Proof of Nash's Theorem + $epsilon$-Best Responses
#v(-3pt)
This part is given very informally. We begin by proving #hh[Nash's Theorem] via #hh[Brouwer's fixed point theorem]. Then sketch a proof of _Brouwer_'s theorem using a lemma from topology (#hh[Sperner's Lemma]). Finally 
#v(-3pt)
== Nash's Theorem Proof
#v(-2pt)
#definition(hh[Convexity ])[
  A set $C subset RR^m$ is #hh[convex] if for every $x,y in C$ and $lambda in [0,1]$, we have that $lambda x + (1 - lambda) y in C$. 
]
#definition(hh[Closed ])[
  A topological space that contains its boundary.
]
#definition(hh[Bounded ])[
  A topological space where there is a bounded distance between every two points in that space. 
]
#definition(hh[Compactness])[
  A set $C subset RR^m$ both #hh[closed] and #hh[bounded]. 
]
#definition(hh[n-Simplex ])[
  This is given as: 
  #v(-3pt)
  $
    {y in RR^(n+1) : sum_(i=1)^n  y_i eq 1, forall i eq 1, dots, n, y_i >= 0}
  $
  #v(-3pt)
]
#theorem([Brouwer's Fixed Point Theorem])[
    Let $C subset RR^m$ be *convex* and *compact*, and let $f: C -> C$ be a *continuous* function. Then $f$ has a _fixed point_, i.e., $exists x in C$ s.t. $f(x) eq x$. 
]
#v(-3pt)
Initially _Nash_ wanted to define $f_i$ as $f_i : C -> Delta (S_i)$, where $C eq Delta (S_1) crossmark dots crossmark Delta (S_n)$. This would make $f_i$ the  #hh[best response] of player _i_, but this would not make $f_i$ a _continuous function_. So instead:
#v(-3pt)
$ 
  "let" f : Delta (S_1) crossmark dots crossmark Delta (S_n) ->  Delta (S_1) crossmark dots crossmark Delta (S_n)\
  
  "where" f_(i, s_i) (x) eq max {0, u_(i)(s_i, x_(-i)) - u_i (x))} 
$
#v(-3pt)
This makes $f_(i, s_i)$ the _increase in utility_ for playing $s_i$, capped below by 0. Then, let $f(x) eq x'$, where $x'$ is a _continuous function_ defined as
#v(-2pt)
$ 
x_i^' (s_i) eq (x_i (s_i) + f_(i, s_i)(x)) / (sum_(b_i in S_i) (x_i (b_i) + f_(i,b_i)(x))) eq  (x_i (s_i) + f_(i, s_i)(x)) / (1 + sum_(b_i in S_i) f_(i,b_i)(x))
$
#v(-3pt)
By #hh[Brouwer's fixed point] theorem, $f$ has a fixed point where $f(x) eq x$. Now it just remains to show that $x$ is a *MNE* at the fixed point. Intuitively, we want to show that $f_(i, b_i) eq 0, forall i$, as this would mean that there are no pure strategies that increase the utility gained beyond the expected utility of playing $x_i, forall i$.
#v(-3pt)
#proof[ 
  Assume that $x$ is a *mixed strategy profile* at the  _fixed point_. So $f(x) eq x' eq x$. Using the definition of $x'$ above, we get that: 
  #v(-3pt)
  $
    x_i^' (s_i) dot [1 + sum_(b_i in S_i)f_(i, b_i) (x)] eq x_i(s_i) + f_(i, s_i)(x) \ 
    
    "knowing that" x eq x' "we can simplify to" \
    
    x_i (s_i) dot sum_(b_i in S_i)f_(i, b_i) (x) eq f_(i, s_i)(x) &"  (1)"\ 
  $
  #v(-5pt)
  _Claim_: There exists at least one pure strategy $c_i in S_i$ in the #hh[support] of $x_i$, s.t. $f_(i, c_i) (x) eq 0$. \ 
  To prove this claim, recall that 
  #v(-3pt)
  $
    f_(i, s_i)(x) eq max {0, u_(i)(s_i, x_(-i)) - u_i (x))} "where" \
    u_i (x) eq sum_(i:s_i in "supp"(x_i)) x_i (s_i) dot u_i (s_i, x_(-i))
  $
  #v(-3pt)
  For at least one $c_i$, it must be the case that $u_i (c_i, x_(-i)) <= u_i (x_i)$ (imagine the $c_i eq "argmin"_(c_i in "supp"(x)) u_i (c_i, x_(-i))$). Hence $f_(i, c_i) eq 0$ for at least one $c_i$. \
  Now, we if take the $c_i$ for which $f_(i, c_i) eq 0$ and substitute it into $(1)$:
  #v(-2pt)
  $ 
    x_i (c_i) dot sum_(b_i in S_i) f_(i, b_i) (x) eq 0 &" (2)" 
  $
  #v(-3pt)
  In $(2)$, we know that $x_i (c_i) > 0$ as $c_i$ was defined to be in the _support_ of $x_i$. Hence $sum_(b_i in S_i) f_(i, b_i) (x)$ must be 0, but we know that $f_(i, b_i) >= 0, forall i$ by definition. This can only mean one thing: $f_(i, b_i) eq 0, forall i$ - which exactly makes $x$ the *MNE* 
]
#v(-5pt)
== Sperner's Lemma & Fixed-Point Thm Proof Sketch
#v(-2pt)
#definition([#hh[Simplical Subdivision] or #hh[Triangulation]])[
  A _triangulation_ of an $n$-simplex $T$ is a finite set of simplicies ${T_i}$ for which $union_{T_i in T} T_i eq T$. $forall$ $T_i, T_j in T$, either $T_i inter T_j eq emptyset$ or $T_i inter T_j$ is equal to a common face. 
]
#v(-1pt)
#definition(hh[Sperner Labelling (coloring)])[
  Verticies of facet $j$ do not receive the color $j$. 
]

#grid(
  columns: (1fr, 1fr),
  gutter: 0pt,
  figure(
  image("../figures/panchromatic_simplex.png", width:80%)
  ), 
  [
    #lemma([Sperner's])[\
      Consider a *triangulation* of the _n-simplex_ colored with a _Sperner_ coloring. Then, there always exists a *panchromatic* simplex.
    ]
    An example of a _panchromatic_ simplex is highlighted on the left.
  ]
)
#proof([of Brouwer's Fixed-Point Theorem])[\
  Let $C$ be an _n-simplex_ $Delta_n$ and $f: C -> C$ be our _Brouwer_ function. Let $f_i (x)$ be the $i^"th"$ component of $f$, and let $x_i$ be the $i^"th"$ component of $x$. Then consider a triangulation $Delta_n$ where the _size_ (distance between any two points in the same small simplex) is at most $epsilon$. \
  Define a _labelling_ function $cal(L) in {i : f_(i)(x) <= x_i}$.\
  _It can be verified that this assigns a valid label to each point._\
  *Intuition*: If $f_i (x) > x_i, forall i$, it would hold that $sum_i f_i (x) > sum_i x_i eq 1$, which contradicts that $sum_i f_i (x) eq 1$.\
  _It can be verified that this is a valid Sperner coloring_. (says the slides and I do not care enough to elaborate) \ 
  By *Sperner's Lemma*, we have a panchromatic simplex. Which, in $cal(L)$, corresponds to a simplex defined by points $x eq (x_0, x_1, dots, x_n)$ s.t. $f_i (x_i) <= x_i$ for *all of them*. (I'm imagining each time $f_i (x_i) <= x_i$ holds as a particular color being assigned to the simplex corresponding to $x_i$.)\
  We know that all points within $x$ at at most $epsilon$ from each other and if we take $epsilon -> 0$:
  1. "_Intuitively_", the simplex converges to a single point $z$, s.t. $f_i (z) <= z_i$.  
  2. The actual argument involves _compactness_ and blah blah blah 
  #v(-3pt)
  Similar to before, this implies $f(z) eq z$ (*fixed point*), as otherwise we would have $1 eq sum_(i) f_i (z) < sum_i z_i eq 1$
]
#v(-3pt)
As for the _proof_ of #hh[Sperner's Lemma] itself - please go _seek god_. 
#v(-3pt)
== $epsilon$-Best Response
#v(-1pt)
#definition(hh[$epsilon$-Best Responses])[
  A pure strategy, $s_i$, or a mixed strategy $x_i$, of player $i$ is an $epsilon$ best response iff: 
  #v(-3pt)
  $ 
  u_i (s_i, s_(-i)) >= u_i (s'_i, s_(-i)) - epsilon, forall s'_i in S_i bold("or") \ u_i (x_i, x_(-i)) >= u_i (x'_i, x_(-i)) - epsilon, forall x'_i in Delta(S_i)
$
#v(-4pt)
*Intuition*: A player can increase their utility, but no more than $epsilon$
]
#v(-1pt)
#definition(hh[Pure $epsilon$-Nash Equilibrium])[
  A *pure* strategy profile $s$ is a pure $epsilon$-Nash equilibrium, if for every player with strategy $s_i in s$, $s_i$ is the $epsilon$-best response.
]
#v(-1pt)
#definition(hh[Mixed $epsilon$-Nash Equilibrium])[
  A *mixed* strategy profile $x$ is a mixed $epsilon$-Nash equilibrium, if for every player with strategy $x_i in s$, $x_i$ is the $epsilon$-best response.
  - *Strong approximation*: A mixed strategy profile $x$ is a mixed $epsilon$-NE, if $x^*$ is some (exact) MNE and $||x - x^*||_infinity <= epsilon$.
  - *Weak approximation:* Pick the $epsilon$-best response.
]
#v(-3pt)
*Q. Why $epsilon$-Nash Equilibria?* \ 1) _Conceptually_: If a player cannot increase their utility by much, they will not bother deviating $=>$ $epsilon$-NE are robust, especially when $epsilon$ is small. 
\
2) _Computationally:_ *NE* (w/ $epsilon=0$) may require *irrational numbers* to be described. \
*Note*: For _2 player games_ there always exists *MNEs* in rational numbers via Lemke-Howson algortihm.
#v(-3pt)
== Complexity of Nash Equilibria 
#v(-3pt)
#box(
    fill: rgb("#FFDBBB"),
    inset:3pt,
    [
      *n-Nash($epsilon$)*: Given as input a normal-form game with $n$ players, with all the parameters (strategy sets, utilities) given in binary representation, and an $epsilon$ > 0, return an $epsilon$-Nash equilibrium, with the corresponding probabilities represented in binary. 
    ]
)
This problem falls in the class "Total Search Problems in NP" (*TFNP*) and more specifically within *TFNP*, it calls under *PPAD* (Polynomial Parity Argument on a Directed Graph). In fact, it is _PPAD-Complete_. We do not expect to have a polynomial time algo to find *MNEs* in general. 
#v(-3pt)