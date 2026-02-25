# Local slip resistances in body-centered cubic random alloys

## Foreword

The purpose of this project is to calculate the local slip resistances (LSR) in body-centered cubic (BCC) random alloys. MoNbTi is used here as an example.

Before calculating the LSRs in any BCC alloy, one needs to know its lattice parameter. Calculation of the lattice parameter of a BCC alloy can follow [this GitHub repository](https://github.com/shuozhixu/Modelling_2024), where MoNbTa was used as an example. Note that for the same alloy, the same interatomic potential must be used in both the lattice parameter calculation and the LSR calculations.

## LAMMPS

For a BCC alloy, one can calculate the mean LSRs of both edge and screw dislocations on all four slip planes, {110}, {112}, {123}, and {134}. For each unique combination of dislocation character and slip plane, 10 LSR valuels are needed to obtain the mean LSR value. In other words, for a BCC alloy, 80 LAMMPS simulations are needed to obtain 80 LSR values. It follows that 8 mean LSR values are obtained.

To run any one of the 80 LAMMPS simulations, place three files --- an interatomic potential file, an input file, and a data file --- into the same directory. It is estimated that each simulation takes 10--30 hours with 128 CPU cores. Determination of the LSR should follow that of the [Peierls stress](https://github.com/shuozhixu/LAMMPSatOU). Currently there is no way to obtain the LSR value automatically from the simulation result.

If the existing LAMMPS distribution does not have the MANYBODY package, one can follow [another GitHub repository](https://github.com/shuozhixu/Modelling_2024) to build LAMMPS with that package.

To use the [ML model developed by Jian et al.](https://github.com/wrj2018/LSR_2026), one should use 6 mean LSR values, excluding those on the {134} plane, as inputs. In other words, 60, rather than 80, LAMMPS simulations are needed for each BCC alloy if the purpose is to use the ML model.

## Interatomic potential file

The interatomic potential file `HfMoNbTaTiVWZr_Mubassira2025.eam.alloy` can be downloaded from [another GitHub repository](https://github.com/shuozhixu/CMS-EAM_2025). If one uses it, please cite [this paper](https://doi.org/10.1016/j.commatsci.2024.113587).

### Alloys other than MoNbTi

Use the same interatomic potential file for any alloys within the Hf-Mo-Nb-Ta-Ti-V-W-Zr system.

## Input file

LAMMPS input files are provided in the `input` directory in this GitHub repository. They were modified based on files of the same name in [another GitHub repository](https://github.com/shuozhixu/CMS-EAM_2025). Note that `peierls_edge_pad_y_normal.in` should be used for an edge dislocation regardless of the slip plane; so should `peierls_screw_pad_y_normal.in` for a screw dislocation.

### Alloys other than MoNbTi

Make two changes to the input file

- line 16, use the correct data file name
- line 28, use the correct element names

## Data file

Install [Atomsk](https://atomsk.univ-lille.fr) and use it to generate data files. Atomsk scripts are provided in the `data` directory in this GitHub repository. Use the correct script to generate the data file for each combination of dislocation character (edge or screw) and slip plane (from {110} to {134}). For example, for the screw dislocation on the {110} plane, run

	sh 110_screw.sh 

which will generate a data file named `data.MoNbTi_screw`.

For the same slip plane, either `110_edge1.sh` or `110_edge2.sh` should work. They refer to two different ways to build the atomistic structure containing an edge dislocation. For details, please refer to Figure 3 of [this paper](https://doi.org/10.1007/s44210-025-00060-8).

### Alloys other than MoNbTi

Make two changes to the atomsk script

- line 5, use the correct lattice parameter, in &Aring;
- change the element names; by default, the three elements are Mo, Nb, and Ti

## References

If you use any files from this GitHub repository, please cite

- Anshu Raj, Wu-Rong Jian, Shuozhi Xu, Local slip resistances and critical resolved shear stresses for edge dislocation glide on high-order planes in two refractory multi-principal element alloys, J. Vac. Sci. Tech. A (in press)
- Wu-Rong Jian, Arjun S. Kulathuvayal, Hanfeng Zhai, Anshu Raj, Xiaohu Yao, Yanqing Su, Shuozhi Xu, Irene J. Beyerlein, [Atomistic and data‑driven insights into the local slip resistances in random refractory multi-principal element alloys](https://doi.org/10.1016/j.ijplas.2026.104635), Int. J. Plast. 199 (2026) 104635