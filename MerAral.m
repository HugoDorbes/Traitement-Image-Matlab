clear all; close all; clc; 

image1 = imread('MerAral_2001.jpg');
image2 = imread('MerAral_2003.jpg');
image3 = imread('MerAral_2005.jpg');
image4 = imread('MerAral_2009.jpg');
image5 = imread('MerAral_2012.jpg');
image6 = imread('MerAral_2014.jpg');

im1=double(image1);
im2=double(image2); 
im3=double(image3);
im4=double(image4);
im5=double(image5); 
im6=double(image6);

taille=size(im1); 
maxi=max(max(im1)); 
mini=min(min(im1)); 
distmax=1000; 
class1=zeros(taille(1),taille(2)); 
class3=zeros(taille(1),taille(2)); 
class2=zeros(taille(1),taille(2)); 
class4=zeros(taille(1),taille(2)); 
class5=zeros(taille(1),taille(2)); 
class6=zeros(taille(1),taille(2)); 


% Mer 
C1=[19 30 34 ; 18 35 29 ; 29 70 40 ; 14 37 29 ;
    58 116 42 ; 62 115 47; 58 110 46  ]; %2001
C2=[21 35 44 ; 19 58 39 ; 24 64 40 ; 29 75 62 ;
    22 62 35 ; 31 86 44 ;54 103 48  ]; %2003
C3=[18 37 35 ; 36 92 63 ; 74 112 65; 21 37 27 ;
    29 85 58 ; 14 33 29 ; 25 43 31 ]; %2005
C4=[ 19 35 35; 16 32 29 ; 21 36 29 ; 22 44 31 ;
    20 36 36 ; 25 42 32 ; 13 32 28]; %2009
C5=[19 30 34 ; 18 35 29 ; 29 70 40 ; 14 37 29 ;
    58 116 42 ; 62 115 47; 58 110 46]; %2012
C6=[13 36 26 ; 12 24 20 ; 16 42 31 ; 15 40 19 ; 
   22 66 41 ; 15 36 29 ; 16 41 20]; %2014




lm1=size(C1);
lm2=size(C2);  
lm3=size(C3); 
lm4=size(C4);
lm5=size(C5);  
lm6=size(C6);  

for i= 1:550;      
 for j= 100:550;          
     for u=1:lm1(1);              
         dist(u)=(im1(i,j,1)-C1(u,1))^2+(im1(i,j,2)-C1(u,2))^2+(im1(i,j,3)-C1(u,3))^2;              
         
         if min(dist)<distmax;                 
             class1(i,j)=1; 
         end 
     end
 end
end

for i= 1:550;      
 for j= 100:550;          
     for u=1:lm2(1);              
         dist(u)=(im2(i,j,1)-C2(u,1))^2+(im2(i,j,2)-C2(u,2))^2+(im2(i,j,3)-C2(u,3))^2;              
         
         if min(dist)<distmax;                 
             class2(i,j)=1; 
         end 
     end
 end
end


for i= 1:550;      
 for j= 100:550;          
     for u=1:lm3(1);              
         dist(u)=(im3(i,j,1)-C3(u,1))^2+(im3(i,j,2)-C3(u,2))^2+(im3(i,j,3)-C3(u,3))^2;              
         
         if min(dist)<distmax;                 
             class3(i,j)=1; 
         end 
     end
    
 end
end

for i= 1:550;      
 for j= 100:550;          
     for u=1:lm4(1);              
         dist(u)=(im4(i,j,1)-C4(u,1))^2+(im4(i,j,2)-C4(u,2))^2+(im4(i,j,3)-C4(u,3))^2;              
         
         if min(dist)<distmax;                 
             class4(i,j)=1; 
         end 
     end
    
 end
end

for i= 1:550;      
 for j= 100:550;          
     for u=1:lm5(1);              
         dist(u)=(im5(i,j,1)-C5(u,1))^2+(im5(i,j,2)-C5(u,2))^2+(im5(i,j,3)-C5(u,3))^2;              
         
         if min(dist)<distmax;                 
             class5(i,j)=1; 
         end 
     end
 end
