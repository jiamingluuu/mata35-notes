#set text(size: 13pt)
#set math.equation(numbering: "(1)")
#set rect(width: 100%, radius: 8pt, fill: rgb("#f2f2f2"), stroke: 1pt, 
            inset: 12pt)
= Differential Equations
== Introduction
*Definition.* _Differential equation (DE)_ is an equation involving functions 
and their derivatives.

The study of differntial equations plays a significant role in the modern study
of physics, engineering, economics, and etc. To dive deep in the mathematically 
rigorous dicussion of differnetial equation, it is inevitable to introduce a 
diverse branches of mathematics, for instance, analysis and numerical methods. 
In light of the limitation to the person who made the note, we are only going 
to talk about the most fundamental part of differneitlal equation.

== First Order Differential Equations
*Definition.* The _order_ of a differential equation is defined by the highest 
degree of derivative of the differential equation has. 

*Definition.* let $y: RR -> RR$ be a function with variable $t$, and 
$f: RR^2 -> RR$. A _first order differential equatoin_ has the the form
$ (dif y)/(dif t) = f(y, t) $

*Example.* _Acceleration_ describes the rate of change of velocity of an object.
Suppose a ball is dropped from air and undergoes a free fall, that is, only 
gravity is acting on the ball, its acceleration $a(t) = (dif v)/(dif t)$ is
characterized by a first order DE
$ (dif v)/(dif t) = g. $
Where $g$ is the _gravitational constant_

There is a special class of DE we are interested to study: separable DE.

*Definition.* A _separable differential equation_ can be written as 
$ (dif y)/(dif t) = M(y) N(t). $
To solve a separable, we follows the following strategy in general:
1. Re-write the given DE into the form given in (3).
2. Separable varable, so each side of equation only contains one type of variable $ 1/(M(y))(dif y)/(dif t) = N(t). $
3. Then integrate both sides of the equation at the same time. $ integral 1/(M(y)) (dif y)/(dif t) dif t = integral N(t) dif t. $

*Example* (Newton's Law of Cooling). Let $T(t)$ be the temperature of an object
at time $t$, and $T_s$ be the temperature of surrounding environment. The 
rate of change of temperature of $T(t)$ is described as 
$ (dif T)/ (dif t) = k(T(t) - T_s), $
where both $k, T_s$ are a constant in real number.

To solve (6), we are going to follow the strategy stated before:
$
1/(T(t) - T_s) (dif T)/(dif t) &= k\
integral 1/(T(t) - T_s) (dif T)/cancel(dif t) cancel(dif t) &= integral k dif t\
integral 1/(T(t) - T_s) dif T &= integral k dif t\
ln abs(T(t) - T_s) &= k t + c\
T(t) - T_s &= e^(k t + c)\
T(t) - T_s = e^(k t) times e^c\
T(t) = A e^(k t) + T_s\
$

#rect[
  _Remark._ Notice that it is irrigorous to treat the derivative 
  $(dif T)/(dif t)$ as a fraction and cancel it with the term $dif t$. The 
  definition of derivative involving limit, and is to find the flactuation of 
  the original function in the infidecimal change in $t$, that is 
  $ (dif T)/(dif t) equiv lim_(h -> 0) (T(t + h) - T(t))/(h), $
  which is a unity becuase the limit is not gaurantee to be congervent. Whereas when we write the whole term 
  $ 1/(T(t) - T_s) (dif T)/(dif t) dif t, $
  it is a 1-form of differential form, which is a smooth section of the 
  co-tangent bundle on a manifold. Under no circumstance should those two 
  notion to be inter-changibly used.
]

However, what if the DE is not separable? For instace, how can we solve for
a differenial equation has the form 
$ A(x)(dif y)/(dif x) + B(x) y = C(x), $
where function $A, B, C$ functions over real. In this senario, we need 
introduce some prior knowledge.

*Definition.* Let $f: RR^n -> RR$ be a differentiable function over $RR$ with 
respect to variable $x_1, x_2, ..., x_n$. The _total derivative_ $dif f$ can be
written as 
$ dif f = sum^n_(i = 1) (diff f)/(diff x_i) dif x_i $

*Example.* The total derivative of $f(x, y) = x^2 + y^2$ is given by
$
dif f 
&= (diff f)/(diff x)dif x + (diff f)/(diff y)dif y\
&= diff/(diff x)(x^2 + y^2)dif x + diff/(diff y)(x^2 + y^2)dif y\
&= 2x dif x + 2y dif y\
$

*Definition.* A differential form $alpha$ is _exact_ if there exists some 
differential form $beta$ such that 
$ dif beta = alpha $

