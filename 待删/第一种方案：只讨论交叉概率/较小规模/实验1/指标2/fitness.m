function F=fitness(X,Index,D,time,cost,Performance) 
m=Index(end);
for i = 1:size(X,1)
    idx = floor(X(i,:));
x = zeros(1,m+1);
%temp = [0,5,8,12,14,16,20,24,27,30,34,37,41,45,49,53,58,62,65,70,74,76,80,84,88,92,96,98,103];
temp = [0,3,7,9,12,14,16,19,22,25,29,32,36,39,44,46,50,53,57,59,62,66,71,74,78,83,88,90,92];
 x(idx(idx>0)+temp) = 1;
     if (x(10)~=x(57))&&(x(10)==1)
        x(57)=1;
        x(54)=0;
        x(55)=0;
        x(56)=0;
    elseif (x(10)~=x(57))&&(x(57)==1)
        x(10)=1;
        x(11)=0;
        x(12)=0;
    end
    if (x(27)~=x(92))&&(x(27)==1)
        x(92)=1;
        x(91)=0;
    elseif (x(27)~=x(92))&&(x(92)==1)
        x(27)=1;
        x(26)=0;
        x(28)=0;
        x(29)=0;
    end
    if (x(25)~=x(35))&&(x(25)==1)
        x(35)=1;
        x(33)=0;
        x(34)=0;
        x(36)=0;
    elseif (x(25)~=x(35))&&(x(35)==1)
        x(25)=1;
        x(23)=0;
        x(24)=0;
    end
    if (x(18)~=x(74))&&(x(18)==1)
        x(74)=1;
        x(72)=0;
        x(73)=0;
    elseif (x(18)~=x(74))&&(x(74)==1)
        x(18)=1;
        x(17)=0;
        x(19)=0;
    end
    if (x(61)==x(70))&&(x(61)==1)
        x(70)=0;
        x(67)=round(rand(1));
        x(68)=1-x(67);
        x(69)=0;
        x(71)=0;
    elseif (x(61)==x(70))&&(x(61)==0)
        x(70)=1;
        x(67)=0;
        x(68)=0;
        x(69)=0;
        x(71)=0;
    end
    if (x(14)==x(21))&&(x(14)==1)
        x(21)=0;
        x(20)=round(rand(1));
        x(22)=1-x(20);
    elseif (x(14)==x(21))&&(x(14)==0)
        x(21)=1;
        x(20)=0;
        x(22)=0;
    end
    x(end)=1;
%cost=[20;60;90;12;6;50;46;60;120;25;12;5;88;74;160;9.7;32;68;91.5;82;192;120;457;330;10;32;95;0;34;22;9.3;13;6;8;0;70;96;82;94;12;63;60;190;120;250;0;10;60;0];
%time=[4,5,7,2,3,5,4,5,8,2,1,1,4,5,8,2,3,3,5,6,8,9,2,3,4,0.0001,1,1,2,2,2,2,0.0001,22,17,18,5,2,3,1,3,2,1,0.0001,2,7,0];
%The first function 
F(i,1)=x*cost;
%The second function
nu=size(D,2);
rr=x.*time;
CC=rr(rr~=0)';
pp=repmat(CC,1,nu);
C=pp.*D;
%C=timehandle(x,A,m);
n1=size(C,2);
ST=zeros(1,n1);
  for k=2:n1
      tt=0;
      for l=1:(k-1)
          if (C(l,k)>0)&&(C(l,k))~=0.0001
              tt=[tt,C(l,k)+ST(l)];
          elseif C(l,k)==0.0001
              C(l,k)=0;
              tt=[tt,C(l,k)+ST(l)];
          end
      end
      ST(k)=max(tt);
  end
  F(i,2)=ST(n1);
%The third function
%F(i,3)=-(x*Performance-26.5234)/(56.6129-26.5234);
F(i,3)=-x*Performance;
%F(i,3)=-(x*Performance);
end
