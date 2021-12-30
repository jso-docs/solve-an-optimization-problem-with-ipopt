# This file was generated, do not modify it.

A = rand(5, 5)
b = A * ones(5)
x = A \ b

using LinearAlgebra
norm(A * x - b), norm(x .- 1)

