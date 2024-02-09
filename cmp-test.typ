#set rect(width: 100%, radius: 8pt, fill: rgb("#f2f2f2"), stroke: 1pt, 
            inset: 12pt)
= Introduction 
In practice assignment 2 (PA 2), we are asked to check if result of the integral 
$ I= integral_3^infinity 1/ (x(x-1)(x-2)) dif x $
is finite. With the support of basic logarithmic and limit properties, we are 
able to discuss the convergency using partial fraction decomposition as well as 
comparison test.
== Preliminaries
*Theorem 1* (Limit property).
Let $f: X -> RR, g: Y -> RR$ be functions with $f(X) subset.eq Y$, and let 
$g compose f: A -> RR$ be the composition. Suppose 
$ lim_(x -> a)f(x) = ell "and" lim_(y -> ell) = g(ell), $
Then 
$ lim_(x-> a) g(f(x)) = g(ell). $

*Theorem 2* (logarithm property).
For every $a, b in RR$, the followings always hold
$ 
ln(a) + ln(b) = ln(a b)\ 
ln(a) - ln(b) = ln(a/b)\
a ln(b) = ln(b^a)
$
== Approach 1: Partial Fraction Decomposition

Let's suppose 
$ 1 / (x(x-1)(x-2)) = A/x + B/(x-1) + C/(x-2) $
for some constant $A, B, C in RR$.

By multiplying both sides by $x(x-1)(x-2)$, we have

$
1 &= A(x-1)(x-2) + B x(x-2) + C x(x-1)\
0x^2 + 0x + 1&= (A + B + C)x^2 + (-3A -2B + -C)x + 2A
$
By matching the coefficients, we can obtain a system of equations with three 
variables
$ 
cases(
  0 &= A + B + C\
  0 &= -3A -2B -C\
  1 &= 2A
).
$
As you can verify, this system of equation has solution
$
cases(
  A &= 1/2\
  B &= -1\
  C &= 1/2
)
$
This leads to 
$
integral_3^infinity 1/ (x(x-1)(x-2)) dif x
&= lim_(a -> infinity) integral_3^a 1/ (x(x-1)(x-2)) dif x\
&= lim_(a -> infinity) integral_3^a 1/(2x) - 1/(x-1) + 1/(2(x-2)) dif x\
&= lim_(a -> infinity) [1/2 ln abs(x) - ln abs(x-1) + 1/2 ln abs(x-2)]^a_3\
&= lim_(a -> infinity) [ln abs(sqrt(x)) + ln abs(1/(x-1)) + 1/2 ln abs(sqrt(x-2))]^a_3&quad"[By Thm 2]"\
&= lim_(a -> infinity) [ln (sqrt(x^2 - 2x)/(x-1))]^a_3\
&= lim_(a -> infinity) ln (sqrt(a^2 - 2a)/(a-1)) - ln(sqrt(3)/2)&"[By Thm 2]"\
&= ln (lim_(a -> infinity) sqrt(a^2 - 2a)/(a-1)) - ln(sqrt(3)/2)&"[By Thm 1]"\
&= ln (lim_(a -> infinity) sqrt(1 - 2/a)/(1-1/a)) - ln(sqrt(3)/2) &"[Divides by" a "]"\
&= ln(1) - ln(sqrt(3)/2)\
&= ln(sqrt(3)/2)
$
== Approach 2: Comparison Test
Notice the following:
$
x >= x-2 => 1/x <= 1/(x-2)\
x-1 >= x-2 => 1/(x-1) <= 1/(x-2)\
x-2 >= x-2 => 1/(x-2) <= 1/(x-2)
$
By multiplying all the left hand side term together and all the right hand side 
together, it gives us
$
1/(x(x-1)(x-2)) <= 1/(x-2)^3.
$
Therefore, consider the integral 
$
integral_3^infinity 1/(x-2)^3 dif x,
$
we have
$
integral_3^infinity 1/(x-2)^3 dif x 
&= lim_(a -> infinity) integral ^a_3 1/(x-2)^3 dif x\ 
&= lim_(a -> infinity)[ -1/(2(x-2)^2) ]^a_3\
&= lim_(a -> infinity)(-1/(2(a-2)^2) + 1/(2(3-2)^2))\
&= lim_(a -> infinity)(-1/(2(a-2)^2) + 1/2)\
&= 1/2\
$
Therefore, because $1/x(x-1)(x-2) <= 1/(x-2)^3$ and 
$integral^infinity_3 1/(x-2)^3 dif x < infinity$, so integral $I$ convergent.

#rect([
  *Remark.* Comparison test only tells us the convergency of the integral of 
interest. The theorem, however, does not make any claim regarding the actual 
value that the integral converges to.
])
== Error Corrections
In last week's tutorial, I claimed 
$
J = integral^infinity_3 1/(x-4)^3 dif x 
$
converges, which is false. 
#figure(
  image("img/discont.png", width:40%),
  caption: [Discontinuity at $x=4$.]
)
As you can see, there exists a discontinuity at $x=4$. Since 
$4 in [3, infinity)$, so we cannot apply the fundamental integral rule to 
compute the integral value directly as we requires integrand to be continuous 
within the interval of interest. So to discuss the convergency of $J$, we need 
to apply some ticks to manipulate the integrand.

*Definition.* Function $f: RR ->  RR$ is an _odd function_ if $f(-x) = -f(x)$
for every $x in "dom"(f)$.

#pagebreak()
*Theorem 3.* For every odd function $f: RR -> RR$ and $a > 0$ such that 
$a, -a in "dom"(f)$
$ integral^a_(-a) f(x) dif x = 0 $
Therefore, back to our discussion on 
$ J = integral_3^infinity 1/(x-4)^3 dif x. $
Firstly we are going to apply u-sub:

+ Let $u = x-4$, it implies $dif u = dif x$.
+ Notice that when $x = 3$, $u = -1$. And when $x -> infinity$, $u -> infinity$.
It leaves us 
$ 
integral_3^infinity 1/(x-4)^3 dif x 
&= integral_(-1)^infinity 1/u^3 dif u\
&= integral_(-1)^1 1/u^3 dif u + integral_1^infinity 1/u^3 dif x\
&= 0 + integral_1^infinity 1/u^3 dif x &"[By Thm 3]"\
&= lim_(a -> infinity) integral^a_1 1/u^3 dif x\
&= lim_(a -> infinity) [ -1/ (2u^2)]^a_1\
&= -1/2 lim_(a -> infinity) (1/a^2 - 1)\
&= 1/2 < infinity
$