*Proposition.* Let $P, Q: RR^2 -> RR$ be multi-variable functions with respect 
to variable $x$ and $y$. Then the differential form 
$ P dif x + Q dif y $
is exact if and only if
$ (diff P)/ (diff y) = (diff y)/ (diff x) $

#rect[ 
  _Remark._ The notion of exactness is telling us, if a differential form
  $alpha$ is exact, then it can be obtained by computing the total derivative 
  of another differential form $beta$. 
  
  Furthermore, the proposition above provides us an easy, swift way of verifying 
  if a given differential form is exact. The intuition behinds the proposition 
  is the following: if equation (12) were exact, then $P$ and $Q$ are the 
  derivative of same function but with respect to different variable. That is
  $ P = (diff f)/(diff x), quad Q = (diff f)/(diff y). $
  Therefore, 
  $ (diff P)/(diff y) = (diff^2 f)/(diff y diff x) "and" 
  (diff Q)/(diff x) = (diff^2 f)/(diff x diff y), $
  which are essentially equal.
]

In light the the introductory of differential form and exactness, we can take 
their advantages in the discussion of solving DEs. Given a first order 
differential equation with the form:
$ A (dif y)/(dif x) + B y = C, $
where $A, B, C: RR -> RR$ are functions over real with respect to variable $x$,
we can re-write it by using differential forms 
$ underbrace(A dif y + B y dif x, alpha) = C dif x. $
Hence, if $alpha$ were exact, then by equation (11) there exists some other form
$beta$ such that 
$ dif beta = alpha. $
It implies that (17) is equivalent to 
$ dif beta = C dif x. $
And by integrating both sides of (19), we can obtain the solution of our DE 
(16) in implicit form:
$ 
integral dif beta &= integral C dif x\
beta &= integral C dif x
$

*Example.* Solve the following differential equation
$ (4 + t^2) (dif y)/(dif t) + 2 t y = 4t. $
Let's firstly write it using differential form and check if it is exact:
$ underbrace((4 + t^2) dif y, P) + underbrace(2t y dif t, Q) = 4t dif t. $
$ 
(diff P)/(diff t) 
&= diff/(diff t) (4 + t^2)\
&= 2t\
(diff Q)/ (diff y)
&= diff/(diff y)(2t y)\
&= 2t.
$
So we can see the left part of (22) is an exact differential form, which is 
implying that 
$ P = (diff f)/(diff y), quad Q = (diff f)/(diff y). $
Hence 
$
f
&= integral P dif y\
&= integral 4 + t^2 dif y\
&= 4y + t^2 y + h(t)
$
And we can solve the unknown function $h(t)$ by computing the derivative of 
$f$ with respect to $t$:
$
(diff f)/(diff t)
&= diff/(diff t)(4y + t^2 y + h(t))\
&= 2t y + h'(t)\
$
Therefore, by using the fact that 
$ 
(diff f)/(diff t) &= Q\
2t y + h'(t) &= 2t y\
h'(t) &= 0
$
And it follows that $h(t) = c$, where $c$ is an aribitrary constant in $RR$.
Hence, we have the final answer:
$ f = 2y + t^2 y + c $

However, what if the given DE is not exact? Then we need to develop some trick
to modify the DE and change to exact.

*Definition.* Given a DE of the from 
$ A dif y + B y dif x = C $
A _integrating factor_ is an auxiliary function $I(x)$ such that when we 
multiply it to the both sides of the eqaution, making
$ I A dif y + I B dif x $
to be an exact differential form.

*Proposition.* If a DE has the form 
$ A dif y + B y dif x = C, $
where $A, B, C: RR -> RR$ are function with respect to variable $x$, and $A$ is
non-zero over its domain. Then the DE has an integrating factor 
$ I(x) = e^(integral P(x) dif x), $
where $P(x) = B(x)/A(x)$.

*Example.* Solve the following DE
$ x dif y + 2y dif x = 4x^3 dif x $
As you can verify, this DE is not exact, so we are going to find the 
integrating factor 
$
I(x) 
&= e^(integral P(x) dif x)\
&= e^(integral 2/x dif x)\
&= e^(2ln(x))\
&= x^2
$

By multiplying both sides by the integrating factor, we have 
$ 
x dif y + 2y dif x &= 4x^3 dif x\
dif y + (2y)/x dif x &= 4x^4 dif x\
x^2 (dif y + (2y)/x dif x) &= x^2 dot 4x^4 dif x\
x^2 dif y + 2y x dif x &= 4x^6 dif x\
d(x^2 y) &= 4x^6 dif x\
integral d(x^2 y) &= integral 4x^6 dif x\
x^2 y &= 4/7 x^7 + c
$