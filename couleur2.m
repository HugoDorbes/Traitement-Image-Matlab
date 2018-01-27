
close all; clear all; clc;
%% image %%
Image = imread('mountains.jpg');
Image_gray = rgb2gray(Image);
Image_hsv = rgb2hsv(Image);
imwrite(Image_gray,'MontGris.jpg');
imwrite(Image_hsv,'MontHsv.jpg')

H = Image_hsv(:,:,1) ;
S = Image_hsv(:,:,2)  ;
V = Image_hsv(:,:,3)*2;

%% Show Parts %%

CI = cat(3, H, S, V);


figure
imshow(Image)

figure
imshow(hsv2rgb(CI))
imwrite(hsv2rgb(CI),'ImV2.jpg')

figure
imshow(H)
%imwrite(H,'H.jpg')

figure
imshow(S)
%imwrite(S,'S2.jpg')

figure
imshow(V)
imwrite(V,'V2.jpg')
