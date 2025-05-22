#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Revenue Maximizing Auctions 
#v(-3pt)
We have looked at how *VCG* maximizes _social welfare_. But, what if we wanted to maximize seller's revenue instead? \
#underline[_Welfare vs Revenue_] \ 
Consider #hh[Single-Bidder Deterministic Auctions]. Let $r$ be the #hh[critical-value] for this auction. To maximize welfare, set $r=0$, thus always selling for free.  *However*, this give 0 revenue to the seller. Setting selling price $r$ in order to guarantee "good" revenue is what we must do. This value is highly dependent on the _private value_ $v$ of bidder.
#v(-3pt)
== Probability Theory Primer
#v(-2pt)
Probability Density Function (*PDF*), $f: bb(R)_+ -> bb(R)_+$\
Cumulative Distribution Function (*CDF*), $F: bb(R)_+ -> [0, 1]$
#v(-3pt)
CDF is #hh("continuous") and #hh("nondecreasing"). It is given by: 
#v(-4pt)
$ 
  F(x) = integral_0 ^(x) f(t) "dt" eq Pr(X <= x)
$
#v(-5pt)
If $X$ is a random variable with distribution $F$, $X~F$, then: 
#v(-4pt)
$ 
  P[ a<= X<=b] = integral_(a)^(b) f(x) "dx" = F(b) - F(a) \ 
  
  bb(E)[g(X)] = integral_(0)^(infinity) g(x) dot f(x) "dx"
$
#v(-4pt)
E.g., *Uniform Distribution* on $[0, 1]$: $f(x) = 1, F(x) = x$
#v(-3pt)
== Bayesian Single-Item Auctions
#v(-3pt)
The seller has #hh("incomplete knowledge") of the bidders values $v_i$. The values $v = (v_1, ..., v_n)$ are #hh("independent") random variables drawn from #hh("distributions"), "priors", $F = (F_1, ..., F_n)$ supported over $[0, 1]$. Let $cal(W) eq (w_1, dots, w_n)$ be the allocations where $sum_(i eq 1)^n w_i (bold(b)) <= 1$, for all bids $bold(b)$. Since we assume a _truthful action_, all bids are equal to true values $bold(v) = (v_i, v_(-i))$. Let auction $cal(A) eq (bold(w), bold(p))$.
Optimization objectives are defined #hh("in expectation"): 
#v(-10pt)
$ 
  W(cal(A)) := bb(E)_(bold(v~F)) [sum_(i=1)^n v_i dot w_i (bold(v))] "(Welfare)"\
  
  R(cal(A)) := bb(E)_(bold(v~F)) [sum_(i=1)^n p_i (bold(v))] "(Revenue)" \ 
$
#v(-3pt)
*Goal:* Find a #hh("revenue-maximizing") _truthful _auction: 
#v(-3pt)
$ 
  max_("truthful" cal(W)) R(cal(W) )= max_("monotone" bold(w)) bb(E)[ sum_(i=1)^n (v_i dot w_i (bold(v)) - integral_(0)^(v_i) w_i (t, v_(-i))"dt")] 
$
#v(-3pt)
#example([Revenue Maximisation: Single-Bidder, Deterministic Auction])[
 Let $r$ be the critical value, bidder wins *iff* $v >= r$, and they pay $r$. 
- The expected revenue is: $ r dot Pr[ v>= r] = r(1- F(r))$
- Optimal "*monopoly reserve*": $r^* = "argmax"_(r in [0, 1]) r(1-F(r))$
#v(-3pt)
_#underline[Consider uniform distribution:]_ 
- $r^* = "argmax"_([0, 1]) r dot (1-F(r)) = "argmax"_([0, 1]) r dot (1-r)$. 
- $r^* =  1/2, therefore "optimal revenue" = 1/4$
#v(-3pt)
*Note:* $v$ has been normalised such that $v in [0, 1]$  
]
#v(-3pt)
== Virtual Values
#v(-3pt)
The #hh("virtual value") function $phi.alt$ of bidder $i$ is defined by: 
#v(-3pt)
$ 
  phi.alt_i (v_i) := v_i - (1-F_i (v_i))/(f_i (v_i)) 
