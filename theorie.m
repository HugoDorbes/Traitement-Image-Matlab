close all; clear all; clc;
Image = imread('RGB.jpg'); 

IR = Image(:,:,1);
IG = Image(:,:,2);
IB = Image(:,:,3);
Ir = double(IR)/255; 
Ig = double(IG)/255; 
Ib = double(IB)/255;

BasicVars = who; 
BasicVars{size(BasicVars,1)+1} = 'BasicVars';


%% HSV Spectrum %%
res = 200;
R = 100;
hue = zeros(res, res);
sat = zeros(res, res);
val = zeros(res, res);
for i = 1:res
    for j = 1:res
        x = i-res/2;
        y = j-res/2;
        r = sqrt(x^2 + y^2);
        theta = mod(atan2(y,x) - pi/2, 2*pi); 
        hue(i,j) = theta/2/pi;
        if r > R
              sat(i,j) = 0;
                hue(i,j) = 0;
        else
                sat(i,j) = r/R;
        end
        val(i,j) = 1;

    end
end

circ = cat(3, hue, sat, val);
x = 400;
y = 200;
h = linspace(0,1,x);
v = linspace(1,0,y);
[hue, val] = meshgrid(h,v);
sat = ones(y, x);
squa = cat(3, hue, sat, val);

circ = hsv2rgb(circ);
imwrite(circ, 'HSVcirc.jpg');

squa = hsv2rgb(squa);
imwrite(squa, 'HSVsqua.jpg');
%% RGB to HSV to RGB%%
IRGB = squa;
IHSV = rgb2hsv(IRGB);
imwrite(IHSV, 'rgb2hsv.jpg')
IRGB = hsv2rgb(IHSV);
imwrite(IRGB, 'hsv2rgb.jpg') 
clearvars('-except',BasicVars{:}) 

