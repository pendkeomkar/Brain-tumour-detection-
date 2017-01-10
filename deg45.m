function [yemp1]=four1(RED_F);

% RED_F=[ 0 0 1 1;0 0 1 1;0 2 2 2;2 2 3 3];
% RED_F=RED_F+1;
zw=size(RED_F);
if length(zw)==3
    RED_F=rgb2gray(RED_F);
end;
qs=waitbar(0,'Processing 45 Degree Scanning...');
[s1,s2]=size(RED_F);
yemp1=zeros(256,256);
for i=2:s1
        waitbar(i/s1);
for k=1:s2-1
    t=zeros(2,1);
    t1=zeros(2,1);
    T=zeros(2,1);
    t(1,1)=RED_F(i,k);
    t(2,1)=RED_F(i-1,k+1);
count=0;
for P=2:s1
    for j=1:s2-1
        t1(1,1)=RED_F(P,j);
        t1(2,1)=RED_F(P-1,j+1);
        if t1 == t 
        count=count+1;
    end
end 
end
T(1)=t(2);
T(2)=t(1);
count1=0;
for P1=2:s1
    for P2=1:s2-1
       t1(1,1)=RED_F(P1,P2);
        t1(2,1)=RED_F(P1-1,P2+1);
        if t1 == T  
        count1=count1+1;
    end
end 
end
t_count=count+count1;
if t(1)<=0 
    t(1)=1;
end
if t(2)<=0 
    t(2)=1;
end
yemp1(t(1),t(2))=t_count;
yemp1(t(2),t(1))=t_count;
end
end
close(qs);
            
            














% clear A* B* G* p* P* R* T* c* i j k s* S* t* z

