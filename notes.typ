#set page(paper: "a4")
#set text(11pt)
#set heading(numbering: "1.")
#set par(justify: true)

#set rect(width: 100%, radius: 8pt, fill: rgb("#f2f2f2"), stroke: 1pt, 
            inset: 12pt)
#align(left, text(27pt)[ #v(79.4pt)
  *MATA35 Course Notes*
])

#v(2cm)
#align(left, [ 
#h(1cm) *Instructor*: Dr. Kaidi Ye\
#h(1cm) *Author*: JiaYan Lu\
])

#v(7cm)

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()
#move(dy: 1em, [
© JiaYan Lu, 2024\
All rights reserved. For question, error correcting, or any other issue 
regarding the notes, please email

#align(center, [jiaYan.lu\@mail.utoronto.ca])

])

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()

#move(dy: 45em,
[
  The Notes (_MATA35 Course Notes_) is made solely by the author (JiaYan Lu), 
  students in MATA35H3 - Winter 2024 session may read The Note as reference. 
  If you encounter any gaffes, omissions, snafus, kludges, typos, 
  mathos, grammaros, thinkos, brain farts, poor design decisions, historical 
  inaccuracies, anachronisms, inconsistencies, exaggerations, dithering, 
  blather, distortions, oversimplifications, redundancy, logorrhea, nonsense, 
  garbage, cruft, junk, and outright lies, *all of which are entirely JiaYan 
  Lu’s liabilities.* Please feel free to contact with JiaYan once you find 
  mistake in this notes, any help or advise is greatly appreciated.

  Students who read the notes should know the followings:
  + Contents out of the scope of The Notes may appear on assessments.
  + Lectures and tutorials are always the primary resources that students should refer to. Reading The Notes should always for reviewing purposes.
  + The Notes is created for academic use, sending this notes to third party for
   beneficial purposes is prohibited.
])
git push -u origin main


#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()

#move(dx: 2cm, [#align(left,
  [_Claude Shannon once told me (Manuel Blum) that as a kid,\
    ~~~~~he remembered being stuck on a jigsaw puzzle.\
    ~~~~~His brother, who was passing by, said to him:\
    ~~~~~*"You know: I could tell you something."*\
    ~~~~~That's all his brother said.\
    ~~~~~Yet that was enough hint to help Claude solve the puzzle.\
    ~~~~~The great thing about this hint... \
    ~~~~~is that you can always give it to yourself!\
    ~~~~~I advise you, when you're stuck on a hard problem,\
    ~~~~~to imagine a little birdie or an older version of yourself whispering\
    ~~~~~"... I could tell you something..."\
      #move(dx: 8cm, dy: 10pt, [------Manuel Blum])_]
)])

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()
#outline(indent: auto)
#pagebreak()

#set page(numbering: "1")

= Preliminaries 
Definition is essential. Without giving a precise, clear definition of objects,
it is impossible to have an academic conversation or develop rigorous concepts. 
However, the imperfection of reality imposes restriction on our ability of giving
objects definitions: _we cannot give everything a definition_. Our journey
begins as such.

== Sets
*Definition.* A _set_ is a "collection" of objects.
#footnote[This clearly, is not a definition ------ it defines set using another 
notion, "collection". We may ask ourself: What is a collection? What is an
objects? We can continue this Socratic-styled interrogation and use up words
eventually. Therefore, we will take the definition of sets for granted.]

*Definition.* Objects that are comprise the set are _element_. If $X$ is a set,
we denote $x$ is an element of $X$ as $x in X$.

We may describe a set by either listing all the elements of the set, for example 
$ F = {"apple", "banana", "orange"}, $
or characterizing the properties of the elements in the set, for example 
$ A = {x in RR: x < 1}. $
#rect(
  [_Remark._ We can also use _interval_ notation to describe sets of real numbers.
  For any $a, b in RR, a < b$, 
  $ (a, b) &= {x in RR: a < x < b}\
    [a, b] &= {x in RR: a <= x <= b}\
    (a, b] &= {x in RR: a < x <= b}\
    [a, b) &= {x in RR: a <= x < b}. $
  Particularly, $(a, b)$ is called an _open interval_ and $[a, b]$ is called a
  _closed interval_.]
)

*Definition.* Given two sets $X, Y$, $X$ is a _subset_ of $Y$, written as 
$X subset.eq Y$, if for every element $x in X$, $x in Y$.

