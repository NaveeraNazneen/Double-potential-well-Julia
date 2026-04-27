# Double-potential-well-Julia

## Overview

This project numerically solves the time-independent Schrödinger equation for a particle in a one-dimensional double-well potential using a finite difference method and matrix-based quantum mechanics.

---

## Physical System

The system is defined by the potential:

V(x) = (x² - 1)²

This produces:
- Two symmetric wells at x = -1 and x = +1  
- A central barrier at x = 0  
- Quantum tunneling between wells  

---

## Schrödinger Equation

The system solves:

- d²ψ/dx² + V(x)ψ = Eψ

(implemented in discretized matrix form)

---

## Method Used

- Space discretized into N grid points
- Second derivative approximated using finite differences
- Hamiltonian matrix constructed as:

H = Kinetic + Potential

- Iterative multiplication (power iteration) used to approximate eigenstate
- Wavefunction normalized at each step

---

## Key Idea

Repeated application:

v = H * v

drives the system toward an eigenstate of the Hamiltonian.

Normalization ensures stability of the wavefunction.

---

## Output

The program returns:
- Approximate eigen-energy
- Sample wavefunction values
- Spatial grid points

---

## Physical Interpretation

The resulting wavefunction represents a quantum particle that can:

- Localize in left or right well
- Tunnel through the central barrier
- Form symmetric or antisymmetric states

This models quantum bistability and tunneling phenomena.

---

## How to Run

```bash
julia double_well_schrodinger.jl
