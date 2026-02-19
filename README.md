# Local slip resistances in body-centered cubic random alloys

## Foreword

The purpose of this project is to calculate the local slip resistances (LSR) in body-centered cubic random alloys. MoNbTi is used here an example.

To use the [ML models developed by Jian et al.](https://github.com/wrj2018/LSR_2026), one should, for a given alloy, calculate the LSR of both edge and screw dislocations on all four slip planes, {110}, {112}, {123}, and {134}. In other words, eight LAMMPS simulations are needed to obtain eight LSR values.

## LAMMPS

Following [another project](https://github.com/shuozhixu/Modelling_2024), we can build LAMMPS with the MANYBODY package and submit jobs on [OSCER](http://www.ou.edu/oscer.html).

To run a LAMMPS simulation, put three files --- an interatomic potential file, an input file, and a data file --- into the same directory. Determination of the LSR should follow that of the [Peierls stress](https://github.com/shuozhixu/LAMMPSatOU).

## Interatomic potential

The interatomic potential file `HfMoNbTaTiVWZr_Mubassira2025.eam.alloy` can be downloaded from [another GitHub repository](https://github.com/shuozhixu/CMS-EAM_2025). If one uses it, please cite [this paper](https://doi.org/10.1016/j.commatsci.2024.113587).

### Alloys other than MoNbTi

Use the same interatomic potential file for any alloys within the Hf-Mo-Nb-Ta-Ti-V-W-Zr system.


## Input files

LAMMPS input files are provided in the `input` directory on this GitHub repository. They were modified based on files of the same name in [another GitHub repository](https://github.com/shuozhixu/CMS-EAM_2025). Note that `peierls_edge_pad_y_normal.in` should be used for an edge dislocation regardless of its slip plane; so should the `peierls_screw_pad_y_normal.in`.

### Alloys other than MoNbTi

Make two changes to the input file

- line 16, use the correct data file name
- line 28, use the correct element names

## Data files

Data files are generated using [Atomsk](https://atomsk.univ-lille.fr). Atomsk scripts are provided in the `data` directory in this GitHub repository.

### Alloys other than MoNbTi

Make two changes to the input file

- line 16, use the correct data file name
- line 28, use the correct element names

## References

If you use any files from this GitHub repository, please cite

- Anshu Raj, Wu-Rong Jian, Shuozhi Xu, Local slip resistances and critical resolved shear stresses for edge dislocation glide on high-order planes in two refractory multi-principal element alloys, J. Vac. Sci. Tech. A (in press)
- Wu-Rong Jian, Arjun S. Kulathuvayal, Hanfeng Zhai, Anshu Raj, Xiaohu Yao, Yanqing Su, Shuozhi Xu, Irene J. Beyerlein, [Atomistic and data‑driven insights into the local slip resistances in random refractory multi-principal element alloys](https://doi.org/10.1016/j.ijplas.2026.104635), Int. J. Plast. 199 (2026) 104635