*Definition.* The _complement_ of a set $X subset.eq Y$, denoted by $X^c$, is 
given by $ X^c = {x in Y: x in.not X} $

== Functions
Naively speaking, function is a black box that gives an output for every input.
We often write $f: X -> Y$ to denote $f$ is a function maps elements in $X$
to some element in $Y$, where $X$ is called the domain and $Y$ is a called the 
codomain (aka. range) of $f$. There are some functions you may get familiar with:

=== Polynomials
*Definition.* A _polynomial_ is function of the form 
$ p(x) = a_0 + a_1x + a_2 x^2 + ... + a_n x^n $
for some natural number $n$. Each of $a_0, a_1, ..., a_n$ are called the 
_coefficients_ of the polynomial $p$. The highest degree of monomial with 
non-zero coefficient is called the _degree_ of the polynomial, denoted by 
$deg(p)$.

*Definition.* Given a polynomial $p: RR -> RR$, a real number $r$ is called the 
_root_ of $p$ if $p(r) = 0$.

*Example.* $f(x) = x^2 + 5x - 6$ is a polynomial if degree 2. It has roots 
$x = -6, 1$.

Moreover, I want to emphasis on the root finding problem of polynomials in 
degree 2, that is, of the form $p(x) = a x^2 + b x + c$, where 
$a, b, c in RR$ with $a eq.not 0$. There are three ways of finding the root of 
$p(x)$ that we should know:

+ *Quadratic Formula.* Let the discriminant $Delta = b^2 - 4 a c$. If $Delta > 0$, then the root $r$ of $p(x)$ satisfies: $ r = (-b plus.minus sqrt(Delta))/(2a). $ When $Delta > 0$, $p(x)$ has two distinct roots, on the contrary of $Delta = 0$, $p(x)$ has one repeated root.

+ *Complete the Square.* Write the polynomial into the form $p(x) = a(x + alpha)^2 + beta$. The root is given by $ r = plus.minus beta/a - alpha. $

+ *Factorization.* Write the the polynomial in the form of $p(x) = a(x - alpha)(x - beta).$ Then the roots are given by $r = alpha, beta$.

=== Trigonometric Functions
Trigonometric functions are defined using the unite circle 
$S^1 = {(x, y) in RR^2: x^2 + y^2 = 1}$.
#figure(
  image("img/trig_func.png", width: 35%),
  caption: [Definition of $sin(theta)$ and $cos(theta)$ on unite circle $S^1$.]
)
Let $p = (x, y)$ be a point on the unit circle $S^1$. The line goes through $p$ 
and the origin forms an angle $theta$. We define $cos(theta) equiv x$ and
$sin(theta) equiv y$. There are some basic trigonometric identities you should 
familiar with, check *Appendix 3.2* for details.

#rect[
  _Remark._ Analytically, the identity of trigonometric functions relies on 
  Euler's formula with _imaginary unit_ $i = sqrt(-1)$:
  $ e^(i x) = cos(x) + i sin(x). $
  It follows that 
  $ 
  sin(x) = (e^(i x) - e^(- i x))/ 2, 
  quad cos(x) = (e^(i x) + e^(-i x))/ 2.
  $
]

== Limits 

*Definition.* Let $f: A -> RR, x |-> f(x)$ be a function with $a in RR$ be a 
limit point of $A$. Given $ell in RR$, we write 
$ lim_(x -> a)f(x) = ell $
if and only if 
$ forall epsilon > 0, exists delta > 0, s.t. 0 < |x - a| < delta => 
|f(x) - ell | < epsilon. $

#rect([_Remark._ 
- The limit point $a$ does not necessarily be in the domain $A$ of $f$. Considering the example $ lim_(x -> 1) (x^2 - 1)/(x-1) = 2. $ The function $f(x) = (x^2 - 1)/(x-1)$ has domain $A = {x: x in RR - {1}}$, we can immediately see the fact that $1 in.not A$ but the it is a valid limit point of $f$.
- FYI, we may seen this definition as "if $x$ is infinitesimally approaching to $a$, then $f(x)$ is infinitesimally approaching to $ell$." However, this definition leads to the _Second Mathematical Crisis_.])

*Proposition.* Basic limit properties.

