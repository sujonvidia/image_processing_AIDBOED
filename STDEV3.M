function [ output ] = STDEV3( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r=imread(input);
im=im2double(r);
[h w v]=size(im);
av=zeros(h,w,v);
avv=zeros(h,w);

rf=im;

for y=2:h-1
    for x=2:w-1
        for c=1:3
            
                        
            mp=im(y,x,c);
            av(y,x,c)=(abs(mp-im(y-1,x-1,c))+abs(mp-im(y-1,x,c))+abs(mp-im(y-1,x+1,c))+abs(mp-im(y,x-1,c))+abs(mp-im(y,x+1,c))+abs(mp-im(y+1,x-1,c))+abs(mp-im(y+1,x,c))+abs(mp-im(y+1,x+1,c)))/8;
            
            
            
            
        end
        avv(y,x)=sum(av(y,x,:));
        
    end
    
end



for i=2:h-1
    for j=2:w-1
        if avv(i,j)>.5
            
            s(8)=0;
p(8)=0;

        for l=1:3
        
        m=rf(i,j,l);
        
        p(1)=(rf(i-1,j-1,l));
        p(2)=(rf(i,j-1,l));
        p(3)=(rf(i+1,j-1,l));
        p(4)=(rf(i-1,j,l));
        p(5)=(rf(i+1,j,l));
        p(6)=(rf(i-1,j+1,l));
        p(7)=(rf(i,j+1,l));
        p(8)=(rf(i+1,j+1,l));
        
        s(1)=abs(m-p(1));
        s(2)=abs(m-p(2));
        s(3)=abs(m-p(3));
        s(4)=abs(m-p(4));
        s(5)=abs(m-p(5));
        s(6)=abs(m-p(6));
        s(7)=abs(m-p(7));
        s(8)=abs(m-p(8));
        
        [sr,id]=sort(s);
        
        
k=3;           
           
        dd=0;
        
        for t=1:k
        dd=dd+p(id(t));
         end
       rf(i,j,l)=(dd+rf(i,j,l))/(t+1);
        end
        
       
    
        end
    end
end


figure,imshow(im);
figure,imshow(rf);

end

