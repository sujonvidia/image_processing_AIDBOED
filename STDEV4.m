function [ output ] = STDEV4( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r=imread(input);
im=im2double(r);
[h w v]=size(im);

av=zeros(h,w,v);
avv=zeros(h,w);


for y=2:h-1
    for x=2:w-1
        for c=1:3
            
                        
            mp=im(y,x,c);
            im(y,x,c)=(abs(mp-im(y-1,x-1,c))+abs(mp-im(y-1,x,c))+abs(mp-im(y-1,x+1,c))+abs(mp-im(y,x-1,c))+abs(mp-im(y,x+1,c))+abs(mp-im(y+1,x-1,c))+abs(mp-im(y+1,x,c))+abs(mp-im(y+1,x+1,c)))/8;
            
            
            
            
        end
        avv(y,x)=sum(av(y,x,:));
        
    end
    
end
 

for i=2:h-1
    for j=2:w-1
        if avv(i,j)>.3
            im(y,x,:)=0;
        end
    end
end
            


        
imshow(im);






end

