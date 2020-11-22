function [ output ] = stdev2( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


r=imread(input);
im=im2double(r);
[h w c]=size(im);

mv1=mean(im);
mv2=mean(mv1);
mv3=mean(mv2);

nv=0;
for y=2:h-1
    for x=2:w-1
        for c=1:3
            
            nv=nv+abs(im(y,x,c)-mv3);

        end
    end
end

nv=nv/(h-2)*(w-2)*3;


for y=2:h-1
    for x=2:w-1
        for c=1:3
            
            mn=(im(y,x,c)+im(y-1,x-1,c)+im(y-1,x,c)+im(y-1,x+1,c)+im(y,x-1,c)+im(y,x+1,c)+im(y+1,x-1,c)+im(y+1,x,c)+im(y+1,x+1,c))/9;
            
            lv(y,x,c)=(abs(im(y,x,c)-mn)+abs(im(y-1,x-1,c)-mn)+abs(im(y-1,x,c)-mn)+abs(im(y-1,x+1,c)-mn)+abs(im(y,x-1,c)-mn)+abs(im(y,x+1,c)-mn)+abs(im(y+1,x-1,c)-mn)+abs(im(y+1,x,c)-mn)+abs(im(y+1,x+1,c)-mn))/9;
            
            
        end
    end
end

for y=2:h-1
    for x=2:w-1
        for c=1:3
            
            lm=(im(y,x,c)+im(y-1,x-1,c)+im(y-1,x,c)+im(y-1,x+1,c)+im(y,x-1,c)+im(y,x+1,c)+im(y+1,x-1,c)+im(y+1,x,c)+im(y+1,x+1,c))/9;
            imn(y,x,c)=im(y,x,c)-(nv.*nv/lv(y,x,c).*lv(y,x,c)).*(im(y,x,c)-lm);
            
            
        end
    end
end



        
imshow(im);
figure,imshow(imn);






end

