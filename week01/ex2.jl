## 
using LinearAlgebra
using Plots
##
function buildA(N=100, L=1, T=2, μ=1)
    h = L / (N+1);
    A = T * μ / h^2 * SymTridiagonal(-2 * ones(N+2), ones(N+1));
    return A;
end
##
N = 100; L = 1; T = 2; μ = 1;
A = buildA(N, L, T, μ);
eigDecomp = eigen(A);

Plots.scatter(eigDecomp.vectors[1,:])
Plots.scatter!(eigDecomp.vectors[2,:])
##
L = T = μ = 1;
true_val = pi^2 * T / (L^2 * μ);
##

for i = 1:5
    N = 100 + 2^i;
    A = buildA(N, L, T, μ);
    λ = eigvals(A, 1:1;)




    
