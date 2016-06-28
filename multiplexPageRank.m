
%++++++++   Multiplex PageRank ++++++++++++++++++++++++++++++++++++++++++++
% 
% This code can be redistributed and/or modified
% under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or (at
% your option) any later version.
%  
% This program is distributed ny the authors in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%
%  
% If you use this code please cite 
%
% [1] A. Halu, R. J. Mondragón, P. Panzarasa, and G. Bianconi, 
%    "Multiplex pagerank." PloS one 8, no. 10 (2013): e78293.  
%
% [2] J. Iacovacci and G. Bianconi, "Extracting Information from Multiplex Networks." 
%       Chaos: An interdisciplinary Journal of Nonlinear Science 26 (6) (2013): e78293.  
%
% (c) Jacopo Iacovacci (mriacovacci@hotmail.it) 
%     Ginestra Bianconi (g.bianconi@qmul.ac.uk)  
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



function [x,X]=multiplexPageRank(A,alpha,beta,gamma)

% The following program takes in input a cell A of n sparse adjacency 
% matrices (ordered layers of the multiplex networks) and compute 
%
%  - the standard node PageRank x{i} in each layer i 
%  - the node Multiplex PageRank X following the layers' order: 
%     X{1}=x{1}, and X{i}, i>1 is the MPR evaluated on A{i} given the vector X{i-1}.    
%   
% alpha is the damping factor (usually taken 0.85)
%
% Options:
%
% beta=1, gamma=1 Combined Multiplex PageRank
% beta=1, gamma=0 Multiplicative Multiplex PageRank
% beta=0, gamma=1 Additive Multiplex PageRank
% 
% The input matrix A{i} can be directed with the convention that A{i}(j,l) 
% is the value of the link from l to j  


v_quadratic_error=0.0001;


for jj=1:max(size(A))
    
    
x0{jj}=(sum(A{jj},1)>0)+(sum(A{jj},2)>0)';
x0{jj}=(x0{jj}>0);
norma=nnz(x0{jj});
x0{jj}=x0{jj}/norma;
x0{jj}=x0{jj}';
    

D{jj}=sum(A{jj},1)+(sum(A{jj},1)==0);
D{jj}=ones(1,max(size(A{jj})))./D{jj};
n=numel(D{jj});
D{jj}=spdiags(D{jj}(:),0,n,n);


l{jj}=sum(A{jj},1)>0;
jump{jj}=alpha*l{jj}';


vt=x0{jj};

last_v1 = ones(max(size(A{jj})),1) * inf;

while(norm(vt - last_v1, 2) > v_quadratic_error*norm(vt))
        last_v1 = vt;
             
        vt=A{jj}*D{jj}*(vt.*jump{jj})+(sum((1-jump{jj}).*vt,1)*x0{jj});
        
        
end

x{jj}=vt;


end


X{1}=x{1};

for jj=1:max(size(A))-1


n=max(size(A{jj+1}));


G{jj+1}=(spdiags(X{jj}(:),0,n,n))*A{jj+1};
G{jj+1}= sum(G{jj+1},1) + ((sum(G{jj+1},1))==0);
G{jj+1}=ones(1,n)./G{jj+1};
G{jj+1}=spdiags(G{jj+1}(:),0,n,n);

Gaus=spdiags((X{jj}(:)).^(beta),0,n,n);

M{jj+1}=Gaus*A{jj+1}*G{jj+1};
    
      
vt=X{jj};
last_v1 = ones(max(size(A{jj+1})),1) * inf;

while(norm(vt - last_v1, 2) > v_quadratic_error*norm(vt))
        last_v1 = vt;
        
        vt = (M{jj+1}*(vt.*jump{jj+1}))+sum((1-jump{jj+1}).*vt,1)*X{jj}.^(gamma)/sum(X{jj}.^(gamma));
        vt=vt/sum(vt);
end


X{jj+1}=vt;

    
end


end




