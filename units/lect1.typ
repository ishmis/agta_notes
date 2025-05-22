#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Normal Form Games & Strategies 
#v(-3pt)
A game written in normal form amounts to a representation of every player's utility for every state, where states depend only on the combined actions of all the players. More formally: 
#definition[ 
 A finite _n-person_ game in #hh[normal] or #hh[strategic form] is a tuple $(N, S_1, S_2, dots, S_n, u_1, u_2, dots, u_n)$, where:
 1. $N = {1, dots, n}$ is a set of #hh[players] (or #hh[agents])
 2. For each player $i in N$, there is a set of $S_i$ of (_pure_) #hh[strategies] 
 3. For each player $i in N$, there is a #hh[payoff] (or #hh[utility]) function $u_i : S -> RR$ which assigns a numerical value $u_i (s_1, s_2, dots, s_n)$ to player $i$ for a given _strategy profile._ 
]
#definition(hh[Strategy Profile])[
   $(s_1, s_2, dots, s_n) in S_1 crossmark S_2 crossmark dots crossmark S_n = S$ 
]
#notation[
  $Delta (S_i)$ represents the set of all probability distributions over the strategy set of player $i$. 
]
#definition(hh[Mixed Strategy])[
 $x_i in Delta (S_i)$ is a probability distribution over the possible pure strategies in $S_i$. For example, if $S_i$ is finite and contains $m$ pure strategies, then $x_i = (x_(i 1), x_(i 2), dots, x_(i m))$, where $x_(i j)$ is the probability of playing pure strategy $s_j in S_i$. 
]
#definition(hh[Support])[
  The #hh[support] of a mixed strategy $x_i$ is the set of all pure strategies that are played with *strictly positive* probability. 
]
#definition(hh[Mixed Strategy Profile])[
  A vector $(x_1, x_2, dots, x_n)$ of mixed strategies. The _expected utility_ of a player under this profile is:
  $ u_i [x_1, dots, x_n] eq EE_((s_1, dots, s_n)tilde (x_1, dots, x_n)) [u_i (s_1, dots, s_n)] $
]
#underline[*Prisoner's Dilemma (PD)*]
#v(-11pt)
#figure(table(
  columns: (auto, auto, auto),
  stroke: (x, y) => (
    left: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    top: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    bottom: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt },
    right: if (x != 0 and y != 0) { 1.0pt } else { 0.0pt }
  ),
  inset: 3pt,
  column-gutter: auto,
  row-gutter: auto,
  align: center,
  "", 
  "C", 
  "D", 
  "C",
  $a, a$,
  $b, c$,
    "D",
  $c, b$,
  $d, d$,
),caption: [Any $c > a > d > b$ defines a *PD* with $S = (D,D)$])