#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Inefficiency of Equilibria: Price of Anarchy/Stability
#v(-1pt)
#definition(hh[Social Welfare])[
  The expected #hh[social welfare] of a strategy profile $x eq (x_1, dots, x_n)$ is the sum of utilities of all the players: 
  #v(-3pt)
  $
    "SW"(x) eq sum_(i in N) u_i (x)
  $
]
#v(-3pt)
#definition(hh[Social Cost])[
  The expected #hh[social cost] of a strategy profile $x eq (x_1, dots, x_n)$ is the sum of costs of all the players: 
  #v(-3pt)
  $
    "SC"(x) eq sum_(i in N) "cost"_i (x)
  $
]
#v(-3pt)
Imagine there is an #hh[omnipotent entity] that could "force" all players to play any strategy they wished. Then, this entity could select a strategy profile $x$ that _maximizes social welfare_. In most cases this profile consists of pure strategies, so we denote it as $s$. 
#v(-2pt)
#definition(hh[Price of Anarchy (PoA)])[ For a particular game $G$:
  $
    "PoA"(G) eq ("SW"(x^*)) / (min_(x in bold("MNE")(G)) "SW"(x)) \
    "where" x^* in "arg" max_x "SW"(x) "and" bold("MNE")(G) "are all MNEs of G" 
  $
]
#v(-6pt)
*Note*: we also distinguish between _pure_ and _mixed_. *PoA* depending on whether only pure or mixed strategy profiles are being considered. All _mixed PoA_ are inclusive of _pure PoA_!
#v(-5pt)
#figure(image("../figures/anarchy_eg.png", width: 70%), caption: [The maximum *SW* above is 6+6=12. The circles highlight the *PNEs*, but there is also a *MNE* as given above. For this game, the _pure PoA_ = _mixed PoA_ = $12/9 = 4/3$]) 
#v(-3pt)
There is a related concept to *PoA*, called the #hh[Price of Stability (PoS)] and there are versions of both for cost-games that flip the numerator and denominator to maintain $>=1$ ratio. We will consider all four ratios not only on single games, but entire classes of games $cal(G)$, as below:
#v(-5pt)
$
  #underline[*utilities, social welware*] \ 
  
  "PoA"(cal(G)) eq max_(G in cal(G)) ("SW"(x^*)) / (#hl[$min_(x in bold("NE")(G))$] "SW"(x))  \

  "PoS"(cal(G)) eq max_(G in cal(G)) ("SW"(x^*)) / (#hl[$max_(x in bold("NE")(G))$] "SW"(x))  \

  #underline[*costs, social cost*] \ 
  
  "PoA"(cal(G)) eq max_(G in cal(G))  (#hl[$max_(x in bold("NE")(G))$] "SC"(x)) / ("SC"(x^*)) \

  "PoS"(cal(G)) eq max_(G in cal(G))  (#hl[$min_(x in bold("NE")(G))$] "SC"(x)) / ("SC"(x^*)) \
$
#v(-3pt)
#example[
 #grid(
   columns: (1fr, 1fr),
   figure(image("../figures/pigou_network.png", width: 100%), caption: [Pigou's Network (*PN*)]), 
   
    [
      The optimal outcome is that $s_1 eq "top"$, $s_2 eq "bottom"$ $->$ minimizes *SC*. However, if both go bottom, it is a *PNE*. Hence *PoA* is $4/3$, but *PoS* is $1/1 eq 1$.   
    ]
  )
  However, for the entire class of *PN* games, we have that $"PoA"(cal(G)_(bold("PN"))) >= 4/3$ and that $"PoS"(cal(G)_(bold("PN"))) >= 1$. 
]
#theorem([Christodoulou, Koutsoupias])[
  The *PoA* of any _congestion game_ with linear cost functions is *at most* $5/2$. 
]
#v(-3pt)
#lemma([*1*])[
  $forall y,z in NN, y(z + 1) <= 5/3 y^2 + 1/3 z^2$
]
#proof[
  Let $s$ be any *PNE* and let $s^*$ be an optimal profile (which minimizes social cost). By definition, we have that: 
  $
    "SC"(s) eq sum_(r in R) n_r dot c_r (n_r) eq sum_(r in R) n_r (a_r n_r + b_r) eq sum_(r in R) (a_r n_r^2 + b_r n_r) \ 
    "SC"(s^*) eq sum_(r in R) (a_r (n_r^*)^2 + b_r n_r^*)
  $
  Furthermore, since $s$ is a *PNE*, we have that for every player $i in N$: 
  $
    sum_(r in s_i) c_r (n_r) &<= sum_(r in s_i^*) c_r (n_r^*)  "(PNE condition!)" \ 
    &eq sum_(r in s_i^* inter s_i) c_r (n_r^*) + sum_(r in s_i^*\\s_i) c_r (n_r^*) \
    &eq sum_(r in s_i^* inter s_i) c_r (n_r) + sum_(r in s_i^*\\s_i) c_r (n_r + 1) &"  (1)" \
    &<= sum_(r in s_i^*) c_r (n_r + 1)
  $
  #v(-5pt)
  In $(1)$ above, $n_r$ can safely replace $n_r^*$ in the first sum as both use $r$. In the second sum, $s_i^*$ uses $r$ but $s_i$ does not, so this is exactly $n_r + 1$ times. Remember that the above is for a *particular* player's strategy $s_i$ and $s_i^*$.
  Using the above, we can get:
  $
    "SC"(s) eq sum_(i in N) sum_(r in s_i) c_r (n_r) <= sum_(i in N) sum_(r in s_i^*) c_r (n_r + 1) eq sum_(r in R) n_r^* dot c_r (n_r + 1) \
    eq sum_(r in R) n_r^* (a_r (n_r + 1) + b_r) eq sum_(r in R) [a_r n_r^* (n_r + 1) + b_r n_r^*]
  $
  Using the *Lemma* provided above, we can derive: 
  $ 
    "SC"(s) <= sum_(r in R)  [a_r n_r^* (n_r + 1) + b_r n_r^*] 
    <= sum_(r in R)  [a_r (5/3 (n_r^*)^2 + 1/3 n_r^2) + b_r n_r^*] \ 
    eq sum_(r in R)[5/3 a_r (n_r^*)^2 + b_r n_r^*] + sum_(r in R) 1/3 a_r n_r^2 \
    <= 5/3 sum_(r in R) [a_r (n_r^*)^2 + b_r n_r^*] + 1/3 sum_(r in R) a_r n_r^2 + b_r n_r eq 5/3 "SC"(s^*) + 1/3 "SC"(s)
  $
  From rearranging the above, we can get $"SC"(s) <= 5 / 2 "SC"(s^*)$. Hence the *PoA* is $"SC"(s) / "SC"(s^*) <= 5/2$!
]

== Proving PoA and PoS bounds
*#underline[_Proving PoA/PoS Bounds_]*\
To prove that the *PoA* or *PoS* of games $cal(G)$ is $alpha$, we need to prove that it is at most $alpha$ and at least $alpha$:
1. To prove that it is _at least $alpha$_, construct *some* game $G in cal(G)$ and argue that the social cost of *some* equilibrium is $alpha$ away from the optimal.
2. To prove that it is _at most $alpha$_,  construct an argument for *any* game $G in cal(G)$, and argue that the social cost of *any* equilibrium is _at most_ $alpha$ away from the optimal. 
#v(-3pt)
#lemma([Potential Method])[
  Assume that $Phi$ is a potential function for the game $G$. If there exist constants $c,d > 0$, s.t. for any strategy profile $s$, it holds that:
  $
    c dot "SC"(s) <= Phi(s) <= d dot "SC"(s)
  $
  Then, $"PoS"(G) <= d/c$
]
#proof([of Potential Method Lemma])[\
  Suffices to show that $"SC"(tilde(s)) <= d/c dot "SC"(s^*)$. Let $tilde(s) in "argmin" Phi(s)$, which also makes $tilde(s)$ a *PNE*. If $c dot "SC"(tilde(s)) <= Phi(tilde(s))$ holds for some $c$ (state of the lemma), then we show:
  #v(-3pt)
  $
    c dot "SC"(tilde(s)) <= Phi(tilde(s)) <= Phi(s^*) <= d dot "SC"(s^*)
  $
  #v(-10pt)
]
#v(-5pt)
#theorem[
  The *PoS* of any _congestion game_ with linear cost functions is at most 2. 
]
#v(-4pt)
#proof[
  Let $Phi(s)$ be _Rosenthal's Potential Potential_ function. We will show that $1/2 "SC"(s) <= Phi(s) <= "SC"(s)$ holds, which by the Potential Method Lemma implies that *PoS* $<= 2$. Let $n_r = n_r (s)$ First, we prove the _U.B_:
  $
    Phi(s) eq sum_(r in R)sum_(j eq 1)^(n_r) c_r (j) <= sum_(r in R)sum_(j eq 1)^(n_r) c_r (n_r) eq sum_(r in R) n_r c_r (n_r)  eq "SC"(s)
  $
  To prove the _L.B._, consider the below (uses $sum_(j eq 1)^(n_r) j eq (n_r (n_r+1))/2$):
  #v(-3pt)
  $
   Phi(s) 
    eq sum_(r in R)sum_(j eq 1)^(n_r) c_r (j) 
    eq sum_(r in R)sum_(j eq 1)^(n_r) a_r dot j + b_r 
    eq sum_(r in R) (a_r n_r^2 + n_r)/ 2 + n_r b_r \
  $
  We use the above as follows:
  #v(-5pt)
  $
    "SC"(s) 
    eq sum_(r in R) n_r c_r (n_r) 
    eq sum_(r in R) a_r n_r^2 + n_r b_r 
    <= sum_(r in R) a_r n_r^2 + n_r + 2* n_r b_r \
    eq 2 sum_(r in R) (a_r n_r^2 + n_r) / 2 + n_r b_r 
    eq 2 dot Phi(s)
  $
  #v(-4pt)
  $therefore$ we conclude that $1/2 "SC"(s) <= Phi(s) <= "SC"(s)$
]
#v(-6pt)
*Note* use the #hh[potential method] to prove upper bound for *PoS*. 
#v(-3pt)