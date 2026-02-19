#!/usr/bin/bash

rm -f *.lmp

a=3.234
p=0.291625064

d=244.597
e=241.578

x=$(echo "scale=5;$d*$a/3.234" | bc)

y=$(echo "scale=5;$e*$a/3.234" | bc)

b=$(echo "scale=5;$a*sqrt(3.)/2." | bc)

atomsk --create bcc $a Nb orient [111] [-1-23] [5-4-1] -duplicate 175 40 1 supercell.cfg

atomsk supercell.cfg -dislocation $x $y edge_rm Z Y $b $p -wrap edge_Nb.cfg

atomsk edge_Nb.cfg -select random 97813 Nb -sub Nb Mo MoNb.cfg

atomsk MoNb.cfg -select random 97813 Nb -sub Nb Ti MoNbTi.cfg lmp

mv MoNbTi.lmp data.MoNbTi_edge

rm -f *.cfg
