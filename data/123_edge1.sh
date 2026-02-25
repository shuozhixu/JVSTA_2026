#!/usr/bin/bash

rm -f *.lmp

a=3.234

atomsk --create bcc $a Nb orient [111] [-1-23] [5-4-1] -duplicate 145 21 1 edge_Nb_123_top.cfg

atomsk --create bcc $a Nb orient [111] [-1-23] [5-4-1] -duplicate 144 21 1 edge_Nb_123_bottom.cfg

atomsk edge_Nb_123_top.cfg -deform X -0.0034482758621 0.0 edge_Nb_123_top_deformed.cfg

atomsk edge_Nb_123_bottom.cfg -deform X 0.003472222222 0.0 edge_Nb_123_bottom_deformed.cfg

atomsk --merge Y 2 edge_Nb_123_bottom_deformed.cfg edge_Nb_123_top_deformed.cfg edge_Nb.cfg

atomsk edge_Nb.cfg -select random 84966 Nb -sub Nb Mo MoNb.cfg

atomsk MoNb.cfg -select random 84966 Nb -sub Nb Ti MoNbTi.cfg lmp

mv MoNbTi.lmp data.MoNbTi_edge

rm -f *.cfg