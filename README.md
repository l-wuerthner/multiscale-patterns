This repository provides the code associated with the paper:

# Bridging scales in a multiscale pattern-forming system 

#### Authors: Laeschkir Würthner, Fridtjof Brauns, Grzegorz Pawlik, Jacob Halatek, Jacob Kerssemakers, Cees Dekker, Erwin Frey

Preprint available on [arXiv:2111.12043](https://arxiv.org/abs/2111.12043)

## Numerical simulations

The numerical simulation results presented in the manuscript were produced using the commercially available Finite element solver *COMSOL Multiphysics 6.0*.
The corresponding .mph COMSOL file is provided in "COMSOL simulation/Min-dynamics-wedge-geometry.mph".
It should be noted that this is a very large simulation with several millions degrees of freedom (mesh elements).


## Linear stability analysis

The analysis of pattern-forming instabilities (as described in the manuscript and the Supplementary Information) was performed in Mathematica. The code for the linear stability analysis is provided in the module "Mathematica/lsa_min-system_rect.m".

## Pattern reconstruction
The reconstruction of regional patterns from the commensurability criterion (as described in the manuscript ) was also carried out in Mathematica. The Notebook is provided in "Mathematica/reconstruction_commensurability.m".
For practical purposes, we also provide the slice-averaged simulation exports (from the Finite element solver) "Mathematica/MinDslicedavg.m" for the MinD densities and "Mathematica/MiEslicedavg.m" MinE densities, respectively.
