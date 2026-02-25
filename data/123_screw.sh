#!/usr/bin/bash

rm -f *.lmp

a=3.234
d=198.873
e=248.061

x=$(echo "scale=5;$d*$a/3.234" | bc)

y=$(echo "scale=5;$e*$a/3.234" | bc)

b=$(echo "scale=5;$a*sqrt(3.)/2." | bc)

atomsk --create bcc $a Nb orient [-541] [-1-23] [111] -duplicate 19 41 2 supercell.cfg

atomsk supercell.cfg -dislocation $x $y screw z y $b dis.imd

c=$(echo "scale=5;$b/2." | bc)

awk -v var="$c" 'NR==3 {$4=var} {print}' dis.imd > dis_mod.imd

atomsk dis_mod.imd -alignx screw_Nb_123_40nm_pad.xsf

atomsk screw_Nb_123_40nm_pad.xsf screw_Nb_123_40nm_pad.cfg

awk -v var="Nb" 'NR==16 {$1=var} {print}' screw_Nb_123_40nm_pad.cfg > screw_Nb_123_40nm_pad_mod.cfg

rm screw_Nb_123_40nm_pad.cfg

atomsk screw_Nb_123_40nm_pad_mod.cfg screw_Nb.cfg

#rm *.cfg *.imd *.xsf screw_Ni.lmp

atomsk screw_Nb.cfg -select random 21812 Nb -sub Nb Mo MoNb.cfg

atomsk MoNb.cfg -select random 21812 Nb -sub Nb Ti MoNbTi.cfg lmp

mv MoNbTi.lmp data.MoNbTi_screw

rm -f *.cfg *.imd *.xsf