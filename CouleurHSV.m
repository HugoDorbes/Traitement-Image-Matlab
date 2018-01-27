% traitement de l'image dans l'espace colorimétrique HSV


close all; clear all; clc;

%% image %%
Image = imread('mountains.jpg'); % image original
Image_hsv = rgb2hsv(Image); % conversion en HSV


imwrite(Image_hsv,'MontHsv.jpg')

H = Image_hsv(:,:,1) %*2 ; %teinte
S = Image_hsv(:,:,2) %*2 ; %saturation
V = Image_hsv(:,:,3) *2; %valeur

%% Show Parts %%

CI = cat(3, H, S, V); %reconstruction image original en HSV


figure
imshow(Image)

figure
imshow(hsv2rgb(CI))
%imwrite(hsv2rgb(CI),'ImH2.jpg') %image rgb après augmentation teinte
%imwrite(hsv2rgb(CI),'ImS2.jpg') %image rgb après augmentation saturation
imwrite(hsv2rgb(CI),'ImV2.jpg') %image rgb après augmentation valeur

figure
imshow(H)
%imwrite(H,'H2.jpg')

figure
imshow(S)
%imwrite(S,'S2.jpg')

figure
imshow(V)
imwrite(V,'V2.jpg')
