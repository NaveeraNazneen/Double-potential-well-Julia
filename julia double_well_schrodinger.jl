using LinearAlgebra

function schrodinger()
    N = 200
    L = 10.0
    dx = L / (N - 1)
    
    # Better: symmetric grid around zero
    x = range(-L/2, L/2, length=N)
    
    # Potential: double well V(x) = (x² - 1)²
    V = @. (x^2 - 1.0)^2
    
    # Hamiltonian matrix: kinetic + potential energy
    H = zeros(N, N)
    kinetic_factor = 1.0 / dx^2  # Note: ℏ²/2m = 1/2, but absorbed in units
    
    for i in 1:N
        H[i, i] = 2.0 * kinetic_factor + V[i]
        if i > 1
            H[i, i-1] = -kinetic_factor
        end
        if i < N
            H[i, i+1] = -kinetic_factor
        end
    end
    
    # Initial guess for wavefunction
    v = ones(N)
    v = v / norm(v)
    
    # Power iteration with convergence check
    tolerance = 1e-10
    max_iterations = 1000
    prev_energy = 0.0
    
    for i in 1:max_iterations
        v = H * v
        v = v / norm(v)
        
        # Calculate energy (Rayleigh quotient)
        E = (v' * H * v)[1]
        
        # Check convergence
        if abs(E - prev_energy) < tolerance
            println("Converged after $i iterations")
            break
        end
        prev_energy = E
    end
    
    E = (v' * H * v)[1]
    println("Ground state energy = $E")
    
    println("Sample wavefunction values:")
    for i in 1:10
        println("x = $(x[i]): ψ = $(v[i])")
    end
    
    return E, x, v
end

# Run the function
energy, positions, wavefunction = schrodinger()
