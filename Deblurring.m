%Méthode du défloutage
%Première partie: méthode filte inverse
%Deuxième partie: méthode filtre Wiener (Matlab exemple)

clear all, close all, clc ; 

B=imread('mountains.jpg'); 
A=rgb2gray(B);
TailleImage=size(A); 
ligne=TailleImage(1); 
colonne=TailleImage(2);  

%% Flouter 
F=zeros(ligne,colonne); 
N = 14; 
h=(1/(N*N))*ones(N); 
A_flou=filter2(h,A);


% %% TF 
TF_blurred=fftshift(fft2(A_flou)); 
TF=fftshift(fft2(A)); 
TFSS=fft2(A_flou);
figure, imagesc(A); colormap gray;  title('image original')
figure, imagesc(A_flou); colormap gray;  title('image flou')
figure, imagesc(log(abs(TF_blurred)));  title('Spectre Image flou')
figure, imagesc(log(abs(TF)));  title('Spectre Image Originale')

% Estimer T juste regarder quand égal à zéros et retrouver T dans formule 
%  puis ensuite  

TailleFiltre=[7 7]; 

SeuilMax = 11 ;  
hh = zeros(TailleImage);  
centre = [1 1] + floor(TailleImage/2) ;  
ext = (TailleFiltre-[1 1])/2;  
ligs = centre(1) + [-ext(1):ext(1)];  
cols = centre(2) + [-ext(2):ext(2)]; 

h = ones(TailleFiltre)/prod(TailleFiltre);  
hh(ligs,cols) = h;  
hh = ifftshift(hh);  

H = fft2(hh); 

ind = find(abs(H)<(1/SeuilMax));  
H(ind) = (1/SeuilMax)*exp(j*angle(H(ind)));  

G = ones(size(H))./H; 
I=ifft2((1./H).*TFSS);

figure, imagesc(I); colormap gray;  title('image défloutée')


%% Méthode Wiener

I = im2double(imread('mountains.jpg'));
imshow(I);
title('Original');
  
% Simulation d'un flou mouvement.
LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');

% simulation bruit.
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', ...
                  noise_mean, noise_var);
figure, imshow(blurred_noisy)
title('Simulate Blur and Noise')
imwrite(blurred_noisy,'FlouW.jpg'),

%Restauration 
estimated_nsr = noise_var / var(I(:));
wnr3 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
figure, imshow(wnr3)
title('Restoration);
imwrite(wnr3,'Wiener.jpg'),
