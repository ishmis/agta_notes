#import "proof_fmt.typ" : *
#show: thmrules.with(qed-symbol: $qed$) // need this line!

= Linear Programming 
#definition(hh("Standard Form of LPs (SFLP)"))[\
*Objective Function:* 
#v(-8pt)
$ 
  bold("maximise") c^(T)x = sum_(j=1)^(n)c_j x_j 
$
#v(-8pt)
Subject to *Constraints:* 
#v(-5pt)
$ 
  A x = sum_(j=1)^(n) alpha_(i j)x_(j) <= b_i, i in [1, ..., m] \
  x_j>=0, j in [1, ..., n], x_j in x
$
#v(-2pt)
]

#definition(hh("Solution"))[
  An assignment of values to the variables. A *feasible solution* is a solution that satisfies all the constraints. *Optimal solution* is a _feasible solution_ which *maximizes* the objective function.
]
#definition(hh("Feasible Region"))[
  The set of feasible solutions. To find the optimal solution, suffices to examine the _corners_ of the feasibility region, i.e., the intersection points of the lines defined by the constraints $->$ Simplex Method 
]
#definition(hh("Infeasible LP"))[
  An *LP* is *infeasible* if it does not have any feasible solutions. Occurs when constraints contradict another.]
#definition(hh("Unbounded LP"))[ 
  If *LP* has feasible solutions with arbitrary large objective values.
  *Note:* Unbounded feasibility region _does not_ mean that the *LP* itself is necessarily unbounded.
]
#v(-2pt)
== Fourier-Motzkin Elimination for Solving LPs
#v(-2pt)
*Idea:* Elimination of variables.
*Observation:* Every inequality of the LP can be written in one of two form: 1) $x_j >= alpha$ or 2) $x_i <= beta$ for some $alpha, beta$. The steps are as follows:
1. "Solve" each inequality for $x_j$
2. Eliminate $x_j$ from all constraints.
3. Repeat for the next variable until there is only one variable left.
4. Substitute back to get the other variables.
#v(-3pt)
Simple but *inefficient*: One elimination step over $m$ inequalities can result in $Omega(n^2)$ new inequalities. Thus for $k$ elimination steps, there can be $Omega(m^(2^(k)))$ constraints.\
*Note:* If the LP has an optimal feasible solution, then it has a rational optimal feasible solution $x^*$ and the objective function value $f(x^*)$ is also rational. This is due to *closure property* of of rational numbers.
#v(-2pt)
== Finding the Optimal Solution: 
#v(-3pt)
*Observation*: Given a linear objective function,
we can substitute it with a variable $x_0$. After adding $x_0$ to the constraints:
1. Eliminate to find inequalities for $x_0$.
2. Pick the $x_0$ that optimises the objective function.
3. Pick feasible $x_1, x_2, ..., x_n$ for the rest of the variables.
== Integer Linear Programming (ILP)
When variables $x_j$ are integers in the constraints of the *LP*. Now, the corners are not necessarily integer solutions. Solutions all take exponential time- *ILP solving is NP-hard*.