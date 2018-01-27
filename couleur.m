
close all; clear all; clc;
%% image %%
Image = imread('mountains.jpg');
Image_gray = rgb2gray(Image);
Image_hsv = rgb2hsv(Image);
imwrite(Image_gray,'MontGris.jpg');
imwrite(Image_hsv,'MontHsv.jpg')

R = Image(:,:,1);
G = Image(:,:,2);
B = Image(:,:,3);
%% Show Parts %%
C = zeros(size(Image, 1), size(Image, 2));
CR = cat(3, R, C, C);
CG = cat(3, C, G, C);
CB = cat(3, C, C, B);
CI = cat(3, R, G, B);

figure

imshow(CR)
%imwrite(CR,'Red.jpg')
figure
imshow(CG)
%imwrite(CG,'Green.jpg')
figure
imshow(CB)
%imwrite(CB,'Blue.jpg')
%imwrite(CI,'Image.jpg')