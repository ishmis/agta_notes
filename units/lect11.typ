#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Congestion Games
#v(-2pt)
#definition(hh[Congestion Games])[
  An (atomic) #hh("congestion game") is a tuple $(N, R, S, c)$, where:
]
#v(-2pt)
#grid(
  columns: (1fr, 1.2fr),
  [
    1. $N$ is a set of $n$ players 
    2. $R$ is the set of $m$ #hh("resources"). 
    3. $S = S_i times ... times S_n$, where $S_i subset.eq 2^(R) \\ {0}$ is the set of #hh("pure strategies") of Player $i$
  
  ],
  [
    4. $c = (c_1, ..., c_r)$, where $c_k : bb(N) -> bb(R)$ is the #hh("cost function") for resource $k in R$. In congestion games, every player has a cost, or disutility, as: 
    
      $ 
      "cost"_i (s) eq sum_(r in R | r in s_i) c_r (\#(r, s))   
      $
  ]
)
#v(-3pt)
Where \#$(r,s)$ denotes the number of players using $r$ under strategy $s$. 
*Note*: The cost of a player depends on how many players are using a resource, not on which those players are (#hh[anonymity]). Moreover, it is assumed that the cost $c_r$ is _non-decreasing_ (monotonic). 
#definition(hh[Atomic Network Congestion Games])[
  These are congestion games in which resources are #hh[edges] in a directed graph, and each player must choose a set of edges that that forms a #hh[simple path] from a given source $s_i$ to a given sink $t_i$. On every edge $e$ is a cost function $c_e (x)$, which is a function of the number of players that go through $e$. 
]
#v(-3pt)
#figure(image("../figures/congestion_game.png", width: 80%), caption: [Congestion Game (*note*: we will only get linear functions)]) 
#v(-3pt)
== Best Response Dynamics (BRD)
#v(-3pt)
This technique finds a *PNE* by starting from an arbitrary pure strategy profile, and then changing the profile if some player is not #hh[best responding]. This is done till all players are #hh[best responding]. 
#v(-3pt)
#theorem([Rosenthal])[
  In any _congestion game_, the _best response dynamics_ always converges to a *PNE*. 
]
#v(-3pt)
== Potential Games
#v(-2pt)
#definition(hh[Potential Game])[
  A game where there exists a #hh[potential function] $Phi: S_1 crossmark dots crossmark S_n -> RR$ such that $forall i in N$, all $s_(-i) in S_(-i)$ and $s_i, s_i^' in S_i$, we have that:
  #v(-2pt)
  $
    "cost"_i (s_i, s_(-i)) - "cost"_i (s_i^', s_(-i)) eq Phi(s_i, s_(-i)) - Phi(s_i^', s_(-i))
  $
]
#v(-3pt)
#theorem([Rosenthal])[
  Every _potential game_ has a *PNE*. 
]
#v(-3pt)
#proof[
  Let $s^* in "argmin"_s Phi(s)$, which implies that $Phi(s^*) <= Phi(s'), forall s'$. By definition of $Phi$, we know that $"cost"_i (s^*) <= "cost"_i (s'), forall s'$. Hence no player will want to swap off of $s^*$ and so $s^*$ is the *PNE*. 
]
#v(-3pt)
#corollary[
  Congestion games *are* potential games.
]
#v(-3pt)
#proof[
  Congestion Game $->$ _Potential Game_. For this we show that there exists a $Phi$ for every _congestion game_.  Consider the following potential function and strategy profiles: 
  #v(-3pt)
  $
    Phi(s) eq sum_(r in R)sum_(j eq 1)^(\#(r,s))c_r (j) bold("(Rosenthal's Potential Function)") \
    s = (s_i, s_(-i)) "and" s' eq (s_i^', s_(-i))
  $
  #v(-3pt)
  Now, we would like to show that $Phi(s) - Phi(s') eq "cost"_(i) (s) - "cost"_i (s')$. Firstly, let us partition the set of resources $R$ into 4 subsets: $R_1$ consists of $r$ not used in either $s_i$ or $s_i^'$, $R_2$ consists of $r$ used in both $s_i$ and $s_i^'$, $R_3$ consists of $r$ used in $s_i$ but not in $s_i^'$ and $R_4$ consist of $r$ used in $s_i^'$ but not $s_i$.  Then, we can show the following derivation:
  #v(-3pt)
  $  
    Phi(s) - Phi(s') eq sum_(r in R) sum_(j eq 1)^(\#(r,s)) c_r (j)  - sum_(r in R) sum_(j eq 1)^(\#(r,s')) c_r (j)\
    
    eq sum_(r in R) [ sum_(j eq 1)^(\#(r,s)) c_r (j)  - sum_(j eq 1)^(\#(r,s')) c_r (j)] 
  $
  $
    eq sum_(i eq 1)^4 sum_(r in R_i) [ sum_(j eq 1)^(\#(r,s)) c_r (j)  - sum_(j eq 1)^(\#(r,s')) c_r (j)] \

    R_1 "can be entirely ignored," R_2 "cancels out in both" \ 
    
    R_3 "is only relevant to s and" R_4  "is only relevant to s'" \

    eq sum_(r in R_3) c_r (\#(r,s)) - sum_(r in R_4) c_r (\#(r,s)) \ 

    eq sum_(r in R_3) c_r (\#(r,s)) + sum_(r in R_2) c_r (\#(r,s)) - sum_(r in R_4) c_r (\#(r,s)) - sum_(r in R_2) c_r (\#(r,s))\ 

    "using the definition of the cost function in congestion games" \

    eq "cost"_i (s_i, s_(-i)) - "cost"_i (s_i^', s_(-i))
  $
  #v(-10pt)
]
#v(-6pt)
== Termination of Best Response Dynamics
#v(-3pt)
We know *BRD* can find *PNEs* in _congestion games_, but when does it terminate? We know also that _congestion games_ are _potential games_, and we know that the difference in pure strategy profiles in cost is identical to their difference given by $Phi$. Hence, to see the worst case, let us look at the maximum possible value of the potential function: 
#v(-3pt)
$ 
  k  eq m * n * max_j c_j (n) 
$
#v(-5pt)
The _best response_ of a player *can* be computed in polynomial time as _congestion games_ take as input the set of all pure strategy profiles. Actually finding the equilibrium requires at most $k$ steps (till difference in $Phi$ is 0). The term $max_j c_j (n)$ is *exponential* in the size of the input, so finding the equilibrium is not polynomial time. 
#v(-3pt)
#theorem([Johnson, Fabrikant])[
  Computing a *PNE* of a _congestion game_ is *PLS*-complete.
]
#v(-3pt)
The above implies that finding a polynomial time algorithm for finding *PNEs* in _congestion games_ is most likely not possible. \
#underline[_What about mixed equilibria?_]\
*MNEs* exist as per _Rosenthal_ (*PNEs* are *MNEs*) and they exist as per _Nash_ (_congestion games_ are finite *NFG*). But:
#v(-3pt)
#theorem([Babichenko, Rubinstein])[
  Computing a *MNE* of a _congestion game_ is *PPAD* $inter$ *PLS*-complete
]
#v(-3pt)