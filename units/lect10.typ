#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Imperfect Info Games, Stochastic Games
#v(-2pt)
#definition(hh[Imperfect Information Game ])[
    This is an #hh[EFG] with the tuple $(N,A,G,Z,chi, rho, sigma, a, I)$, where $(N,A,G,Z,chi, rho, sigma, a)$ is a #hh[perfect-information EFG] and $I = (I_1, dots, I_n)$ are a set of #hh[information sets]. 
]
#definition(hh[Information Set ])[
  These are a set of _equivalence classes_ on a partition of $H$, with the property that $chi(h) eq chi(h')$ and $rho(h) eq rho(h')$ whenever $exists j$ for which $h in I_(i, j)$ and $h' in I_(i, j)$. That is, each information set consists of #hh[choice nodes] belonging to the *same player* s.t. the same action must be taken in all the nodes. 
]
#figure(image("../figures/guess_card_game.png", width: 75%)) 
Unlike #hh[perfect information], #hh[imperfect information games] have strategies that are tuples of actions, _one for each one of their information sets_.\
#v(-2pt)
*Note*: #hh[Zermelo's] theorem does *not* apply for #hh[imperfect information games]. There is no guarantee that these have a *PNE*. However, they are guaranteed to have a *MNE*. Why? They can be turned into an *NFG*.
#corollary[
  *Every* #hh[imperfect information extensive form game] (*IIEFG*) can be transformed to an equivalent #hh[normal form game].
] 
#corollary[
  Every *NFG* can also be transformed to an *IIEFG*. 
]
#v(-3pt)
== Behavioral Strategies
#v(-3pt)
With *IIEFG*, we have two ways of choosing actions within an _information set (IS)_: 
#v(-5pt)
#figure(
  image("../figures/forgotwhatidid_mixedstrat.png", width: 80%),
  numbering: none, 
  caption: [
    *Way 1*: #hh[Mixed Strategy]: Randomization over complete pure strategies - the player chooses the same action within the *IS* but can do so with a certain probability of picking the action to stick to.
  ]
) 
#v(-3pt)
#figure(
  image("../figures/forgotwhatidid_behavioral.png", width: 80%),
  numbering: none, 
  caption: [
    *Way 2*: #hh[Behavioral Strategy:] Randomization in each information set. This involves picking an action within each _node_ of an *IS* with a given probability distribution. Importantly, this *must* be the same distribution across all nodes within the same *IS*    
  ]
) 
#v(-3pt)
== Perfect Recall 
#v(-3pt)
*Intuitively:* No player forgets its own sequence of prior actions and information sets.
#v(-2pt)
#definition(hh[Perfect Recall])[
  Whenever two nodes $h, h'$ belong in the same information set $I_(i, j)$, then the sequence of information sets and actions of the player, i.e., the visible history, prior to reaching $h$ and $h'$ must be the same. 
  *Note*: Most sensible *IIEFGs* are perfect recall games.
]
#v(-3pt)
#theorem("Kuhn")[
  In a #hh("perfect recall") *IIEFG*, any mixed strategy of a player can be replaced by an #hh("equivalent") behavioural strategy, and vice versa. 
]
#v(-3pt)
*Equivalently*: Two strategies induce the same probabilities over outcomes, assuming the strategies of other players are fixed.
#v(-3pt)
== Complexity of 2-Player Zero/General Sum Games
#v(-3pt)
In their *NFG* version, two-player zero-sum games *can* be solved in polynomial time via *LP*. For *IIEFG* in general, this is not true. These *IIEFG* games first being turned into a *NFG* takes _exponential time_ and it has been shown computing optimal strategies in *IIEFGs* is _NP-hard_ *without* #hh[perfect recall]. \
Computing optimal strategies in *IIEFGs* with #hh[perfect recall] can be done in *polynomial time*. Computing *MNE* in *IIEFGs* with perfect recall can be done using #hh[Lemke-Howson] type algorithm.
#v(-3pt)
== Chance Nodes
#v(-3pt)
With zero-sum #hh[IIEFG] we cannot model games with certain probabilities attached to different actions. For this, #hh[chance nodes] are introduced. These nodes are "_controlled by nature_" that transition to certain nodes with certain probabilities. 
#v(-6pt)
#figure(
  image("../figures/chance_node.png", 
    width: 50%)
)
#v(-3pt)
#underline[*_Games Against Nature_*]\
These can be modelled using #hh[chance nodes], where we can think of "nature" as the "player" to which the _chance nodes_ belong. These sort of games are called #hh[finite horizon] *MDPs*. 
#v(-2pt)
#definition(hh[Finite Horizon Markov Decision Process ])[
  #v(-3pt)
  #grid(
    columns: (1fr, 1.1fr),
    [
      1. A finite set of states $H$
      2. A function $rho$ assigning a state to either the player or nature
      3. A function $sigma: H -> 2^h$ mapping states to their successors/actions.
    ],
    [
      4. For each $h$ of nature, $q_h: sigma (h) -> [0,1]$ is a probability distribution over the set of actions
      5. A start state $h_0$
      6. A utility/payoff function $u$
    ]
  )
]
#v(-3pt)
The payoff function $u$, can take various forms: 
#v(-3pt)
$
  u eq EE [lim inf_(n->infinity) (sum_(i=0)^(n-1) u(h_i))/ n] "expected mean payoff" \ 
  
  u eq EE [lim_(n->infinity) delta^i u(h_i)] "discounted returns for" 0 < delta < 1  
$
#v(-3pt)