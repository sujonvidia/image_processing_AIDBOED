function [ output,original ] = sobel_edge2( input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r=imread(input);

% Edge Detection

for i=3:size(r,1)-3
    for j=3:size(r,2)-3
    
   
    
        if r(i,j,1) < r(i+1,j,1) || r(i,j,2) < r(i+1,j,2) || r(i,j,3) < r(i+1,j,3)
            r(i,j,1)=1;
            r(i,j,2)=0;
            r(i,j,3)=0;
        end
        
            
            
    
    end
    
        
   
    
    
end




% Point Detection

% np=colfilt(e,[3 3],'sliding');

e=r;

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


original=imshow(r);
output=figure;imshow(e);



end

