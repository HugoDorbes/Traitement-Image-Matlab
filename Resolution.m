% construction image avec résoltions différentes


close all; clear all; clc;


%% Pixel Resolution %%
Image = imread('mountains.jpg'); 
size(Image)
Image = rgb2gray(Image);
imwrite(Image,'MountainsGris.jpg')

[m,n,~] = size(Image); 
ni = n/m;
mpix = [40, 100, 300, 532];
npix = zeros(length(mpix),1);

for k = 1:length(mpix)
    i = mpix(k);
    p = imresize(Image, [i,i*ni]);
    npix(k) = size(p,2);
    filename = strcat('Pix',num2str(k), '.jpg');
    imwrite(p,filename)   
end

%% Spatial Resolution %%
a = imresize(Image,0.3,'nearest'); 
b = imresize(a, 4, 'nearest'); 
[bm, bn, ~] = size(b); 
imwrite(b,'spatial.jpg');
size(b)


%% Radiometric Resolution %%
[c,map] = gray2ind(Image, 24);
imwrite(c, map, 'radres.jpg');
