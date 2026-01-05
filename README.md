# Tesla_simpleFoam
Drag optimisation of a simplified Tesla model S with the DAFoam package

## Geometry Files

Due to file size limitations, geometry files are hosted separately:

**Download:** [LRZ Link](https://syncandshare.lrz.de/getlink/fiJyvQSdnxBFL1h5bAwA6j/)


## Quick Start
```bash
# 1. Clone repository
git clone https://github.com/dbalasko/Tesla_simpleFoam.git
cd Tesla_simpleFoam

# 2. Download geometry files from link above
# Place them in constant/triSurface

# 3. Generate mesh
./Allclean
./preProcessing.sh

# 4. Start docker for DAFoam
docker run -it --rm -u dafoamuser --mount "type=bind,src=$(pwd),target=/home/dafoamuser/mount" -w /home/dafoamuser/mount dafoam/opt-packages:v4.0.3 bash

# 5. Create free-form deformation points
python3 FFD/genFFD.py
# Can use convert_ffd_to_vtk.py to generate a file which can be viewed in paraview (sanity check)

# 6. Run simulation
mpirun -np 4 python runScript.py 2>&1 | tee logOpt.txt


## Case Details
- Solver: DAsimpleFoam (steady-state RANS)
- Turbulence: k-omega SST
- Mesher: snappyHexMesh
- Domain: 75m × 6m × 5m wind tunnel (symmetry across centreline of car)

