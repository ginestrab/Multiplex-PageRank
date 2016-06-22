# multiplexPageRank


This repository contains:

1) 'multiplexPageRank.m' a matlab function to compute the Multiplex PageRank 
    the  code can be redistributed and/or modified under the terms of the GNU 
    General Public License as published by the Free Software Foundation, either 
    version 3 of the License, or (at your option) any later version.
    This program is distributed ny the authors in the hope that it will be 
    useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

  
    If you use this code you should cite: 

    [1] A. Halu, R. J. Mondragón, P. Panzarasa, and G. Bianconi, 
        "Multiplex pagerank." PloS one 8, no. 10 (2013): e78293.  

    [2] J. Iacovacci and G. Bianconi, "Extracting Information from Multiplex Networks." 
        Chaos: An interdisciplinary Journal of Nonlinear Science 26 (6) (2013): e78293.  



2) 'dataNoordinTerroristNetwork.mat' a multiplex dataset describing the Noordin terrorist 
    network at the level of trust relations (T), communications (C), operations (O) (see 
    ref [2] for details). 
    If you use this dataset you should cite   


    [1] F. Battiston, V. Nicosia and V. Latora, "Structural measures for multiplex networks." 
        Physical Review E 89.3 (2014): 032804.


    [2] J. Iacovacci and G. Bianconi, "Extracting Information from Multiplex Networks." 
        Chaos: An interdisciplinary Journal of Nonlinear Science 26 (6) (2013): e78293.  



3) 'Noordin_Terrorist_Network_Analysis.m' a basic matlab script performing the Multiplex PageRank 
    analysis of the Noordin terrorist multiplex as guidance exaple. an output figure is genered showing:
    - the standard PageRank in the layer of the trust: PR(T)     
    - the Multiplex PageRank of the layer communication given the standard PageRank on the layer trust: MPR(C|T)  
    - the Multiplex PageRank of the layer operation given the Multiplex PageRank C|T: MPR(O|C|T)

 
For any question please contact me! : mriacovacci@hotmail.it  (mriacovacci AT hotmail DOT it)


(c) Jacopo Iacovacci