$
#v(-4pt)
If $phi.alt_i$ is (_strictly_) increasing, the distribution $F_i$ is (_strictly_) #hh("regular").
#v(-5pt)
#theorem([Myserson's])[
  For any _truthful_ auction *$(w, p)$*, it holds that:
  $ overbrace(bb(E)_(v~F)[sum_(i=1)^(n) p_i (bold(v))], "revenue") = overbrace(bb(E)_(v~F)[sum_(i=1)^n phi.alt_(i)(v_i) dot a_(i)(bold(v))], "'virtual' social welfare ") $ 
]
#v(-5pt)
#proof("of Myerson's Theorem")[\
  It is enough to prove this per-bidder due to _linearity of expectation_. For any bidder $i$ and all $v_(-i)$ of others: $bb(E)_(v_i ~ F_i) [p_i (bold(v)) ] = bb(E)_(v~F)[phi.alt_(i)(v_i) dot w_(i)(bold(v))]$ for bidder $i in [n]$ and values $v_(-i) in [0, 1]^(n-1)$. \
  Let $v= v_i, w(v) = w_i (v, v_(-i)), p(v) = p_i (v, v_(-i)), F(v) = f_i (v), ...$
  $ 
    bb(E)_(v~F) = integral_(0) ^(1) #hl($p(v)$) dot f(v) "dv" \
      
    = integral_(0)^(1) #hl($(w(v) dot v - integral_(0) ^(v) w(z) "dz")$) dot f(v) "dv" "(Due to Myerson's Lemma)" \
    
    = integral_(0)^(1) w(v) dot v dot f(v)  "dv" - integral_(0)^(1) integral_(0) ^(v) w(z) dot f(v) "dz" "dv" \
    
    = integral_(0)^(1) w(v) dot v dot f(v) "dv" - integral_(0)^(1) integral_(z) ^(1) w(z) dot f(v) "dv" "dz" ("Reorder integration") \ 
      
    = integral_(0)^(1) w(v) dot v dot f(v) "dv" - integral_(0)^(1) w(z) integral_(z) ^(1) f(v) "dv" "dz" \
    
    = integral_(0)^(1) w(v) dot v dot f(v) "dv" - integral_(0)^(1) w(z) (1- F(z)) "dz" \
    
    = integral_(0)^(1) w(v) dot v dot f(v) - w(v) (1- F(v)) "dv" \
    
    = integral_(0)^(1) w(v) [ v - (1-F(v))/(f(v))] f(v) "dv" ("Factorise")\
    
    = integral_(0)^(1) w(v) phi.alt(v) dot  f(v)  "dv" 
    
    = bb(E)_(v~F) [ w(v) phi.alt(v)]
  $
  #v(-12pt)
]
#v(-5pt)
#underline[_Regular Distributions_]\
#hh[Regular] distributions include uniform, (truncated) normal, exponential. For uniform distribution: $phi.alt (x) eq x - (1 - F(x))/(f(x)) eq x - (1-x)/1 eq 2x - 1$
#v(-1pt)
== Myerson's Optimal Auction
#v(-2pt)
For any _truthful_ auction $cal(A) eq (bold(a), bold(p))$: 
#v(-3pt)
$
  R(cal(A)) eq bb(E)_(bold(v~F)) [ sum_(i=1)^n a_i (bold(v)) phi.alt_i (v_i)] => "OR" <=  EE_(bold(v) tilde bold(F)) [max_(i in [n]) phi.alt_i (v_i)^+] \
  "where the notation" z^+ eq max{z, 0} "and OR is optimal revenue"
$
#v(-5pt)
*#underline[_Assuming strictly regular priors_:]*\
Selling the item to the bidder with the _highest nonnegative virtual value_ is: *1.* #hh[monotone] (i.e. #hh[truthful] ), and *2.* maximizes revenue (i.e. *optimal*) \
Furthermore, if the priors are _identical_ (aka *iid*), then the optimal auction is simply a #hh[SPA] w/ *reserve price* $r := phi.alt^(-1) (0)$. (the inverse of $phi.alt$, here we are getting the value at 0 from a #hh[virtual value] of 0) Turns out $phi.alt^(-1)(0)$ is equal to the *monopoly reserve* $r^*$ from earlier.   \
*Note*: the reserve price does *not* depend on the number of bidders!
#v(-3pt)
== Simplicity vs Optimality
#v(-3pt)
#underline[_Non-Identical Priors_]: Optimal auction might be complicated/practically infeasible. Higher virtual value may not correspond to higher value.\
Restriction to simple auction formats, e.g., SPA, may cause loss in revenue. We can determine the #hh("cost of simplicity") as follows: \
#underline[_Identical Bidders_]: Using the following theorem, we have:
#v(-4pt)
#theorem("Bulow & Klemperer")[
  For regular iid priors, the expected revenue of the SPA with no reserve on $n+1$ bidders is at least the expected revenue of the optimal auction with $n$ bidders
]
#v(-3pt)