function [ output_args ] = STDEV5( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here




sdo=zeros(100,100,3);
[h w c]=size(sdo);
mpp=zeros(h,w,c);


sumtotal=zeros(h,w);
sm=zeros(h,w);


for i=20:30
    for j=20:80
        for k=1:c
        sdo(i,j,k)=rand(1);
        end
    end
end


for i=30:80
    for j=45:55
        for k=1:c
        sdo(i,j,k)=rand(1);
        end
    end
end

sdo(10,50,:)=1;



rf=sdo;
im=sdo;
sdo2=sdo;
sdo3=sdo;

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
sumtotal(i,j)=(sum(mpp(i-1,j-1,:))+sum(mpp(i-1,j,:))+sum(mpp(i-1,j+1,:))+sum(mpp(i,j-1,:))+sum(mpp(i,j+1,:))+sum(mpp(i+1,j-1,:))+sum(mpp(i+1,j,:))+sum(mpp(i+1,j+1,:)))*.5^sm(i,j);
    end
end

st=max(sumtotal(:));



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
        
        if sumtotal(i,j)>3
            
        for l=1:c
        
        m=sdo(i,j,l);
        
        p(1)=(sdo(i-1,j-1,l));
        p(2)=(sdo(i,j-1,l));
        p(3)=(sdo(i+1,j-1,l));
        p(4)=(sdo(i-1,j,l));
        p(5)=(sdo(i+1,j,l));
        p(6)=(sdo(i-1,j+1,l));
        p(7)=(sdo(i,j+1,l));
        p(8)=(sdo(i+1,j+1,l));
        
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
       sdo2(i,j,l)=(dd+sdo(i,j,l))/(t+1);
        end
        end      
        
    end
    

end

for i=2:h-2
    for j=2:w-2
        
        if avv(i,j)>.3
            
        for l=1:c
        
        m=sdo(i,j,l);
        
        p(1)=(sdo(i-1,j-1,l));
        p(2)=(sdo(i,j-1,l));
        p(3)=(sdo(i+1,j-1,l));
        p(4)=(sdo(i-1,j,l));
        p(5)=(sdo(i+1,j,l));
        p(6)=(sdo(i-1,j+1,l));
        p(7)=(sdo(i,j+1,l));
        p(8)=(sdo(i+1,j+1,l));
        
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
       sdo3(i,j,l)=(dd+sdo(i,j,l))/(t+1);
        end
        end      
        
    end
    

end

figure,imshow(sdo);
figure,imshow(sdo2);
figure,imshow(sdo3);
figure,imshow(mpp);



end

