function [ org,fig1,fig2,fig3 ] = sobel_edge6( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);

rf=(r);


%% Normal Median Filter
 
r1=medfilt2(rf(:,:,1));
r2=medfilt2(rf(:,:,2));
r3=medfilt2(rf(:,:,3));
 

rm=cat(3,r1,r2,r3);


T=255;



%% Manual Edge Detection :

wx=[-1 -2 -1;0 0 0;1 2 1];

gx=abs(imfilter(double(rf),wx));

wy=[-1 0 1;-2 0 2;-1 0 1];
gy=abs(imfilter(double(rf),wy));


gr=sqrt(gx.^2 + gy.^2);



%% Noise Remove :

e=gr;

for i=5:size(e,1)-5
    
    for j=5:size(e,2)-5
        
        % single pixel
        
        if e(i,j)<=T
            
             if ((e(i+1,j)>=T) || (e(i+1,j-1)>=T)|| (e(i+1,j+1)>=T) || (e(i,j+1)>=T) || (e(i,j-1)>=T) || (e(i-1,j)>=T) || (e(i-1,j-1)>=T) || (e(i-1,j+1)>=T) )
            
                                         
                      rf(i,j,1)=r1(i,j);
                     rf(i,j,2)=r2(i,j);
                     rf(i,j,3)=r3(i,j);
             end
        
        
         % double pixel
            
          if ((e(i+1,j)<=T) || (e(i+1,j-1)<=T)|| (e(i+1,j+1)<=T) || (e(i,j+1)<=T) || (e(i,j-1)<=T) || (e(i-1,j)<=T) || (e(i-1,j-1)<=T) || (e(i-1,j+1)<=T) )
             
                      rf(i,j,1)=r1(i,j);
                     rf(i,j,2)=r2(i,j);
                     rf(i,j,3)=r3(i,j);
          end
        end
          
    end
end

               
   

%% Displaying figures:

org=figure('name','Original Picture');imshow(r);
fig1=figure('name','Sobel Edge Detection');imshow(rm);
fig2=figure('name','Manual Edge Detection');imshow(gr);
fig3=figure('name','Appying Median Filter');imshow(rf);



end

