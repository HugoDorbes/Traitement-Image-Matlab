clear all, close all, clc;

I = imread('SpainBeach.jpg');
figure, imshow(I), title('Image initiale')

I = double(I);
[U,V,n] = size(I);

DataBase = [
    115 87 75 1; %plage 
    125 92 77 1;
    122 90 72 1;
    195 132 101 1;
    206 140 106 1;
    229 147 110 1;
    
    9 44 66 2; %Mer
    9 48 65 2;
    10 47 66 2;
    16 47 65 2;
    7 50 66 2;
    10 48 67 2;
   
    
    242 255 255 3;%vague
    223 241 243 3;
    222 243 244 3;
    248 255 254 3;
    255 252 253 3;
    205 228 222 3;
    249 255 255 3;
    161 187 186 3;
    157 200 206 3;
    
    111 126 103 4;; %végétation
    104 106 105 4;
    96 90 90 4;
    100 106 106 4;
    123 140 121 4;
    95 95 93 4;
    ]

NbData = size(DataBase,1); %taille de nos données
Classe = DataBase(:,4); % Classe en colonne 4
Pix = DataBase(:,1:3); %Pixel en colonne 1 à 3

MaskImg = zeros(U,V);
for u = 1:U
    for v = 1:V
        rouge = I(u,v,1); % pixels rouges
        vert = I(u,v,2); % pixels vert
        bleu = I(u,v,3); % pixels bleu
        
        RGB = repmat([rouge vert bleu], NbData, 1); % Création matrice
        D = (RGB - Pix).^2; % Distance entre les pixels dans chaque classe
        
        [valeur,position] = min(sum(D') );
        MaskImg(u,v) = Classe(position) ;
        
        
    end
end
        
figure, imshow(MaskImg==1), title('Plage'); imwrite(MaskImg==1,'plage.jpg');
figure, imshow(MaskImg==2), title('Mer'); imwrite(MaskImg==2,'mer.jpg');
figure, imshow(MaskImg==3), title('Vague') ;   imwrite(MaskImg==3,'vague.jpg');   
figure, imshow(MaskImg==4), title('Végétation')   ;  imwrite(MaskImg==4,'végétation.jpg');   
 

C(:,:,1)=(MaskImg==3).*(I(:,:,1));
C(:,:,2)=(MaskImg==3).*(I(:,:,2));
C(:,:,3)=(MaskImg==3).*(I(:,:,3));

plage(:,:,1)=(C(:,:,1));
plage(:,:,2)=(C(:,:,2));
plage(:,:,3)=(C(:,:,3));

Fin_HSV=rgb2hsv(plage);
figure; imagesc(Fin_HSV);


Fin_HSV(:, :, 2) = Fin_HSV(:, :, 2) * 1.5;

Fin_HSV(Fin_HSV > 1) = 1;
Fin_RGB = hsv2rgb(Fin_HSV);
figure;
imshow(Fin_RGB);


            


 
