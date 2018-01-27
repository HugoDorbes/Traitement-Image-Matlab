% méthode PCA dans le cadre classe non supervisé


clear all, close all, clc;

%% Image
Im = imread('mountains.jpg'); %Image originale

I = rgb2gray(Im);  %Image en gris      
ID = im2double(I);     
figure, 
imshow(ID); title('Image en gris')



%% code PCA
ID_mean = mean(ID);   %Moyenne    
[a b] = size(I);  %Taille
ID_mean2 = repmat(ID_mean,a,1); %Copie de ID_mean ax1
ID_Adjust = ID - ID_mean2; %ajustement
C = cov(ID_Adjust);   %convariance de l'ajustement
[V, D] = eig(C); %matrice diagonale D (valeurs propres) + une matrice complète V  (vecteurs propres)
V_trans = transpose(V); %transposé de V
ID_Adjust_trans = transpose(ID_Adjust);  %transposé de l'ajustement

FinalData = V_trans * ID_Adjust_trans;   
figure, imshow(FinalData)
  
%% Début du code PCA inverse
OriginalData_trans = inv(V_trans) * FinalData;                         
OriginalData = transpose(OriginalData_trans) + ID_mean2;           
figure, 

imshow(OriginalData), title('Image Recupéré')       
 
  
%% Image compression 
PCs=input('Entrer le nbre de PC colonnes voulu?  ');                    
PCs = b - PCs;                                                         
Reduced_V = V;


for i = 1:PCs,                                                         
Reduced_V(:,1) =[]; 
end 

Y=Reduced_V'* ID_Adjust_trans;                                        
Compressed_Data=Reduced_V*Y;                                           
Compressed_Data = Compressed_Data' + ID_mean2;

figure,                                                                
imshow(Compressed_Data); title('Image compressée')
imwrite(Compressed_Data,'im_comp300.jpg')

