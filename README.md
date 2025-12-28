# Tesla_simpleFoam
simpleFoam simulation of a simplified Tesla model S
# Tesla Model S CFD Simulation

OpenFOAM external aerodynamics case using snappyHexMesh and simpleFoam.

## Geometry Files

Due to file size limitations, geometry files are hosted separately:

**Download:** [LRZ Link](https://syncandshare.lrz.de/getlink/fiJyvQSdnxBFL1h5bAwA6j/)

## Quick Start
```bash
# 1. Clone repository
git clone https://github.com/dbalasko/Tesla_simpleFoam.git
cd Tesla_simpleFoam

# 2. Download geometry files from link above
# Place them in constant/geometry

# 3. Generate mesh
./Allclean - WIP
./runMesh

# 4. Run simulation
./Allrun - WIP
#NOTE: Currently 0.orig has a bug at decomposePar, so it has to be renamed to 0, BUT be careful, the current Allclean deletes the 0 folder
```

## Case Details - WIP
- Solver: simpleFoam (steady-state RANS)
- Turbulence: k-omega SST
- Mesher: cartesianMesh (cfMesh)
- Domain: 50m × 30m × 20m wind tunnel

