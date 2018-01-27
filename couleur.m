% Canaux de l'image de montagne


close all; clear all; clc;

%% image %%
Image = imread('mountains.jpg'); % image originale
Image_gray = rgb2gray(Image); % image en nuance de gris

imwrite(Image_gray,'MontGris.jpg');


R = Image(:,:,1); %compo rouge
G = Image(:,:,2); %compe verte
B = Image(:,:,3); %compo bleu

%% Show Parts %%
C = zeros(size(Image, 1), size(Image, 2));
CR = cat(3, R, C, C); % canal rouge
CG = cat(3, C, G, C); % canal vert
CB = cat(3, C, C, B); % canal bleu
CI = cat(3, R, G, B); % image reconstruite

figure
imshow(CR)
%imwrite(CR,'Red.jpg')

figure
imshow(CG)
%imwrite(CG,'Green.jpg')

figure
imshow(CB)
%imwrite(CB,'Blue.jpg')

figure
imshow(CI)
%imwrite(CI,'Image.jpg')
