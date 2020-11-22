function [ org,fig1,fig2,fig3 ] = sobel_edge27( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);

rf=im2double(r);

rm=rf;
[h w c]=size(rf);

mpp=zeros(h,w,c);

sumtotal=zeros(h,w);
sm=zeros(h,w);


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

im=rf;

%% Color Distance

for y=2:h-1
    for x=2:w-1
        for c=1:3
            
                        
            mp=im(y,x,c);
            av(y,x,c)=(abs(mp-im(y-1,x-1,c))+abs(mp-im(y-1,x,c))+abs(mp-im(y-1,x+1,c))+abs(mp-im(y,x-1,c))+abs(mp-im(y,x+1,c))+abs(mp-im(y+1,x-1,c))+abs(mp-im(y+1,x,c))+abs(mp-im(y+1,x+1,c)))/8;
            
            
        end
        avv(y,x)=sum(av(y,x,:));
        
    end
    
end


for i=2:h-2 
    for j=2:w-2
sumtotal(i,j)=(sum(mpp(i-1,j-1,:))+sum(mpp(i-1,j,:))+sum(mpp(i-1,j+1,:))+sum(mpp(i,j-1,:))+sum(mpp(i,j+1,:))+sum(mpp(i+1,j-1,:))+sum(mpp(i+1,j,:))+sum(mpp(i+1,j+1,:)))*.5^sm(i,j);
    end
end


st=max(sumtotal(:));
sc=st/8;
      
for i=2:h-2 
    for j=2:w-2
        
    if sumtotal(i,j)>5 || avv(i,j)>.5
        for l=1:c
        
        m=rm(i,j,l);
        
        p(1)=(rm(i-1,j-1,l));
        p(2)=(rm(i,j-1,l));
        p(3)=(rm(i+1,j-1,l));
        p(4)=(rm(i-1,j,l));
        p(5)=(rm(i+1,j,l));
        p(6)=(rm(i-1,j+1,l));
        p(7)=(rm(i,j+1,l));
        p(8)=(rm(i+1,j+1,l));
        
        s(1)=abs(m-p(1));
        s(2)=abs(m-p(2));
        s(3)=abs(m-p(3));
        s(4)=abs(m-p(4));
        s(5)=abs(m-p(5));
        s(6)=abs(m-p(6));
        s(7)=abs(m-p(7));
        s(8)=abs(m-p(8));
        
        [sr,id]=sort(s);
        
        dd=0;
        k=3;
        for t=1:k
        dd=dd+p(id(t));
         end
       rm(i,j,l)=(dd+rm(i,j,l))/(t+1);
        end
          
    end
           
    end
        
end

           
%% Displaying figures:

org=figure('name','Original Picture');imshow(rf);
fig1=figure('name','EBA-KNN');imshow(rm);
fig2=figure('name','Manual Edge Detection');imshow(mpp);

end 

