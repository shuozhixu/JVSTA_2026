#!/usr/bin/bash

rm -f *.lmp

a=3.234

atomsk --create bcc $a Nb orient [111] [-1-12] [1-10] -duplicate 145 32 1 edge_Nb_112_top.cfg

atomsk --create bcc $a Nb orient [111] [-1-12] [1-10] -duplicate 144 32 1 edge_Nb_112_bottom.cfg

atomsk edge_Nb_112_top.cfg -deform X -0.0034482758621 0.0 edge_Nb_112_top_deformed.cfg

atomsk edge_Nb_112_bottom.cfg -deform X 0.00347222222222 0.0 edge_Nb_112_bottom_deformed.cfg

atomsk --merge Y 2 edge_Nb_112_bottom_deformed.cfg edge_Nb_112_top_deformed.cfg edge_Nb.cfg

atomsk edge_Nb.cfg -select random 18496 Nb -sub Nb Mo MoNb.cfg

atomsk MoNb.cfg -select random 18496 Nb -sub Nb Ti MoNbTi.cfg lmp

mv MoNbTi.lmp data.MoNbTi_edge

rm -f *.cfg
