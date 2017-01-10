function [fetr135]=feature135(I)
% clc;
as00=I;
za=waitbar(0,'Extracting feature for 135 degree tracing .....');  
[m,n]=size(as00);
I1=as00;
contrast = 0;%contrast (2 - FEATURE)
entropy = 0;%Entropy (3 - FEATURE)
idm = 0;%Inverse Differnce moment (4 - FEATURE) 
dis = 0; %Dissimilarity (5 - FEATURE)
GLCM=0;
CC=0;
muq=0;
sigma=0;
variance=0;
as02=(as00)^2;
asm0=sum(sum(as02)); %%%%%%% ASM (1 - FEATURE)
for i = 1:m
        waitbar(i/m);
    for j = 1:n
        if I1(i,j)~=0
        contrast = contrast + (i-j)*(i-j)*I1(i,j);
        idm=idm+I1(i,j)/(1+(i*j)^2);
        dis=dis+I1(i,j)*abs(i-j);
        entropy = entropy + I1(i,j)*(-log(I1(i,j)));  
         mp=max(max(I1));
        GLCM=GLCM+(i*I1(i,j));
       variance=variance + ((I1(i,j)*((i-GLCM)^2)));
       muq=muq+(I1(i,j)*j);
       sigma=sigma + (I1(i,j)^((i-muq)^2));
       CC=CC+((I1(i,j)^(((i-GLCM)*(j-muq))/(sqrt((variance)^2)*(sigma)^2))));
    end
    end
end
fetr135 = [asm0 contrast entropy idm dis mp GLCM variance CC];
% filename = 'fetr135.xlsx';
%  xlRange1 = 'A35:I35';
%  xlswrite(filename,fetr135,xlRange1)
disp ('FEATURES OF DEGREE 135'); 
display (contrast);
display (idm);
display (dis);
display (entropy);
display (mp);
display (GLCM);
display (variance);
display (muq);
display (asm0);
display (CC);
close(za);