function [ output ] = knn( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



im=imread(input);

rm=im2double(im);

rf=rm;

[h w c]=size(rf);


s(8)=0;
p(8)=0;


for i=2:h-2
    for j=2:w-2
        for l=1:c
        
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
        
        dd=0;
        k=3;
        for t=1:k
        dd=dd+p(id(t));
         end
       rf(i,j,l)=(dd+rf(i,j,l))/(t+1);
        end
                
        
    end
    

end



figure,imshow(rm);
        figure,imshow(rf);
end
  



