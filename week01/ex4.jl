using LinearAlgebra

function expMatrix(D::Matrix{Float64})
    λ, V = eigen(D);
    λ = exp.(λ);
    D = diagm(λ);
    return V * D * inv(V)
end

A = [[1., 2.] [3., 4.]];
exp(A) - expMatrix(A)


α = [10^i for i in LinRange(-16, 10, 100)];

error_exp = []
for i in α
    B = [1+i 0; 0 1-i];
    append!(error_exp, norm(exp(B) - expMatrix(B)) / norm(exp(B)))
end