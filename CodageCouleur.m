%Codage d'image couleur
%Première partie: histogramme
%Deuxième partie: Drapeaux
%troisième partie: cercle de couleur


clear all, close all, clc ;

%% Image d'internet
% 
% I=imread('mountains.jpg');
% 
% figure 
% imshow(I)
% 
% Ir=I(:,:,1) ;
% Ig=I(:,:,2) ;
% Ib=I(:,:,3) ;
% 
% figure, imshow(Ir), title('rouge');
% imwrite(Ir,'mountainsR.jpg')
% figure, imshow(Ig), title('vert');
% imwrite(Ig,'mountainsV.jpg')
% figure, imshow(Ib), title('bleu');
% imwrite(Ib,'mountainsB.jpg')
% 
% figure, Hr=histogram(Ir); title('hist rouge')
% 
% figure, Hg=histogram(Ig); title('hist vert')
% 
% figure, Hb=histogram(Ib); title('hist bleu')
% 
% figure, Hm=histogram(I); title(' hist image')
% 
% 
% %% Drapeau français
% 
 N=300;
 M=500;

flag=ones(N,M,3);
flag(:,1:floor(M/3),1:2)= 0;
flag(:,floor(2*M/3):M,2:3)= 0;

figure, imshow(flag);
imwrite(flag,'frenchflag.jpg')


%% Drapeau Italien

flag1=ones(N,M,3);
flag1(:,1:floor(M/3),1:2:3)= 0;
flag1(:,floor(2*M/3):M,2:3)= 0;

figure, imshow(flag1);
imwrite(flag1,'italianflag.jpg')

flag_hsv = rgb2hsv(flag);

figure, imshow(flag_hsv);

%% drapeau allemand
flag2=ones(N,M,3);
flag2(1:floor(N/3),:,:)= 0;
flag2(floor(N/3):floor(2*N/3),:,2:3)= 0;
flag2(floor(2*N/3):N,:,3)= 0;

figure, imshow(flag2);
imwrite(flag2,'Germanflag.jpg')

%% pastel couleur

img=ones(N,M,3);

for n = 1 : N
    for m = 1 : M
        img(n,m,1)=m/M;
        img(n,m,2)=n/N;
    end
end
figure, imshow(img);title('HSV')
imwrite(img,'HSV.jpg')

imga=hsv2rgb(img);
figure, imshow(imga); title('RGB')
imwrite(imga,'RGB.jpg')

imgaa=rgb2hsv(imga);
figure, imshow(imgaa);

gris=rgb2gray(imga);
figure; imshow(gris); title('gris')
imwrite(gris,'GS.jpg')

%% pastel cercle
P=2000;
cer=ones(P,P,3);
R=800;
for u = 1 : P
    for v = 1 : P
        x = P/2 -v;
        y= u - P/2 ;
        
        theta(u,v) = atan2(y,x);
        cer(u,v,1) = (theta(u,v)+pi) / (2*pi) ;
        if (sqrt(x^2+y^2) > R )
            cer(u,v,1) = 0;
            cer(u,v,2) = 0;
        end        
    end     
end

cer1 = hsv2rgb(cer);
figure, imshow(cer1);
imwrite(cer1,'RGBcer.jpg')



