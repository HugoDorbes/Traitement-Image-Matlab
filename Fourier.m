clear, close all, clc

%% Parametres

R = 20;

%% Image

Img_champs = imread('champs.png'); % On charge l'image du champs
figure, imshow(Img_champs), title('image originale');           % On affiche cette derniere

Img = rgb2gray(Img_champs);           % On convertit l'image couleur en nuance de gris
%figure, imshow(Img), title('image en nuance de gris');

%% spectre
I_FFT = fft2(Img);             % On calcule la fft de l'image
I_FFT = fftshift(I_FFT);
I_FFT_spectre = abs(I_FFT);
Img=log(I_FFT_spectre);
figure, imagesc(Img), colormap gray; title('TF log-log de l image') ;   % On affiche la fft


%% filtre
taille = size(Img);   % On relève les dimensions de la matrice
ligne = taille(1);
colonne=taille(2);
mask = zeros(size(Img));       % On créé un masque pour enlever des fréquences
x = ligne / 2;
y = colonne / 2;
alpha = pi / 3.150;
delt_alpha = 6 * pi / 180;

%% boucle remplissage diagonal filtre

for m = 1:ligne
    for n = 1: colonne
        theta = (atan2(n-y,m-x)+pi);
        theta2 = (atan2(-n+y,-m+x)+pi);
        x2 = n - colonne/2;
        y2 = ligne/2 - m;
        r2 = x2^2 + y2^2;
        if ((alpha-delt_alpha) < theta ) & ((alpha+delt_alpha) > theta )
            mask(m,n)=1;
        end
        if ((alpha-delt_alpha) < theta2 ) & ((alpha+delt_alpha) > theta2 )
            mask(m,n) = 1;
        end
        if r2 < R^2
            mask(m,n) = 0;
        end
    end
end

%figure, imagesc(mask), title('image du masque');

%% on applique le masque
Img_filtre = (mask).*double(I_FFT); % On applique le masque à l'image de la TF
%figure, imagesc(abs(Img_filtre)); title('log log masque') 

%% TF inverse
Img_filtre = ifftshift(Img_filtre);
Img_inverse = real(ifft2(Img_filtre));
figure, imagesc(Img_inverse), title('image après TF inverse');  

%% coutour
h=fspecial('sobel');
Img_contour=imfilter(Img_inverse,h); 
figure; imagesc(Img_contour); title('contour image')

%% seuil
Img_seuil = double(Img_contour(:,:)>85); % On seuil pour ne faire apparaitre que le champ
figure, imagesc(Img_seuil), title('Image du champs');

%% couleur
Champs = zeros(size(Img_champs, 1), size(Img_champs, 2),3);

C(:,:,1)=Img_seuil.*double(Img_champs(:,:,1));
C(:,:,2)=Img_seuil.*double(Img_champs(:,:,2));
C(:,:,3)=Img_seuil.*double(Img_champs(:,:,3));

Champ(:,:,1)=double(C(:,:,1));
Champ(:,:,2)=double(C(:,:,2));
Champ(:,:,3)=double(C(:,:,3));

Fin_HSV=rgb2hsv(Champ);
figure; imagesc(Fin_HSV);


Fin_HSV(:, :, 2) = Fin_HSV(:, :, 2) * 1.5;
Fin_HSV(Fin_HSV > 1) = 1;
Fin_RGB = hsv2rgb(Fin_HSV);
figure;
imshow(Fin_RGB);
imwrite(Fin_RGB,'Fourier.jpg');


