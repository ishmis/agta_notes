#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Simplex Method 
#definition(hh[Simplex Method])[
  This is a family of algorithms that involve solving *LP* problems. The algorithm is provided below. 
]
#definition(hh[Simplex Dictionary])[
  Consists of: 
  #v(-6pt)
  $ 
    zeta "(objective function)" eq sum_(j=1)^n c_j x_j \

    w_i eq b_i - sum_(j=1)^(n) alpha_(i j)x_(j), forall i in [1, m] "(m slack variables)   (1)" \
    x_1,dots,x_n,w_1,dots,w_m >= 0 "(constraints)" 
  $
  #v(-2pt)
  1. Where the vector $vec(w_1, dots.v, w_m)$ forms the #hh[basis] consisting of #hh[basic variables]. These variables are said to be _"in the basis"_, while all other variables are _"outside the basis"_. 
  2. Note that the _basic variables_ aren't just the #hh[slack variables], but any variable on the LHS of the equations in $(1)$. 
  3. Further, observe that $a_(i j)$ is a particular cell in a game's _payoff matrix_. 
  4. Any variable that is not a #hh[basic variable] is a #hh[non-basic variable] 
  5. The term #hh[pivoting] is given creating a new dictionary by swapping variables between the #hh[basic] and #hh[non-basic] variables. 
]
#definition(hh[Entering & Leaving Variable])[
  Any variable that will next enter the #hh[basis] is an entering variable, but in doing so, the variable that gets evicted is the #hh[leaving] variable. 
]
#definition(hh[Basic Feasible Solution])[
  A solution to an *LP* (in the dictionary form) initially obtained by setting all #hh[non-basic] variables to 0. In effect, we get initial values for the #hh[slack variables].  
]
#v(-3pt)
#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(
      booktabs: true, 
      line-numbering: "1", 
      numbered-title: [The Simplex Method])[
        + *Introduce* slack variables $w_1, w_2, dots, w_m$, where $m$ is the number of constraints in the input *LP*
        + Write the original dictionary
        + *Repeat*:
          + Find a #hh[basic feasible solution] by setting the #hh[non-basic] variables to $0$.
          + Choose a variable to #hh[enter] the #hh[basis] and a variable to #hh[leave] it. 
            + The #hh[entering] variable is any variable with #highlight[positive coefficient] in $zeta$, if non exists then we are done!
            + The #hh[leaving] variable is the #hh[basic variable] with the smallest $hat(b_i)/hat(a)_(i k)$
          + Increase the value of the entering variable to #hl[$x_k eq min_(i:hat(a)_(i k)>0) hat(b_i)/hat(a)_(i k)$]
          + Compute the new dictionary by making $x_k$ appear on "the left"
  ]
)<verify-nash-equilibrium>
== Example Simplex Run 
#v(-4pt)
Consider the following *LP*: 
#v(-3pt)
$ 
  bold("maximise") &5x_1 + 4x_2 + 3x_3 \ 
  bold("subject to") &2x_1 + 3x_2 + x_3 <= 5 \ 
                     &4x_1 + x_2 + 2x_3 <= 11\
                     &3x_1 + 4x_2 + 2x_3 <= 8 \
                     &x_1,x_2,x_3 >= 0
$
#v(-3pt)
#underline[_Step 1: Introduce the #hh[objective function] and #hh[slack variables]_] 
#v(-3pt)
$ 
  bold("maximise") &zeta eq 5x_1 + 4x_2 + 3x_3 \ 
  bold("subject to") &w_1 eq 5 - 2x_1 - 3x_2 - x_3 \ 
                     &w_2 eq 11 - 4x_1 - x_2 - 2x_3\
                     &w_3 eq 8 - 3x_1 - 4x_2 - 2x_3\
                     &x_1,x_2,x_3,w_1,w_2,w_3 >= 0
$
#v(-3pt)
#underline[_Step 2: Write the original dictionary_ ]
#v(-3pt)
$
  bold("maximise") &zeta eq &5x_1  &+4x_2  &+3x_3 \ 
  bold("subject to") &w_1 eq 5  &-2x_1  &-3x_2  &-x_3 \ 
                     &w_2 eq 11  &-4x_1  &-x_2  &-2x_3\
                     &w_3 eq 8  &-3x_1  &-4x_2  &-2x_3\
                  
$
#v(-3pt)
$
  x_1,x_2,x_3,w_1,w_2,w_3 >= 0
$
#v(-3pt)
#underline[_Step 3: Find the #hh[basic feasible solution] by setting #hh[non-basic variables] to 0_ ]
#v(-3pt)
$
  x_1 eq x_2 eq x_3 = 0 => w_1 eq 5, w_2 eq 11, w_3 eq 8
