% Utilisation des différents filtres
%Première partie: isolation étoiles les plus brillantes
%Deuxième partie: filtre Laplace et Lplace-Gauss
%Troisème partie: filtre Sobel, moyen et Prewit


close all; clear all; clc;

%B=imread('mercure.jpg');
%B =imread('lune.jpg');
E =imread('Etoiles.png');
figure; imshow(E);

E =rgb2gray(E);


% Seuil 
C1 = (E(:,:,:)>250);  
figure;imshow(C1);

% Flouter  
h=fspecial('average',10); 

% Filtrer 
r1=imfilter(C1,h); 
figure;imshow(r1);
imwrite(r1,'Etoiles2.jpg');

% Seconde itération du processus
C2 = (r1(:,:,:)>0.80); 
r2=imfilter(C2,h);
figure;imshow(r2);
imwrite(r2,'Etoiles3.jpg');

% troisième itération du processus
C3 = (r2(:,:,:)>0.80);
r3=imfilter(C3,h);
figure;imshow(r3);
imwrite(r3,'Etoiles4.jpg');





% %% Filtre laplace
% 
% h = fspecial('laplacian',0.2); 
% 
% FiltreLaplace=imfilter(B,h);
% figure; imshow(FiltreLaplace); title('laplace')
% imwrite(FiltreLaplace,'Laplace.jpg');
% 
% %% Filtre L-G
% 
% h3 = fspecial('log',5,0.5); 
% 
% FiltreLG=imfilter(B,h3);
% figure; imshow(FiltreLG);title('L-G')
% imwrite(FiltreLG,'LG.jpg');
% 
% %% filtre prewit et sobel
% % 
%  h1=fspecial('prewit');
%  h2=fspecial('sobel');
% % 
%  FiltrePrewit=imfilter(B,h1);
%  FiltreSobel=imfilter(B,h2);
%  figure; imshow(FiltreSobel);
% 
% figure; imshow(FiltrePrewit);
% imwrite(FiltrePrewit,'Prewit.jpg');
% 
% figure; imshow(FiltreSobel);
% imwrite(FiltreSobel,'Sobel.jpg');

% %% Filtre Moyen
% h4=fspecial('average',7);
% FlouMoyen1=imfilter(B,h4);
% h5=fspecial('average',15);
% FlouMoyen2=imfilter(B,h5);
% 
% figure; imshow(FlouMoyen1);title('moyen3x3')
% imwrite(FlouMoyen1,'Flou1.jpg');
% figure; imshow(FlouMoyen2);title('moyen7x7')
% imwrite(FlouMoyen2,'Flou2.jpg');
% 
% %% filtre Gaussian
% h6=fspecial('gaussian',3,3);
% FlouGauss1=imfilter(B,h6);
% h7=fspecial('gaussian',3,25);
% FlouGauss2=imfilter(B,h7);
% h8=fspecial('gaussian',25,3);
% FlouGauss3=imfilter(B,h8);
% h9=fspecial('gaussian',25,25);
% FlouGauss4=imfilter(B,h9);
% 
% 
% figure; imshow(FlouGauss1);title('gauss1')
% imwrite(FlouGauss1,'Flou3.jpg');
% figure; imshow(FlouGauss2);title('gauss2')
% imwrite(FlouGauss2,'Flou4.jpg');
% figure; imshow(FlouGauss3);title('gauss3')
% imwrite(FlouGauss3,'Flou5.jpg');
% figure; imshow(FlouGauss4);title('gauss4')
% imwrite(FlouGauss4,'Flou6.jpg');





