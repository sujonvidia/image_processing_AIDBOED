function [ output,thres,original ] = sobel_edge( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r=imread(input);

% Edge Detection
f=im2bw(r);

[eo,thres]=edge(f,'sobel',0.1);

% Point Detection

w=[-1 -1 -1;-1 8 -1;-1 -1 -1];
g=abs(imfilter(double(f),w));
T=max(g(:));
g= g>=thres;

% np=colfilt(e,[3 3],'sliding');

e=eo;

for i=3:size(e,1)-3
    for j=3:size(e,2)-3
        
           if e(i,j)==1
               
                
               if e(i+1,j)==0 && e(i-1,j)==0 && e(i,j+1)==0 && e(i,j-1)==0 
                   e(i,j)=0;   
               else
                   e(i,j)=1;
               end
               
                                         
           end       
                                
                                
            
    end
end


original=imshow(eo);
output=figure;imshow(e);



end

