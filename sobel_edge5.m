function [ org,fig1,fig2,fig3 ] = sobel_edge5( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);

rf=(r);


% Normal Median Filter
 
r1=medfilt2(rf(:,:,1));
r2=medfilt2(rf(:,:,2));
r3=medfilt2(rf(:,:,3));
 

rm=cat(3,r1,r2,r3);

 

%% Edge Detection :

gr=edge(im2bw(r));










%% Point Detection :


e=gr;

for i=5:size(e,1)-5
    for j=5:size(e,2)-5
        
        if e(i,j)==1 
            
            % single pixel
            if ((e(i+1,j)==0) || (e(i+1,j-1)==0)|| (e(i+1,j+1)==0) || (e(i,j+1)==0) || (e(i,j-1)==0) || (e(i-1,j)==0) || (e(i-1,j-1)==0) || (e(i-1,j+1)==0) )
                                     
                       
                            
                   
                     rf(i,j,1)=r1(i,j);
                     rf(i,j,2)=r2(i,j);
                     rf(i,j,3)=r3(i,j);
                     
            end
                     
                     
                
                % double pixel
           
            if ((e(i+1,j)==1) || (e(i+1,j-1)==1)|| (e(i+1,j+1)==1) || (e(i,j+1)==1) || (e(i,j-1)==1) || (e(i-1,j)==1) || (e(i-1,j-1)==1) || (e(i-1,j+1)==1) )
              
               
                     
                       
                   
                      rf(i,j,1)=r1(i,j);
                     rf(i,j,2)=r2(i,j);
                     rf(i,j,3)=r3(i,j);
                     
               
                 %rf(i,j,:)=cat(3,rf1,rf2,rf3);
                 
           
               
                 
            end
               
        end
        
         
           
               
                                         
                                    
    end
end

%% Applying Median Filter:





%% Displaying figures:

org=figure('name','Original Picture');imshow(r);
fig1=figure('name','Edge Detection');imshow(rm);
fig2=figure('name','Point Detection');imshow(gr);
fig3=figure('name','Median Filter');imshow(rf);



end