Let $f, g: A -> RR$ be two functions, let $a in RR$ be a limit point. If 
$ lim_(x -> a)f(x) = ell, lim_(x -> a)g(x) = m $
then we have
- $lim_(x -> a) f(x) plus.minus g(x) = ell plus.minus m$,
- $lim_(x -> a) f(x)g(x) = ell m$,
- $lim_(x -> a) f(x) / g(x) = ell / m$.

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()
= Integration
_\* The continuous version of summation._

Given a linear function, can easily compute its underline area, which is just
trapezoid or triangle. 
#figure(
  image("img/linear_function.png", width: 40%),
  caption: [A linear function $f(x)=x$]
)
Problem of area finding arises when the function of interest is no longer 
linear: what if we want to find the underline area of an sinusoid, or an 
exponential function?

*Motivation.* Consider a function $f: [a, b] -> RR$ defined on a closed interval
$[a, b]$, where $a < b$. We define the _signed area_ $A$ of $f$ by the following:
- area above the $x$-axis are positive, and 
- area below the $x$-axis are negative.

#figure(
  image("img/integral_example.png", width:40%),
  caption: [Signed area of $f(x)$.]
)

We write 
$ A = integral^b_a f(x) dif x. $
The symbol $integral$ is meaning for "integration", and $dif x$, also known as
_differential_, is used to reminding us $x$ is the variable we are integrating 
with. Irrigorously speaking, we may seen $dif x$ as an infinitesimal increment 
of $x$.

#rect[
  _Remark._ Integration and differentiation are inverse to each other. 
  Consider a function $f(x)$, it is always feasible#super[$dagger$] to have
  $ f(x) = integral [frac(dif, dif x)f(x)] dif x. $

  $(dagger)$ Unless $f$ is not differentiable for all points on its domain.
]

*Definition.* Define $i in {1, ..., n}$, $Delta x = (b-a)/n$, and for every 
$x^*_i in [x_i, x_i + Delta x]$, the infinite integral of $f$ can be 
approximated by _Riemann sum_:
$ integral^b_a f(x) dif x approx sum^n_(i=1) f(x^*_i) Delta x. $

As $n -> infinity$, we can accurately calculate the definite integral of $f$,
that is
$ integral^b_a f(x) dif x = lim_(n->infinity) sum^n_(i=1) f(x^*_i) Delta x. $

#rect[
  _Remark._ This formula characterized the intuition of _Riemann integral_: we
  can approximate the value of the indefinite integral of a given function $f$ 
  by chopping the underline area of $f$ into $n$ small rectangles, sumYan up
  the area of each rectangle gives the approximation. The more rectangles we 
  chopped, the more accurate the approximation we have.
]
*Definition.* Given a function $f: RR arrow.r RR$, we call 
$ F(x) equiv integral f(x) dif x $
the _antiderivative_ of $f$.

*Example.* Given $f(x) = sin(x)$, 
$ F(x) = -cos(x) + c $ 
is the antiderivative of $f$, where $c in RR$ is an arbitrary constant. We can 
verify this fact by computing $F'(x)$.

*Proposition (Properties of Integration).* 
- For arbitrary continuous function $f, g: RR -> RR$,
$ integral f(x) + g(x) dif x = integral f(x) dif x + integral g(x) dif x. $
- For arbitrary continuous function $f: RR -> RR$ and scalar $a in RR$, 
$ integral a f(x) dif x = a integral f(x) dif x. $
- For arbitrary integrable function $f: RR -> RR$, interval $[a, b] subset.eq RR$, $c in [a, b]$,
$ integral_a^b f(x) dif x = integral_a^c f(x) dif x + integral_c^b f(x) dif x. $

*Example.* Consider $f(x) = e^(-x)$ and $g(x) = 6x^2$. We can see that
$ integral f(x) + 2g(x) dif x 
  &= integral e^(-x) + 12 x^2 dif x \
  &= -e^(-x) + 4x^3 + c, $

and 

$ integral f(x) dif x + 2 integral g(x) dif x 
  &= integral e^(-x) dif x + 2 integral 6x^2 dif x \
  &= -e^(-x) + c_1 + 2 times 2 x^3 + c_2 \ 
  &= -e^(-x) + 4 x^3 + c $

*Theorem (Fundamental Theorem of Calculus).* If $f: [a, b] -> RR$ is continuous 
over $[a, b]$ and $F$ is an antiderivative of $f$, then 
$ integral^a_b f(x) dif x = F(b) - F(a). $

