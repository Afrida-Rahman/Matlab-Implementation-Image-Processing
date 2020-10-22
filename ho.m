n = [-3:3]; x = [2,4,-3,1,-5,4,7]; % given sequence x(n)
[x31,n31] = sigshift(x,n,-3); % shift sequence by -3
[x32,n32] = sigshift(x,n,2);% shift sequence by 2
[x33,n33] = sigmult(x31,n31,x32,n32); % multiply 2 sequences
[x34,n34] = sigfold(x,n); % fold x(n)
[x34,n34] = sigshift(x34,n34,1); % shift x(-n) by 1
[x35,n35] = sigshift(x,n,-1); % shift x(n) by -1
[x36,n36] = sigmult(x34,n34,x35,n35); % multiply 2 sequences
[x3,n3] = sigadd(x33,n33,x36,n36); % add 2 sequences
Hf_1 = figure; 
set(Hf_1,’NumberTitle’,’off’,’Name’,’P0204c’);
Hs = stem(n3,x3,’filled’); 
set(Hs,’markersize’,2);axis([min(n3)-1,max(n3)+1,min(x3)-10,max(x3)+10]);
xlabel(’n’,’FontSize’,LFS); 
ylabel(’x_3(n)’,’FontSize’,LFS);
title(’Sequence x_3(n)’,’FontSize’,TFS);
ntick = n3; 
ytick = [-30:10:60];
set(gca,’XTickMode’,’manual’,’XTick’,ntick);
set(gca,’YTickMode’,’manual’,’YTick’,ytick);