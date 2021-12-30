<!--This file was generated, do not modify it.-->
To solve an optimization problem with Ipopt, the first thing to do is define your problem.
In this example, let's assume we want to solve the following problem:

\begin{aligned}
\text{min}_x \quad & (x_1 - 1)^2 + 4 (x_2 - x_1)^2 \\
\text{s.to} \quad & x_1^2 + x_2^2 \leq 1 \\
& x_1 \leq 0.5 \\
& 0.25 \leq x_2 \leq 0.75
\end{aligned}

Since our problem is simple, ADNLPModels is a perfect choice.
It defines an model that uses automatic differentiation.
It is just a matter of passing your functions and arrays to the constructor `ADNLPModel`.

```julia:ex1
using ADNLPModels

nlp = ADNLPModel(
  x -> (x[1] - 1)^2 + 4 * (x[2] - x[1]^2), # f(x)
  [0.5; 0.5], # starting point, which can be your guess
  [-Inf; 0.25], # lower bounds on variables
  [0.5; 0.75],  # upper bounds on variables
  x -> [x[1]^2 + x[2]^2], # constraints function - must be an array
  [-Inf], # lower bounds on constraints
  [1.0]   # upper bounds on constraints
)
```

Now, just pass your problem to ipopt.

```julia:ex2
using NLPModelsIpopt

output = ipopt(nlp)
```

To remove the output, use print_level

```julia:ex3
output = ipopt(nlp, print_level=0)
```

The `output` variable containt essential information about the solution.
They can be access with `.`.

```julia:ex4
print(output)
```

```julia:ex5
x = output.solution
println("Solution: $x")
```

That's it. If your model is more complex, you should look into NLPModelsJuMP.jl.
On the other hand, if you need more control and want to input your model manually, look for the specific how-to.