== Initial Value Problem (IVP)
_\* Solve the undetermined constant $c$ with given constraint(s)._

*Example.*  What is the antiderivative of $f(x) = 1/(2x) + sec^2(pi x)$, with 
$F(1) = 0$?

Step 1: Find the antiderivative of $f$.
$ 
F(x)
  &= integral f(x) dif x \
  &= integral 1/(2x) + sec^2(pi x) dif x\
  &= 1/2 ln(x) + 1/pi tan(pi x) + c 
$

Step 2: Solve $c$ with the given constraint $F(1) = 0$.

$
F(1) &= 0\
1/2 ln(1) + 1/pi tan(pi) + c &= 0\
c &= 0
$

Combining results above, we have 
$ F(x) = 1/2 ln(x) + 1/pi tan(pi x) $

== Integration Techniques
=== U-Substitution
*Theorem (U-Substitution).* Let $f: [a, b] -> RR$ and $G: [alpha, beta] -> RR$, 
by carefully choosing a function $u(x)$, we can write the definite integral of 
$f$ in terms of $G$ and $u$, that is:
$ integral^b_a f(x) dif x = integral^alpha_beta G(u)/(u'(x)) dif u. $

*Example.* Consider
$ integral_0^(pi/3) tan(x) dif x. $
We will compute this definite integral step by step:
+ *Choose an appropriate $u(x):$* Let $u(x) = cos(x)$.
+ *Compute write $f(x)$ in terms of $G(u) / (u'(x)):$* $ G(u) / (u'(x)) = 1/u.$
+ *Find the changed upper and lower bound of definite integral:* $alpha = u(0) = 1, beta = u(pi/3) = 1/2.$
+ *Compute the definite integral* by putting all together:
$ integral_0^(pi/3) tan(x) dif x 
    &= integral_0^(pi/3) tan(x) dif x \
    &= integral_0^(pi/3) sin(x)/cos(x) dif x \
    &= integral_(1/2)^1 1/u dif u \
    &= [ ln|u| ]^0_(1/2)\
    &= ln(1) - ln(1/2)\
    &= ln(2) $

=== Integration By Parts
*Theorem (Integration By Parts).* Sometime is simply written "by parts" for 
shorthand.
$ integral^b_a u(x)v'(x) dif x = [u(x)v(x)]^b_a - integral^b_a u'(x)v(x) dif x. $
#rect([
  _Remark._ To apply integration by parts, we need to select appropriate $u(x)$
  and $v'(x)$ before we actually begin applying the formula. Sometime it may 
  seem hard to have an idea of assign which to which in the first place, but 
  there's a general rule:

  #align(center)[
    inverse trigs --------- logs --------- polys --------- trigs/exps
  ]

  Functions on the right are likely to be selected as $v'(x)$, in which we are
  going to integrate with, in the later calculation; whereas functions on the 
  left are likely to be selected as $u(x)$, in which we are going to 
  differentiate.
  
  The intuition behind is because inverse functions and logarithmic functions,
  like $arctan(dot) "and" ln(dot)$, are hard to integrates, you are encouraged to 
  try to find the antiderivative of those by yourself (either by applying u-sub
  or by parts is doable) and it will be an excellent exercise. But the key is 
  that, once we differentiate them, they become a fraction which we can seek 
  techniques already learnt to find a solution.
])
*Example.* Compute the integral by using integration by parts
$ integral x arctan(x) dif x. $
By applying the technique introduced above, define:
$ u(x) = arctan(x), v'(x) = x, $
and it follows that 
$ u'(x) = 1/(1+x^2), v(x) = 1/2 x^2. $
By substituting the result into the formula of integration by parts gives:
$ 
integral x arctan(x) dif x 
  &= 1/2 x^2 arctan(x) - 1/2 integral x^2 / (1 + x^2) dif x \
  &= 1/2 x^2 arctan(x) - 1/2 integral (1 + x^2 - 1) / (1 + x^2) dif x \
  &= 1/2 x^2 arctan(x) - 1/2 integral 1 - 1/(1 + x^2) dif x \
  &= 1/2 x^2 arctan(x) - 1/2 x + 1/2 arctan(x) + c
$

*Example.* Compute the indefinite integral 
$ I = integral e^x sin(x) dif x. $
Since trigonometric and exponential functions are interchangeably selected as
$u(x)$, so we are going to do one case here, the remaining is left as exercise.

