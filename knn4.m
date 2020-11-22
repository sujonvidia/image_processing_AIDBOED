function [ output ] = knn4( input,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



im=imread(input);

rm=im2double(im);
rf=rm;

[h w c]=size(rf);

r(8)=0;
g(8)=0;
b(8)=0;
s(8)=0;


for i=2:h-2
    for j=2:w-2
        
        
        dr=rf(i,j,1); dg=rf(i,j,2); db=rf(i,j,3);
        
        
        r(1)=rf(i-1,j-1,1); 
        g(1)=rf(i-1,j-1,2); 
        b(1)=rf(i-1,j-1,3); 
        
        s(1)=abs(dr-r(1))+abs(dg-g(1))+abs(db-b(1));
        
        r(2)=rf(i-1,j,1);
        g(2)=rf(i-1,j,2);
        b(2)=rf(i-1,j,3);
        
        s(2)=abs(dr-r(2))+abs(dg-g(2))+abs(db-b(2));
        
        r(3)=rf(i-1,j+1,1);
        g(3)=rf(i-1,j+1,2);
        b(3)=rf(i-1,j+1,3);
        
        s(3)=abs(dr-r(3))+abs(dg-g(3))+abs(db-b(3));
        
        r(4)=rf(i,j-1,1);
        g(4)=rf(i,j-1,2);
        b(4)=rf(i,j-1,3);
        
        s(4)=abs(dr-r(4))+abs(dg-g(4))+abs(db-b(4));
        
        r(5)=rf(i,j+1,1);
        g(5)=rf(i,j+1,2);
        b(5)=rf(i,j+1,3);
        
        s(5)=abs(dr-r(5))+abs(dg-g(5))+abs(db-b(5));
        
        r(6)=rf(i+1,j-1,1);
        g(6)=rf(i+1,j-1,2);
        b(6)=rf(i+1,j-1,3);
        
        s(6)=abs(dr-r(6))+abs(dg-g(6))+abs(db-b(6));
        
        r(7)=rf(i+1,j,1);
        g(7)=rf(i+1,j,2);
        b(7)=rf(i+1,j,3);
        
        s(7)=abs(dr-r(7))+abs(dg-g(7))+abs(db-b(7));
        
        r(8)=rf(i+1,j+1,1);
        g(8)=rf(i+1,j+1,2);
        b(8)=rf(i+1,j+1,3);
        
        s(8)=abs(dr-r(8))+abs(dg-g(8))+abs(db-b(8));
                
        [sr,id]=sort(s);
        ddr=0;ddg=0;ddb=0;
        
        for p=1:k
            
        ddr=ddr+r(id(p));
       rf(i,j,1)=(ddr+dr)/(k+1);
       
       ddg=ddg+g(id(p));
       rf(i,j,2)=(ddg+dg)/(k+1);
       
       ddb=ddb+b(id(p));
       rf(i,j,3)=(ddb+dr)/(k+1);
       
        end
                
      
        
        
        
    end
end
  imshow(rm);
        figure,imshow(rf);

end

