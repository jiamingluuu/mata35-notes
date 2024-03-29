#set page(paper: "a4")
#set text(11pt)
#set par(justify: true)
#set math.mat(delim: "[")

= Elementary Row Operations and Row Echelon Form
Row echelon form (REF) of a matrix can be obtained by using Gaussian 
elimination, it plays significant role in the problem of finding solution with
respect to a linear system. Let's consider the following system of equations
with $n$ variables:
$
cases(
  a_11 x_1 + a_12 x_2 + ... + a_(1n) x_n = b_1\
  a_21 x_1 + a_22 x_2 + ... + a_(2n) x_n = b_2\
    quad quad quad quad quad quad quad dots.v\
  a_(n 1) x_1 + a_(n 2) x_2 + ... + a_(n n) x_n = b_n\
)
$
It can be simplified into matrix form 
$ A x = b $
with 
$
A = mat(
  a_11, a_12, ..., a_1n;
  a_21, a_22, ..., a_2n;
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
), quad
x = mat(
  x_1; x_2; dots.v; x_n;
),quad 
b = mat(
  b_1; b_2; dots.v; b_n;
).
$
Where $A$ is the coefficient matrix, $b$ is the constant matrix, and $x$ is the 
matrix of variables.
== Elementary Row Operations (ERO)
To solve the system of linear equations, we are perform elementary row 
operations:
+ Swapping two rows:
$
mat(
  a_11, a_12, ..., a_1n;
  dots.v, dots.v, dots.down, dots.v;
  a_(i 1), a_(i 2), ..., a_(i n);
  dots.v, dots.v, dots.down, dots.v;
  a_(j 1), a_(j 2), ..., a_(j n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
) op(arrow.long, limits: #true)^(r_i^' = r_j, r_j^' = r_i)
mat(
  a_11, a_12, ..., a_1n;
  dots.v, dots.v, dots.down, dots.v;
  a_(j 1), a_(j 2), ..., a_(j n);
  dots.v, dots.v, dots.down, dots.v;
  a_(i 1), a_(i 2), ..., a_(i n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
)
$
+ Multiplying a row by a nonzero number:
$
mat(
  a_11, a_12, ..., a_1n;
  dots.v, dots.v, dots.down, dots.v;
  a_(i 1), a_(i 2), ..., a_(i n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
) op(arrow.long, limits: #true)^(r_i^' = c times r_i)
mat(
  a_11, a_12, ..., a_1n;
  dots.v, dots.v, dots.down, dots.v;
  c times a_(i 1), c times a_(i 2), ..., c times a_(i n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
)
$
+ Adding a multiple of one row to another row.
$
mat(
  a_11, a_12, ..., a_1n;
  dots.v, dots.v, dots.down, dots.v;
  a_(i 1), a_(i 2), ..., a_(i n);
  dots.v, dots.v, dots.down, dots.v;
  a_(j 1), a_(j 2), ..., a_(j n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
) op(arrow.long, limits: #true)^(r_i^' = r_i + c r_j)
mat(
  a_11, a_12, ..., a_1n;
  dots.v, dots.v, dots.down, dots.v;
  a_(i 1) + c a_(j 1), a_(i 2) + c a_(j 2), ..., a_(i n) + c a_(j n);
  dots.v, dots.v, dots.down, dots.v;
  a_(j 1), a_(j 2), ..., a_(j n);
  dots.v, dots.v, dots.down, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n);
)
$
The greatest advantage of elementary row operations is: they *do not change the
solution space of our system of equations*, that is, the set of solutions of REF 
generated by using elementary row operations is identical to the origin system.
== Find REF by Gaussian Elimination
*Definition.* Given a matrix $A in M_(n times m)(RR)$, $A$ is in _row echelon 
form (REF)_ if 
- All rows with entry all zero are at the bottom.
- The pivot (the first non-zero entry) is 1 and is on the right of the pivot of every row above.

*Definition.* A matrix is in _reduced row echelon form (RREF)_ if it is in REF,
and 
- Each column containing a pivot has zeros in all entries above the pivot.

*Example.* The following matrix is in REF, but not in RREF:
$
mat(
  1, a_0, a_1, a_2, a_3;
  0, 0, 1, a_4, a_5;
  0, 0, 0, 1, a_6;
  0, 0, 0, 0, 0;
).
$

== Find the Solution Set in RREF
Define the augmented matrix 
$
B 
&= mat(A | b)\
&= mat(
  a_11, a_12, ..., a_(1n), b_1;
  a_21, a_22, ..., a_(2n), b_2;
  dots.v, dots.v, dots.down, dots.v, dots.v;
  a_(n 1), a_(n 2), ..., a_(n n), b_n;
  augment: #(vline: -1)
), quad
$
our goal is reduce $B$ to its RREF 
$
mat(
  1, 0, ..., 0, s_1;
  0, 1, ..., 0, s_2;
  dots.v, dots.v, dots.down, dots.v, dots.v;
  0, 0, ..., 1, s_n;
  augment: #(vline: -1)
)
$
if possible. The solution of our original system $A x = b$ is just 
$
cases(
  x_1 &= s_1\
  x_2 &= s_2\
  &space dots.v\
  x_n &= s_n
)
$

*Example.* Lets be more specific, consider the following linear system
$
cases(
  2x_1 + x_2 - x_3 &= 8\
  -3 x_1 - x_2 + 2 x_3 &= -11\
  -2 x_1 + x_2 + 2 x_3 &= -3
)
$
To solve this system, firstly we are going to write it into matrix form:
$
A = mat(
  2, 1, -1;
  -3, -1, 2;
  -2, 1, 2
), quad
x = mat(
  x_1; x_2; x_3;
), quad
b = mat(
  8; -11; 3
).
$
The corresponding augmented matrix is 
$
mat(
  2, 1, -1, 8;
  -3, -1, 2, -11;
  -2, 1, 2, 3;
  augment: #(vline: -1)
)
$
By doing Gaussian elimination, we have
$
mat(
  2, 1, -1, 8;
  -3, -1, 2, -11;
  -2, 1, 2, 3;
  augment: #(vline: -1)
) 
&op(arrow.long, limits: #true)^(r_2^' = r_2 + 3/2 r_j)
mat(
  2, 1, -1, 8;
  0, 1/2, 1/2, 1;
  -2, 1, 2, 3;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_2^' = r_2 + r_1)
mat(
  2, 1, -1, 8;
  0, 1/2, 1/2, 1;
  0, 2, 1, 5;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_3^' = r_3 - 4 r_2)
mat(
  2, 1, -1, 8;
  0, 1/2, 1/2, 1;
  0, 0, -1, 1;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_2^' = r_2 + 1/2 r_3)
mat(
  2, 1, -1, 8;
  0, 1/2, 0, 3/2;
  0, 0, -1, 1;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_1^' = r_1 - r_3)
mat(
  2, 1, 0, 7;
  0, 1/2, 0, 3/2;
  0, 0, -1, 1;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_1^' = r_1 - 2 r_2)
mat(
  2, 0, 0, 4;
  0, 1/2, 0, 3/2;
  0, 0, -1, 1;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_1^' = 1/2 r_1)
mat(
  1, 0, 0, 2;
  0, 1/2, 0, 3/2;
  0, 0, -1, 1;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_2^' = 2 r_2)
mat(
  1, 0, 0, 2;
  0, 1, 0, 3;
  0, 0, -1, 1;
  augment: #(vline: -1))\
&op(arrow.long, limits: #true)^(r_3^' =  -r_3)
mat(
  1, 0, 0, 2;
  0, 1, 0, 3;
  0, 0, 1, -1;
  augment: #(vline: -1)).\
$
And this gives us the solution 
$
cases(
  x_1 = 2\
  x_2 = 3\
  x_3 = -1
).
$

== Set of Solution of a System of Linear Equations
However, it is not alway possible to find an unique solution for all linear 
system. There are three scenarios of a linear system:
- The system has a unique solution.
- The system has infinitely many solutions.
- The system has no solution (aka. inconsistent).
The best way of distinguish the three cases above is to take the advantage of 
REF. In general, for the augmented matrix $mat(A | b)$ of a linear system
with $n$ variable and $n$ equations, the system has:
- a unique solution if every row has a pivot in its REF,
- infinitely many solution if there exists a row of all zeros in its REF,
- no solution if there exists a row of $mat(0, 0, ..., 0 | c)$, for some nonzero constant in its REF.

*Example.* Suppose 
$
A = mat(
  1, 4, -2;
  2, 7, -1;
  2, 9, alpha;
),
x = mat(
  x_1, x_2, x_3
) "and"
b = mat(
  4, -2, beta
).
$
Find conditions on $alpha$ and $beta$ so that $A x = b$ has
- no solution,
- a unique solution,
- infinitely many solution.
Before answering this question directly, we should write the argument matrix
$mat(A | b)$ in REF. As you can verify, the following is the REF of $mat(A | b)$
$
mat(
  1, 4, -2, 4;
  0, 1, -3, 10;
  0, 0, alpha + 7, beta - 18;
  augment: #(vline: -1)
)
$
Therefore, from the REF 
#footnote([In rigorous speaking, we cannot claim this matrix is in REF because 
there is no guarantee for $alpha + 7 = 1$, or $alpha + 7 = 0$ and 
$beta - 18 = 1$, which are required for REF.]) 
of the matrix, we can conclude $A x = b$
- has no solution if $alpha + 7 = 0$ and $beta - 18 eq.not 0$,
- has a unique solution if $alpha + 7 = 1$ and $beta$ can be arbitrary real number,
- has infinitely many solution if $alpha + 7 = 0$ and $beta - 18 = 0$.