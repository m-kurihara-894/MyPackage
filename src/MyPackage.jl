module MyPackage

function timeprop(F::Function, tmax::Float64, x0::Float64, v0::Float64, h::Float64)::Tuple{Float64, Float64}
    
    # Initialize variables
    t::Float64 = 0.0
    x::Float64 = x0
    v::Float64 = v0

    # Time propagation loop
    while t < tmax
        # Update the state using the function F
        x += h * v
        v += h * F(x, t)

        # Increment time
        t += h
    end

    return (x, v)
end

end # module MyPackage
