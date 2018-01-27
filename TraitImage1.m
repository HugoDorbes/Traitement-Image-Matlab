clear all, close all, clc ;

%% Basics

I=imread('mountains.jpg');
figure
imshow(I); title('Image montagnes Couleur')
Y=rgb2gray(I);
figure
imshow(Y); title('Image montagnes grise')


%% Parametres
N=1000 ;         %nbre de lignes        
M=1000 ;        %nbre de colonnes
B=34;
W=100;
R=100;


%% Création des images
p1=zeros(N,M) ;      
p2=zeros(N,M) ;      
p3=zeros(N,M) ;
p4=zeros(N,M) ;
p5=zeros(N,M) ;
p6=zeros(N,M) ;
p7=zeros(N,M) ;


% Création image rayée N/B
for i=1:N
   r = rem(i,B)
   if (r/B) > 0.5
       p1(:,i) = 1;
       p2(i,:) = 1;
   end
end

% Création bande grise centre image
for i=1:N
    for j=1:M
        if (i > N/2 - W) && (i < N/2 + W)
            p3(i,:)=0.5;   
        end
    end
end

%Création carré au centre de l'image
p4(N/2-B:N/2+B,M/2-B:M/2+B)=1;

%Création cercle au centre de l'image
% p5(N/2,M/2)=1;
% SE=strel('sphere',B);
% p5=imdilate(p5,SE);
for i = 0:R
    p5(N/2-i:N/2+i,M/2-sqrt(R^2-i^2):M/2+sqrt(R^2-i^2))=1;
   
end

%Création image dégradé avec bande grise
for i=1:N 
    p6(:,1)=1;
    p6(:,i+1)=p6(:,i)-1/N;   
end
p6(N/2-B:N/2+B,:)=0.5;

%création image losange au centre
for i=0:R
    p7(N/2-i:N/2+i,M/2-(R-i):M/2+(R-i))=1;
    
end


%figure
figure
imshow(p1); 
imwrite(p1,'imageRayee1.png');
figure
imshow(p2); 
imwrite(p2,'imageRayee2.png');
figure 
imshow(p3);
imwrite(p3,'imageBande.png');
figure
imshow(p4);
imwrite(p4,'imageCarre.png');
figure 
imshow(p5)
imwrite(p5,'imageCercle.png');
figure
imshow(p6);
imwrite(p6,'imageDegrade.png');
figure
imshow(p7);
imwrite(p7,'imageLosange.png');


















    
    


