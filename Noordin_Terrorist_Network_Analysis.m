
load('dataNoordinTerroristNetwork.mat')

% Order multiplex layers in a cell
A=cell(1,3);

A{1}=At;
A{2}=Ac;
A{3}=Ao;

% multiplex PageRank 
[x,X]=multiplexPageRank(A,0.85,1,1);


% figure

figure;
plot(X{1},'-.g');
hold on;
plot(X{2},'--xr');
plot(X{3},'-ob');
legend('PR T','MPR(C|T)','MPR(O|C|T)')