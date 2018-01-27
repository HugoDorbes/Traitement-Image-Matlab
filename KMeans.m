% Méthode K-Means dans le cadre des classification non supervisé


clear all; close all; clc;


Img = imread('SpainBeach.jpg');
cform = makecform('srgb2lab');
Img_lab = applycform(Img,cform);

I = double(Img_lab(:,:,2:3));
lignes = size(I,1);
colonnes = size(I,2);
I = reshape(I,lignes*colonnes,2);

nColors = 3; %Nbres de couleur

% répétez le clustering 3 fois pour éviter les minima locaux
% Distance Euclidienne au carré, chaque centroïde est la moyenne des points de ce groupe. 
[cluster_idx, cluster_center] = kmeans(I,nColors,'distance','sqEuclidean', 'Replicates',3);

pixel_labels = reshape(cluster_idx,lignes,colonnes); % on reforme l' image
figure, imshow(pixel_labels,[]), title('image étiquetée par index de cluster');

segmented_images = cell(1,3); 
rgb_label = repmat(pixel_labels,[1 1 3]);

% on redonne la couleur
for k = 1:nColors
    color = Img;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end


figure, 
subplot(2,2,1), imshow(uint8(Img)), title('spain beach - original');
subplot(2,2,2), imshow(segmented_images{1}), title('objets dans le cluster 1');
imwrite(segmented_images{1},'kmeans1.jpg');
subplot(2,2,3), imshow(segmented_images{2}), title('objets dans le cluster 2');
imwrite(segmented_images{2},'kmeans2.jpg');
subplot(2,2,4), imshow(segmented_images{3}), title('objets dans le cluster 3');
imwrite(segmented_images{3},'kmeans3.jpg');


