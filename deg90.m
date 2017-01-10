function [yemp1]=nine1(RED_F);
qs=waitbar(0,'Processing 90 Degree Scanning...');
% RED_F=[ 0 0 1 1;0 0 1 1;0 2 2 2;2 2 3 3];
% RED_F=RED_F+1;
zw=size(RED_F);
if length(zw)==3
    RED_F=rgb2gray(RED_F);
end;
[s1,s2]=size(RED_F);
yemp1=zeros(256,256);
for i=2:s1
        waitbar(i/s1);
for k=1:s2-1
    t=zeros(2,1);
    T=zeros(2,1);
    t=RED_F(k+1:-1:k,i);
count=0;
for P=1:s1
    for j=1:s2-1

        if RED_F(j+1:-1:j,P)==t 
        count=count+1;
    end
end 
end
T(1)=t(2);
T(2)=t(1);
count1=0;
for P1=1:s1
    for P2=1:s2-1
        if RED_F(P2+1:-1:P2,P1)==T 
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

