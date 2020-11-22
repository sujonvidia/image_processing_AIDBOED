function [ org,fig1,fig2,fig3 ] = sobel_edge3( input )

%Detect Edges & Remove Noises
%   Specify the input and it shows the result using various filtering.


r=imread(input);



%% Edge Detection :


[im,t]=edge(im2bw(r),'sobel');

m=fspecial('sobel');
gx=imfilter(im2bw(r),m);
gy=imfilter(im2bw(r),m');
im2=gx+gy;



%% Point Detection :

% np=colfilt(e,[3 3],'sliding');

e=im;

for i=3:size(e,1)-3
    for j=3:size(e,2)-3
        
           if e(i,j)==1
               
                % find isolated points
               if (e(i+1,j)==0) && (e(i-1,j)==0) && (e(i,j+1)==0) && (e(i,j-1)==0) 
                   e(i,j)=0;   
              
               end
               
                                         
           end                              
    end
end

%% Applying Median Filter:


em=e-medfilt2(e);


%% Displaying figures:

org=figure('name','Original Picture');imshow(r);
fig1=figure('name','Edge Detection');imshow(im);
fig2=figure('name','Point Detection');imshow(e);
fig3=figure('name','Median Filter');imshow(em);



end

