function [ output ] = stdev( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


im=zeros(100,100,3);
lv=zeros(100,100,3);
imn=zeros(100,100,3);

for y=20:30
    for x=20:80
        for c=1:3
        im(y,x,c)=rand(1);
        end
    end
end

for y=31:80
    for x=45:55
        for c=1:3
        im(y,x,c)=rand(1);
        end
    end
end

im(10,50,:)=1;

mv1=mean(im);
mv2=mean(mv1);
mv3=mean(mv2);

nv=0;
for y=2:99
    for x=2:99
        for c=1:3
            
            nv=nv+im(y,x,c)-mv3;

        end
    end
end

nv=nv/98*98*3;


for y=2:99
    for x=2:99
        for c=1:3
            
            mn=(im(y,x,c)+im(y-1,x-1,c)+im(y-1,x,c)+im(y-1,x+1,c)+im(y,x-1,c)+im(y,x+1,c)+im(y+1,x-1,c)+im(y+1,x,c)+im(y+1,x+1,c))/9;
            
            lv(y,x,c)=(abs(im(y,x,c)-mn)+abs(im(y-1,x-1,c)-mn)+abs(im(y-1,x,c)-mn)+abs(im(y-1,x+1,c)-mn)+abs(im(y,x-1,c)-mn)+abs(im(y,x+1,c)-mn)+abs(im(y+1,x-1,c)-mn)+abs(im(y+1,x,c)-mn)+abs(im(y+1,x+1,c)-mn))/9;
            
            
        end
    end
end

for y=2:99
    for x=2:99
        for c=1:3
            
            lm=(im(y,x,c)+im(y-1,x-1,c)+im(y-1,x,c)+im(y-1,x+1,c)+im(y,x-1,c)+im(y,x+1,c)+im(y+1,x-1,c)+im(y+1,x,c)+im(y+1,x+1,c))/9;
            imn(y,x,c)=im(y,x,c)-(nv.*nv/lv(y,x,c).*lv(y,x,c)).*(im(y,x,c)-lm);
            
            
        end
    end
end



        
imshow(im);
figure,imshow(imn);






end