end


for i= 1:550;      
 for j= 100:550;          
     for u=1:lm6(1);              
         dist(u)=(im6(i,j,1)-C6(u,1))^2+(im6(i,j,2)-C6(u,2))^2+(im6(i,j,3)-C6(u,3))^2;              
         
         if min(dist)<distmax;                 
             class6(i,j)=1; 
         end 
     end
    
 end
end
Mer2001=0;
for i= 1:550;      
 for j= 100:550;
     Pix1 = class1(i,j);
     if Pix1 == 1;
         Mer2001 = Mer2001 + 1 ;
     end
 end
end

Mer2003=0;
for i= 1:550;      
 for j= 100:550;
     Pix2=class2(i,j);
     
     if Pix2 == 1
         Mer2003 = Mer2003 + 1 ;
     end
 end
end


Mer2005=0;
for i= 1:taille(1);      
 for j= 1:taille(2);
     Pix3=class3(i,j);
     
     if Pix3 == 1
         Mer2005 = Mer2005 + 1 ;
     end
 end
end

Mer2009=0;
for i= 1:taille(1);      
 for j= 1:taille(2);
     Pix4=class4(i,j);
     
     if Pix4 == 1
         Mer2009 = Mer2009 + 1 ;
     end
 end
end

Mer2012=0;
for i= 1:550;      
 for j= 100:550;
     Pix5=class5(i,j);
     
     if Pix5 == 1
         Mer2012 = Mer2012 + 1 ;
     end
 end
end


Mer2014=0;
for i= 1:taille(1);      
 for j= 1:taille(2);
     Pix6=class6(i,j);
     
     if Pix6 == 1
         Mer2014 = Mer2014 + 1 ;
     end
 end
end


M01_03=Mer2003/Mer2001*100; 
M01_05=Mer2005/Mer2001*100;
M01_09=Mer2009/Mer2001*100; 
M01_12=Mer2012/Mer2001*100;
M01_14=Mer2014/Mer2001*100;

M2003 = Mer2003/Mer2001*100-100;
M2005 = Mer2005/Mer2003*100-100;
M2009 = Mer2009/Mer2005*100-100;
M2012 = Mer2012/Mer2009*100-100;
M2014 = Mer2014/Mer2012*100-100;

figure;
subplot(3,2,1); imshow(class1); title('2001'); imwrite(class1,'2001.jpg');
subplot(3,2,2); imshow(image1); title('Mer Aral en 2001');
subplot(3,2,3); imshow(class2); title('2003'); imwrite(class2,'2003.jpg');
subplot(3,2,4); imshow(image2); title('Mer Aral en 2003');
subplot(3,2,5); imshow(class3); title('2005'); imwrite(class3,'2005.jpg');
subplot(3,2,6); imshow(image3); title('Mer Aral en 2005');
figure
subplot(3,2,1); imshow(class4); title('2009'); imwrite(class4,'2009.jpg');
subplot(3,2,2); imshow(image4); title('Mer Aral en 2009');
subplot(3,2,3); imshow(class5); title('2012'); imwrite(class5,'2012.jpg');
subplot(3,2,4); imshow(image5); title('Mer Aral en 2012');
subplot(3,2,5); imshow(class6); title('2014'); imwrite(class6,'2014.jpg');
subplot(3,2,6); imshow(image6); title('Mer Aral en 2014');




X=[ 100 M01_03 M01_05 M01_09 M01_12  M01_14 ]
Y=[ Mer2001 Mer2003 Mer2005 Mer2009 Mer2012 Mer2014]
Z=[ 2001 2003 2005 2009 2012 2014 ]
W=[ 0 M2003 M2005 M2009 M2012 M2014]

figure; 
subplot(1,2,1); bar(Z,X);
subplot(1,2,2); bar(Z,W);




