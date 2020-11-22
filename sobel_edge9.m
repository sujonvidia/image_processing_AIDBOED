function [ org,fig1,fig2,fig3 ] = sobel_edge9( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);

rff=r;
rf=im2double(r);

mp=zeros(size(rf,1),size(rf,2),size(rf,3));
mpp=zeros(size(rf,1),size(rf,2),size(rf,3));

r1=medfilt2(rff(:,:,1));
r2=medfilt2(rff(:,:,2));
r3=medfilt2(rff(:,:,3));

%% Normal Median Filter

rm=cat(3,r1,r2,r3);




%% Manual Edge Detection :


wx=[-1 0 1;-2 0 2;-1 0 1];
wy=[-1 -2 -1;0 0 0;1 2 1];

for i=2:size(rf,1)-2
    for j=2:size(rf,2)-2
        
           
            rx=wx(1).*rf(i-1,j-1,1)+wx(2).*rf(i-1,j,1)+wx(3).*rf(i-1,j+1,1)+wx(4).*rf(i,j-1,1)+wx(5).*rf(i,j,1)+wx(6).*rf(i,j+1,1)+wx(7).*rf(i+1,j-1,1)+wx(8).*rf(i+1,j,1)+wx(9).*rf(i+1,j+1,1);
            ry=wy(1).*rf(i-1,j-1,1)+wy(2).*rf(i-1,j,1)+wy(3).*rf(i-1,j+1,1)+wy(4).*rf(i,j-1,1)+wy(5).*rf(i,j,1)+wy(6).*rf(i,j+1,1)+wy(7).*rf(i+1,j-1,1)+wy(8).*rf(i+1,j,1)+wy(9).*rf(i+1,j+1,1);
            
mp(i,j,1)=sqrt((rx).^2+(ry).^2);

        
            gx=wx(1).*rf(i-1,j-1,2)+wx(2).*rf(i-1,j,2)+wx(3).*rf(i-1,j+1,2)+wx(4).*rf(i,j-1,2)+wx(5).*rf(i,j,2)+wx(6).*rf(i,j+1,2)+wx(7).*rf(i+1,j-1,2)+wx(8).*rf(i+1,j,2)+wx(9).*rf(i+1,j+1,2);
            gy=wy(1).*rf(i-1,j-1,2)+wy(2).*rf(i-1,j,2)+wy(3).*rf(i-1,j+1,2)+wy(4).*rf(i,j-1,2)+wy(5).*rf(i,j,2)+wy(6).*rf(i,j+1,2)+wy(7).*rf(i+1,j-1,2)+wy(8).*rf(i+1,j,2)+wy(9).*rf(i+1,j+1,2);
            
mp(i,j,2)=sqrt((gx).^2+(gy).^2);


            bx=wx(1).*rf(i-1,j-1,3)+wx(2).*rf(i-1,j,3)+wx(3).*rf(i-1,j+1,3)+wx(4).*rf(i,j-1,3)+wx(5).*rf(i,j,3)+wx(6).*rf(i,j+1,3)+wx(7).*rf(i+1,j-1,3)+wx(8).*rf(i+1,j,3)+wx(9).*rf(i+1,j+1,3);
            by=wy(1).*rf(i-1,j-1,3)+wy(2).*rf(i-1,j,3)+wy(3).*rf(i-1,j+1,3)+wy(4).*rf(i,j-1,3)+wy(5).*rf(i,j,3)+wy(6).*rf(i,j+1,3)+wy(7).*rf(i+1,j-1,3)+wy(8).*rf(i+1,j,3)+wy(9).*rf(i+1,j+1,3);
            
mp(i,j,3)=sqrt((bx).^2+(by).^2);

 % mp(i,j,1)=mp(i,j,1)/max(mp(:));         
 % mp(i,j,2)=mp(i,j,2)/max(mp(:));
 % mp(i,j,3)=mp(i,j,3)/max(mp(:));
   
   
   
   mpp(i,j,1)=(1-mp(i,j,1));
   mpp(i,j,2)=(1-mp(i,j,2));
   mpp(i,j,3)=(1-mp(i,j,3));
   
            
            
        mv=mpp(i,j,1)+mpp(i,j,2)+mpp(i,j,3);
        
        T=2;
        if (mv)<T
            mpp(i,j,1)=0;
            mpp(i,j,2)=0;
            mpp(i,j,3)=0;
        else
            
            
            if (sum(mpp(i+1,j,:))<=T) && (sum(mpp(i+1,j-1,:))<=T) && (sum(mpp(i+1,j+1,:))<=T) && (sum(mpp(i,j+1,:))<=T) && (sum(mpp(i,j-1,:))<=T) && (sum(mpp(i-1,j,:))<=T) && (sum(mpp(i-1,j-1,:))<=T) && (sum(mpp(i-1,j+1,:))<=T) 
            rff(i,j,1)=r1(i,j);
            rff(i,j,2)=r2(i,j);
            rff(i,j,3)=r3(i,j);
            end
            
        end
   
   
    end
end





%% Noise Remove :

%% Displaying figures:

org=figure('name','Original Picture');imshow(r);
fig1=figure('name','Normal Median Filter');imshow(rm);
fig2=figure('name','Manual Edge Detection');imshow(mpp);
fig3=figure('name','Noise Remove after Applying Median');imshow(rff);

end 