Define 
$ u(x) = e^x, v'(x) = sin(x), $
therefore we have 
$ u'(x) = e^x, v(x) = -cos(x) $
which follows that 
$ I = -e^x cos(x) + integral e^x cos(x) dif x. $
Furthermore, apply by parts twice, with $u(x) = e^x, v'(x) = cos(x)$, we have
$ I &=  -e^x cos(x) + e^x sin(x) - integral e^x sin(x) dif x + c\
  I &=  -e^x cos(x) + e^x sin(x) - I + c\ 
  2I &= e^x sin(x) - e^x cos(x) + c\
  I &= 1/2 e^x sin(x) - 1/2 e^x cos(x) + c
$

=== Tabular Method
Sometime we find it is hard to solve an integral with applying integration by 
one or two times. In this case, we can draw a table to assist us, to make the 
computation procedure more clear and well-organized.

*Example.* Compute the following integral:
$ integral x^4 sin(x) dif x $
We have seen this pattern quite a lot as we have some intuition that thinking
this can be solved by applying integration by parts. As the general trend of 
choosing $u(x)$ and $v'(x)$, let's define 
$ u(x) = x^4, v'(x) = sin(x). $
Then, we can draw a table to trace the computation steps while we are doing by
parts:
#figure(
  image("img/tabular-method.png", width: 25%),
  caption: [Tabular Method]
)
Firstly make a table contains three columns, where 
- the first column indicates the sign in front to the integration we have on each stage,
- the second column indicates the $u(x)$ in each stage of the integration we have,
- the third column indicates the $v'(x)$ in each stage of the integration we have.
Then, by multiplying each term as the red arrows indicate, we end up with
$
integral x^4 sin(x) dif x 
&= underbrace(+,"Sign") space  underbrace(x^4, u(x)) times underbrace((-cos(x)), v'(x))\
&quad quad - space 4x^3 times (-sin(x))\
&quad quad + space 12x^2 times cos(x)\
&quad quad - space 24x times sin(x) + c\
&= -x^4cos(x) + 4x^3sin(x) + 12x^2cos(x) - 24 x sin(x) - 24cos(x)  + c.
$

=== Partial Fraction Decomposition (PFD)
Sometimes, it is easier to deal with two or three simple, separated fractions 
than to deal with one complicated fraction. For example 
$ 2 / (x^2 - 1) $
can be written as 
$ - 1/(x-1) + 1/(x+1) $
as you can verify. 

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()
= Matrix Operations
== Eigenvalues and Eigenvectors

= Multi-Variable Calculus

= Regression Analysis

= Differential Equations (DE)
== First Order DE
== Second Order DE
== Stability of DE Solutions

= Non-linear System of Equations


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()
= Appendix
== Commonly Used Integration Formula
*Basic Integration Rules*
#align(center, table(
  columns: 2,
  align: horizon,
  inset: 10pt,
  [$ f(x) $], [$ integral f(x) dif x $],
  [$ x^n, n eq.not 1 $], [$ 1/(n+1) x^(n+1) + c $],
  [$ 1/x $], [$ ln(x) + c $],
  [$ e^(a x) $], [$ 1/a e^(a x) + c $],
  [$ sin(x) $], [$ -cos(x) + c $],
  [$ cos(x) $], [$ sin(x) + c $],
  [$ sec^2(x) $], [$ tan(x) + c $],
  [$ sec(x)tan(x) $], [$ sec(x) + c$],
  [$ csc^2(x) $], [$ -cot(x) + c $],
  [$ csc(x)cot(x) $], [$-csc(x) + c $],
  [$ 1/(x^2 + a^2) $], [$ 1/a arctan(x/a) + c $],
))

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

#pagebreak()
== Trigonometric Identities
$ 
sin(-x) = -sin(x)\
cos(-x) = cos(x)\
sin^2(x) + cos^2(x) = 1\
sin(x plus.minus y) = sin(x)cos(y) plus.minus cos(x)sin(y)\
cos(x plus.minus y) = cos(x)cos(y) minus.plus sin(x)sin(y)\
sin(2x) = 2sin(x)cos(x)\
cos(2x) = cos^2(x) - sin^2(x)\
tan(x) = sin(x)/cos(x)\
sec(x) = 1/cos(x)\
csc(x) = 1/sin(x)\
1+tan^2(x) = sec^2(x)
$