$
#v(-3pt)
*Note*: we will not be asked questions on a LP with an initial unfeasible solution! E.g. this could occur above if any of the $hat(b_i) < 0$ initially. 
#v(-3pt)
#underline[_Step 4: Choose a variable to #hh[enter] the #hh[basis] and a variable to #hh[leave]_] \
For picking the #hh[entering variable], we pick any with a *positive coefficient* in $zeta$. Here we pick $x_1$. \ 
Next, we need to compute the smallest ratio $hat(b_i)/hat(a)_(i k)$ (for constraint $hat(b_i) - hat(a)_(i k) x_k >= 0$). For this, consider each constraint:
#v(-3pt)
$ 
  5 - 2x_1 >= 0 => x_1 >= 5 / 2 bold("and") 11 - 4x_1 >= 0 => x_1 >= 11 / 4  \ bold("and")  8 - 3x_1 >= 0 => x_1 >= 8 / 3  
$
#v(-3pt)
The smallest ratio is $5/2$, which is related to the variable $w_1$. Hence, $w_1$ is made the #hh[leaving variable]. 
#v(-3pt)
#underline[_Step 5: Increase the value of the #hh[entering variable]_] \
#v(-4pt)
$
"We increase it to" min_(i:hat(a)_(i k)>0) hat(b_i)/hat(a)_(i k), "which was" 2.5 \
"thus we set" x_1 eq 2.5
$
#v(-3pt)
#underline[_Step 6: Compute the new dictionary_] \
We need to ensure that $x_1$ appears on the left, i.e. it is in the #hh[basis]. This step will require typical row operations similar to _gaussian elimination_: 
#v(-3pt)
$
  bold("maximise") &zeta eq 12.5 &-2.5w_1  &- 3.5x_2  &+ 0.5x_3 \ 
  
  bold("subject to") &x_1 eq 2.5 &-0.5w_1  &- 1.5x_2  &- 0.5x_3 \ 
                    
  &w_2 eq 1  &+2w_1  &+5x_2 \
                     
  &w_3 eq 0.5  &+ 1.5w_1  &+0.5x_2  &-0.5x_3\
                  
$
#v(-3pt)
$
  x_1,x_2,x_3,w_1,w_2,w_3 >= 0
$
#v(-3pt)
There is still $x_3$ with a positive coefficient in $zeta$, so steps 4-6 are repeated till a solution is found! The final dictionary (call it *FDICT*) is: 
#v(-3pt)
$
  bold("maximise") &zeta eq 13 &-w_1  &- 2x_2  &- w_3 \ 
  
  bold("subject to") &x_1 eq 2 &-2w_1  &- 2x_2  &+w_3 \ 
                    
  &w_2 eq 1  &+2w_3  &+5x_2 \
                     
  &x_3 eq 1  &+ 3w_1  &+x_2  &-2w_3\           
$
#v(-3pt)
*Note:* if the #hh[entering variable] appears unbounded in the *LP*, then the entire *LP* is unbounded!
#v(-3pt)
== Degeneracy
#v(-2pt)
#definition(hh[Degenerate Dictionary])[
  Where one of the $b_i eq 0$ . Equivalently, in a _basic feasible solution_, one of the _basic variables_ is 0.  
]
#v(-2pt)
#definition(hh[Degenerate Pivot])[The _entering variable_ stays at 0 w/o increasing. 
]
#v(-3pt)
*Q. Can we get stuck in a cycle of degenerate pivots?*
Yes, but in practice this does not happen. Can avoid using: #hh[Bland's Rule].
#v(-3pt)
#theorem([Bland's Rule])[
  For both the _entering variable_ and the _leaving variable_, choose the one with the *smallest index*. 
]
#v(-5pt)
#example(hh[Degeneracy])[\
Consider the following dictionary
#v(-3pt)
$
bold("maximise") &zeta eq 3 &-0.5x_1  &+ 2x_2  &- 1.5w_1 \ 

bold("subject to") &x_3 eq 1 &-0.5x_1  &&- 0.5w_1 \ 
                   
&w_2 eq &x_1  &-x_2 &+w_1 \
$
#v(-3pt)
$
  x_1,x_2,x_3,w_1,w_2 >= 0
$
#v(-3pt)
The _entering variable_ is $x_2$ and the leaving variable is $w_2$ ($hat(b_i)/hat(a)_(i k)$ is $infinity$ or 0, where 0 is related to $w_2$). Any increase in $x_2$ violates the constraint, so we just "increase it" by $0$. 
]
#v(-3pt)
== Simplex Termination 
#v(-3pt)
#theorem[
  If the simplex method does not cycle, it terminates
]
#v(-3pt)
#proof[
  For termination, we just need to show that simplex only runs for some finite number of steps. As the algorithm just involves _pivoting_ between various _dictionaries_, it suffices to show that there are only a finite number of dictionaries, and we can do so easily:
  #v(-3pt)
  $ 
    vec(n + m, m) eq (n+m)! / (n!m!) "possible dictionaries" 
  $
  #v(-10pt)
]
#v(-6pt)