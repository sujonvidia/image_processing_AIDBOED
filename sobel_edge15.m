function [ org,fig1,fig2 ] = sobel_edge15( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);

rf=im2double(r);

[h w c]=size(rf);

mp=zeros(h,w,c);
mpp=zeros(h,w,c);

rm=rf;

%% Manual Edge Detection :



wx=[-1 -2 -1;0 0 0;1 2 1];
wy=[-1 0 1;-2 0 2;-1 0 1];




for i=2:h-2 
    for j=2:w-2

      rx=wx(1).*rf(i-1,j-1,1)+wx(2).*rf(i-1,j,1)+wx(3).*rf(i-1,j+1,1)+wx(4).*rf(i,j-1,1)+wx(5).*rf(i,j,1)+wx(6).*rf(i,j+1,1)+wx(7).*rf(i+1,j-1,1)+wx(8).*rf(i+1,j,1)+wx(9).*rf(i+1,j+1,1);
            ry=wy(1).*rf(i-1,j-1,1)+wy(2).*rf(i-1,j,1)+wy(3).*rf(i-1,j+1,1)+wy(4).*rf(i,j-1,1)+wy(5).*rf(i,j,1)+wy(6).*rf(i,j+1,1)+wy(7).*rf(i+1,j-1,1)+wy(8).*rf(i+1,j,1)+wy(9).*rf(i+1,j+1,1);
            
mp(i,j,1)=sqrt((rx).*rx+(ry).*ry);

        
            gx=wx(1).*rf(i-1,j-1,2)+wx(2).*rf(i-1,j,2)+wx(3).*rf(i-1,j+1,2)+wx(4).*rf(i,j-1,2)+wx(5).*rf(i,j,2)+wx(6).*rf(i,j+1,2)+wx(7).*rf(i+1,j-1,2)+wx(8).*rf(i+1,j,2)+wx(9).*rf(i+1,j+1,2);
            gy=wy(1).*rf(i-1,j-1,2)+wy(2).*rf(i-1,j,2)+wy(3).*rf(i-1,j+1,2)+wy(4).*rf(i,j-1,2)+wy(5).*rf(i,j,2)+wy(6).*rf(i,j+1,2)+wy(7).*rf(i+1,j-1,2)+wy(8).*rf(i+1,j,2)+wy(9).*rf(i+1,j+1,2);
            
mp(i,j,2)=sqrt((gx).*gx+(gy).*gy);


            bx=wx(1).*rf(i-1,j-1,3)+wx(2).*rf(i-1,j,3)+wx(3).*rf(i-1,j+1,3)+wx(4).*rf(i,j-1,3)+wx(5).*rf(i,j,3)+wx(6).*rf(i,j+1,3)+wx(7).*rf(i+1,j-1,3)+wx(8).*rf(i+1,j,3)+wx(9).*rf(i+1,j+1,3);
            by=wy(1).*rf(i-1,j-1,3)+wy(2).*rf(i-1,j,3)+wy(3).*rf(i-1,j+1,3)+wy(4).*rf(i,j-1,3)+wy(5).*rf(i,j,3)+wy(6).*rf(i,j+1,3)+wy(7).*rf(i+1,j-1,3)+wy(8).*rf(i+1,j,3)+wy(9).*rf(i+1,j+1,3);
            
mp(i,j,3)=sqrt((bx).*bx+(by).*by);

            
        m1= max(max(mp(:,:,1)));
        m2= max(max(mp(:,:,2)));
        m3= max(max(mp(:,:,3)));


        
  mp(i,j,1)=mp(i,j,1)/m1;         
  mp(i,j,2)=mp(i,j,2)/m2;
  mp(i,j,3)=mp(i,j,3)/m3;
   
     mpp(i,j,1)=(1-mp(i,j,1));
      mpp(i,j,2)=(1-mp(i,j,2));
       mpp(i,j,3)=(1-mp(i,j,3));
     
            
        mv=mpp(i,j,1)+mpp(i,j,2)+mpp(i,j,3);
        
             
        
      T=2.5;
      count=0;
      
      if  sum(mpp(i-1,j-1,:)) > T
          count=count+1;
      end
      
       if  sum(mpp(i-1,j,:)) > T
          count=count+1;
       end
      
        if  sum(mpp(i-1,j+1,:)) > T
          count=count+1;
        end
      
         if  sum(mpp(i,j-1,:)) > T
          count=count+1;
         end
      
          if  sum(mpp(i,j+1,:)) > T
          count=count+1;
          end
      
           if  sum(mpp(i+1,j-1,:)) > T
          count=count+1;
           end
      
            if  sum(mpp(i+1,j,:)) > T
          count=count+1;
            end
      
             if  sum(mpp(i+1,j+1,:)) > T
          count=count+1;
             end
      
       C=1;
       
             
        
        if mv<=3 && mv>2.9
            
           if  count==C
                
                  rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:))/8;
            end
        end
        
         if mv<=2.9 && mv>2.8
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:))/9;
 end
         end
         
          if mv<=2.8 && mv>2.7
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*2)/10;
 end
          end
          
          if mv<=2.7 && mv>2.6
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*3)/11;
 end
          end
          
          if mv<=2.6 && mv>2.5
           
if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*4)/12;
 end
          end
          
          if mv<=2.5 && mv>2.4
           
if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*5)/13;
 end
          end
          
          if mv<=2.4 && mv>2.3
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*6)/14;
 end
          end
          
          if mv<=2.3 && mv>2.2
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*7)/15;
 end
          end
          
          if mv<=2.2 && mv>2.1
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*8)/16;
 end
          end
          
          if mv<=2.1 && mv>2
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*9)/17;
 end
          end
          
           if mv<=2 && mv>1.9
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*10)/18;
 end
           end
          
           if mv<=1.9 && mv>1.8
           
 if  count==C
     rm(i,j,:)=(rm(i+1,j,:) + rm(i+1,j-1,:) + rm(i+1,j+1,:) + rm(i,j+1,:) + rm(i,j-1,:) + rm(i-1,j,:) + rm(i-1,j-1,:) + rm(i-1,j+1,:) + rm(i,j,:)*11)/19;
 end
          end
         
    end
end



%% Displaying figures:

org=figure('name','Original Picture');imshow(rf);
fig1=figure('name','Filtered Picture');imshow(rm);
%fig2=figure('name','Manual Edge Detection');imshow(mpp);


end 
