# Local slip resistances in body-centered cubic random alloys

## Foreword

The purpose of this project is to calculate the local slip resistances (LSR) in body-centered cubic random alloys. MoNbTi is used here an example.

## LAMMPS

Following [another project](https://github.com/shuozhixu/Modelling_2024), we can build LAMMPS with the MANYBODY package and submit jobs on [OSCER](http://www.ou.edu/oscer.html).

## Interatomic potential

The interatomic potential file `HfMoNbTaTiVWZr_Mubassira2025.eam.alloy` can be downloaded from [another GitHub repository](https://github.com/shuozhixu/CMS-EAM_2025). If one uses it, please cite [this paper](https://doi.org/10.1016/j.commatsci.2024.113587).


## Random structure

Al<sub>0.3</sub>CoCrFeNi has an face-centered cubic lattice, according to [this paper](https://doi.org/10.1016/j.actamat.2022.118600). 

In this alloy, the CSRO effect has been studied by [Sun et al.](https://doi.org/10.1016/j.matdes.2022.111214) and [Hasan et al.](https://doi.org/10.1016/j.commatsci.2024.112980), so we focus on the random structure.

Random structures are built using [Atomsk](https://atomsk.univ-lille.fr).

## Input files

LAMMPS input files are provided in the `input` directory on this GitHub repository. They were modified based on files of the same name in [another GitHub repository](https://github.com/shuozhixu/CMS-EAM_2025). Note that the `edge` input file should be used for an edge dislocation regardless of its slip plane; so should the `screw` input file.

## References

If you use any files from this GitHub repository, please cite

- Anshu Raj, Wu-Rong Jian, Shuozhi Xu, Local slip resistances and critical resolved shear stresses for edge dislocation glide on high-order planes in two refractory multi-principal element alloys, J. Vac. Sci. Tech. A (in press)
- Wu-Rong Jian, Arjun S. Kulathuvayal, Hanfeng Zhai, Anshu Raj, Xiaohu Yao, Yanqing Su, Shuozhi Xu, Irene J. Beyerlein, [Atomistic and data‑driven insights into the local slip resistances in random refractory multi-principal element alloys](https://doi.org/10.1016/j.ijplas.2026.104635), Int. J. Plast. 199 (2026) 104635