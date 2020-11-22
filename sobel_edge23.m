function [ org,fig1,fig2,fig3 ] = sobel_edge23( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);

rf=im2double(r);

[h w c]=size(rf);

mpp=zeros(h,w,c);
rm=rf;
sumtotal=zeros(h,w);
sm=zeros(h,w);


mw=fspecial('average');
mf=imfilter(rf,mw);





%% Manual Edge Detection :

wx=[-1 -2 -1;0 0 0;1 2 1];
wy=[-1 0 1;-2 0 2;-1 0 1];


for i=2:h-2 
    for j=2:w-2

rx=wx(1).*rf(i-1,j-1,1)+wx(2).*rf(i-1,j,1)+wx(3).*rf(i-1,j+1,1)+wx(4).*rf(i,j-1,1)+wx(5).*rf(i,j,1)+wx(6).*rf(i,j+1,1)+wx(7).*rf(i+1,j-1,1)+wx(8).*rf(i+1,j,1)+wx(9).*rf(i+1,j+1,1);
ry=wy(1).*rf(i-1,j-1,1)+wy(2).*rf(i-1,j,1)+wy(3).*rf(i-1,j+1,1)+wy(4).*rf(i,j-1,1)+wy(5).*rf(i,j,1)+wy(6).*rf(i,j+1,1)+wy(7).*rf(i+1,j-1,1)+wy(8).*rf(i+1,j,1)+wy(9).*rf(i+1,j+1,1);
            
mpp(i,j,1)=mat2gray(sqrt(rx.*rx+ry.*ry));

        
gx=wx(1).*rf(i-1,j-1,2)+wx(2).*rf(i-1,j,2)+wx(3).*rf(i-1,j+1,2)+wx(4).*rf(i,j-1,2)+wx(5).*rf(i,j,2)+wx(6).*rf(i,j+1,2)+wx(7).*rf(i+1,j-1,2)+wx(8).*rf(i+1,j,2)+wx(9).*rf(i+1,j+1,2);
gy=wy(1).*rf(i-1,j-1,2)+wy(2).*rf(i-1,j,2)+wy(3).*rf(i-1,j+1,2)+wy(4).*rf(i,j-1,2)+wy(5).*rf(i,j,2)+wy(6).*rf(i,j+1,2)+wy(7).*rf(i+1,j-1,2)+wy(8).*rf(i+1,j,2)+wy(9).*rf(i+1,j+1,2);
            
mpp(i,j,2)=mat2gray(sqrt(gx.*gx+gy.*gy));

bx=wx(1).*rf(i-1,j-1,3)+wx(2).*rf(i-1,j,3)+wx(3).*rf(i-1,j+1,3)+wx(4).*rf(i,j-1,3)+wx(5).*rf(i,j,3)+wx(6).*rf(i,j+1,3)+wx(7).*rf(i+1,j-1,3)+wx(8).*rf(i+1,j,3)+wx(9).*rf(i+1,j+1,3);
by=wy(1).*rf(i-1,j-1,3)+wy(2).*rf(i-1,j,3)+wy(3).*rf(i-1,j+1,3)+wy(4).*rf(i,j-1,3)+wy(5).*rf(i,j,3)+wy(6).*rf(i,j+1,3)+wy(7).*rf(i+1,j-1,3)+wy(8).*rf(i+1,j,3)+wy(9).*rf(i+1,j+1,3);
            
mpp(i,j,3)=mat2gray(sqrt(bx.*bx+by.*by));

sm(i,j)=sum(mpp(i,j,:));

                 
    end
end


for i=2:h-2 
    for j=2:w-2
sumtotal(i,j)=sum(mpp(i-1,j-1,:))+sum(mpp(i-1,j,:))+sum(mpp(i-1,j+1,:))+sum(mpp(i,j-1,:))+sum(mpp(i,j+1,:))+sum(mpp(i+1,j-1,:))+sum(mpp(i+1,j,:))+sum(mpp(i+1,j+1,:));
    end
end


st=max(sumtotal(:));
smm=max(sm(:));
smc=smm/8;
sc=st/8;
      
for i=2:h-2 
    for j=2:w-2
                      
       if sumtotal(i,j)<=st && sumtotal(i,j)>(st-sc) && sm(i,j)>=0 && sm(i,j)<smc
                   
                  rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:))/8;
       end  
        
         if sumtotal(i,j)<=(st-sc) && sumtotal(i,j)>(st-sc*2) && sm(i,j)>=smc && sm(i,j)<smc*2
           
      
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:))/9;
             
         end
         
          if sumtotal(i,j)<=(st-sc*2) && sumtotal(i,j)>(st-sc*3) && sm(i,j)>=smc*2 && sm(i,j)<smc*3
         
      rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*2)/10;
         
          end
          
           if sumtotal(i,j)<=(st-sc*3) && sumtotal(i,j)>(st-sc*4) && sm(i,j)>=smc*3 && sm(i,j)<smc*4
         
 
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*3)/11;
         
           end
           
            if sumtotal(i,j)<=(st-sc*4) && sumtotal(i,j)>(st-sc*5) && sm(i,j)>=smc*4 && sm(i,j)<smc*5
         
 
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*4)/12;
         
            end
            
             if sumtotal(i,j)<=(st-sc*5) && sumtotal(i,j)>(st-sc*6) && sm(i,j)>=smc*5 && sm(i,j)<smc*6
         
 
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*5)/13;
         
             end
            
              if sumtotal(i,j)<=(st-sc*6) && sumtotal(i,j)>(st-sc*7) && sm(i,j)>=smc*6 && sm(i,j)<smc*7
         
 
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*6)/14;
         
              end
           
    end
end

%% Displaying figures:

org=figure('name','Original Picture');imshow(rf);
fig1=figure('name','Manual Edge Detection');imshow(rm);
fig2=figure('name','Manual Edge Detection');imshow(mf);
fig3=figure('name','Manual Edge Detection');imshow(mpp);

end 

