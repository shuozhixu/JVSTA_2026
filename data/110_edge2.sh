#!/usr/bin/bash

rm -f *.lmp

a=3.234
p=0.3

d=199.785 
e=250.4025

x=$(echo "scale=5;$d*$a/3.234" | bc)

y=$(echo "scale=5;$e*$a/3.234" | bc)

b=$(echo "scale=5;$a*sqrt(3.)/2." | bc)

atomsk --create bcc $a Nb orient [111] [1-10] [11-2] -duplicate 143 110 1 supercell.cfg

atomsk supercell.cfg -dislocation $x $y edge_rm Z Y $b $p -wrap edge_Nb.cfg

atomsk edge_Nb.cfg -select random 31350 Nb -sub Nb Mo MoNb.cfg

atomsk MoNb.cfg -select random 31350 Nb -sub Nb Ti MoNbTi.cfg lmp

mv MoNbTi.lmp data.MoNbTi_edge

rm -f *.cfg