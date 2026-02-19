# Al<sub>0.3</sub>CoCrFeNi: Atomistics: Basics

## Foreword

The purpose of this project is to calculate the basic structural parameters (including lattice parameter and elastic constants), generalized stacking fault energies (GSFE), and local slip resistances (LSR), in random Al<sub>0.3</sub>CoCrFeNi multi-principal element alloy (MPEA). To provide references, the same properties in Ni are also calculated.

## LAMMPS

Following [another project](https://github.com/shuozhixu/Modelling_2024), we can build LAMMPS with MANYBODY and EXTRA-COMPUTE packages and submit jobs on [OSCER](http://www.ou.edu/oscer.html).

## Interatomic potentials

There are several interatomic potentials for this alloy. Here, we focus on the following two:

- The first one is `FeNiCrCoAl-heaweight.setfl`. If one uses it, cite [this paper](https://doi.org/10.1557/jmr.2020.294).
- The second one is `AlCoCrFeNi_Zhou04.eam.alloy`. If one uses it, cite [this paper](http://dx.doi.org/10.1016/S1359-6454(01)00287-7) and [this paper](http://dx.doi.org/10.1103/PhysRevB.77.214108).

Both potential files can be found in this GitHub repository. The paper in the reference list in this GitHub repository explains why the first potential is preferred.

There are other interatomic potentials for this MPEA, e.g., the one developed by [Yang et al.](https://doi.org/10.1016/j.msea.2021.141253). However, we did not study them here.


## Random structure

Al<sub>0.3</sub>CoCrFeNi has an face-centered cubic lattice, according to [this paper](https://doi.org/10.1016/j.actamat.2022.118600). 

In this alloy, the CSRO effect has been studied by [Sun et al.](https://doi.org/10.1016/j.matdes.2022.111214) and [Hasan et al.](https://doi.org/10.1016/j.commatsci.2024.112980), so we focus on the random structure.

Random structures are built using [Atomsk](https://atomsk.univ-lille.fr).

## Lattice parameters and elastic constants

Calculate its lattice parameters and elastic constants at 0 K, 300 K, ..., 973 K, 1003 K, 1033 K, respectively. The last three are the temperatures used in [the creep experiments](https://doi.org/10.1016/j.actamat.2022.118600). For each data point, take the mean value from three random structures.

Calculations follow [a previous project](https://github.com/shuozhixu/Modelling_2024).

## GSFE surfaces

Calculate the GSFE surfaces at 0 K. Most files are in the `gsfe/` directory in this GitHub repository. Upload all of them to a directory, say `gsfe-1/`, on OSCER.

Locally run the atomsk script, `build_gsfe.sh`, to build the data file. Check the order of elements in the data file, then modify line 17 of `lmp_gsfe.in` to ensure that the two orders match.

Prepare a batch file named `lmp.batch` and upload it, along with the interatomic file and data file, to `gsfe-1/` on OSCER, then run

	sh build_jobs.sh
	
to generate 65 subdirectories: `0`, `1`, `2`, ..., `64`. Then cd into each subdirectory and edit the file `lmp_gsfe.in`:

- line 61. Change the first integer (by default `0`) after `equal` to `1`, `2`, ... or `64`, matching the subdirectory name

Then go back to `gsfe-1/` and run

	sh submit_jobs.sh
	
to submit 65 jobs.

Once all jobs are finished, run

	sh post_jobs.sh

to get a file `gamma.txt`, which contains the GSFE surface and is compatible with the [PFDD](https://github.com/shuozhixu/PFDD) code. Note that in the subdirectory `0`, the file `gsfe` is the same GSFE curve calculated in [a previous project](https://github.com/shuozhixu/Modelling_2024), albeit for a different alloy there, CoCrNi.

However, `gamma.txt` only contains the GSFE surface on one slip plane. According to [a previous work](http://dx.doi.org/10.1016/j.cma.2021.114426), multiple GSFE surfaces need to be calculated to obtain a good statistics of the GSFE surface in an alloy.

To obtain other GSFE surfaces on other parallel slip planes, create 19 more directories, `gsfe-2`, `gsfe-3`, ..., `gsfe-20`, and copy all necessary files to each.

Take `gsfe-2` as an example. Change the last integer (by default `1`) in line 34 of `lmp_gsfe.in` to `2`, matching the number after `gsfe-`. Then within `gsfe-2/`,

- execute `build_jobs.sh`
- edit 65 `lmp_gsfe.in` files
- execute `submit_jobs.sh`
- wait until all simulations are finished
- execute `post_jobs.in`.

Another `gamma.txt` file is then generated, which is the GSFE surface on the second shift plane.

Follow the procedures above to generate 18 more `gamma.txt` files in `gsfe-3/`, `gsfe-4/`, ..., `gsfe-20/`, respectively.

Eventually, we obtain 20 `gamma.txt` files, i.e., 20 GSFE surfaces. As mentioned earlier, we can use the file `0/gsfe` in each directory `gsfe-XXX` to calculate 20 intrinsic/unstable stacking fault energies.

## LSR

Calculate the LSR of both edge and screw dislocations at 0 K. The atomsk scripts that are used to build the atomistic structures and the LAMMPS input files for the LSR calculations can be found in the `lsr/` directory in this GitHub repository.

Note: two methods are independently used to insert an edge dislocation, hence `build_edge1.sh` and `build_edge2.sh`. They correspond to the "superimposing two crystals" method and the "remove a half-plane below the glide plane" method on [this page](https://atomsk.univ-lille.fr/tutorial_Al_edge.php), respectively. It is found that the two methods lead to the same dislocation structure after energy minimization in Ni, but not in the MPEA. The paper in the reference list in this GitHub repository explains why the second method is preferred.

Calculations follow [a previous GitHub repository](https://github.com/shuozhixu/FLAM2020-LSR) and [its associated paper](http://dx.doi.org/10.1016/j.ijplas.2021.103157). 20 LSR are calculated for an edge and a screw dislocation, respectively, due to the randomness in atomic distribution.

## Reference

If you use any files from this GitHub repository, please cite

- Anshu Raj, Subah Mubassira, Shuozhi Xu, [Generalized stacking fault energies and local slip resistances in Al<sub>0.3</sub>CoCrFeNi: An atomistic study](https://doi.org/10.1007/s44210-025-00060-8), High Entropy Alloys Mater. 3 (2025) 203--214