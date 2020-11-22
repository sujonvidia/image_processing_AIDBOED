function [h_new,h_new2]=rnn(input)
% reading image
t=imread(input);

% image converted to double for calculattion...
h=im2double(t);
h=imnoise(h,'salt & pepper',0.01);

[m n l]=size(h);

% showing converted image..
imshow(h);
a_x(7)=0;
a_y(7)=0;

% decleare of new image for storing output image..
h_new = h;
h_new2 = h;

%% main for loop 
for x = 2:m-1 
    for y = 2:n-1

% calculation for center of spahere using nearest nearest neighbours...               
              value_1=0;
              value_2=0;
              value_3=0;         
              p_x = x;
              p_y = y;
              count = 1;
             r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end        
              f_nx = cand_x;   % first nearest neighbour for final calculation 
              f_ny = cand_y;   % first nearest neighbour for final calculation 
              count=count+1;                        
              a_x( count ) = cand_x;
              a_y( count ) = cand_y;
              distance_1=dist_cand;
              p_x = cand_x;
              p_y = cand_y;
              
              if (p_x~=1 && p_y~=1)&&(p_x~=m && p_y~=n)
                  r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end
                  distance_2=dist_cand;
                  p_x = cand_x;
                  p_y = cand_y;
                  
                  
             if( (distance_2 < distance_1) && (p_x~=1 && p_y~=1)&&(p_x~=m && p_y~=n) )
                      r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end
                      count=count+1;                 
                      a_x( count ) = p_x;
                      a_y( count ) = p_y;
                      distance_3=dist_cand;
                      p_x = cand_x;
                      p_y = cand_y;
                      
                      
                      
                      f_nx = cand_x;   % first nearest neighbour for final calculation 
                     f_ny = cand_y;   % first nearest neighbour for final calculation 
    
                     
                     
                     
             if( (distance_3 < distance_2) && (p_x~=1 && p_y~=1)&&(p_x~=m && p_y~=n) )
                          r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end
                          count=count+1;                    
                          a_x( count ) = p_x;
                          a_y( count ) = p_y;
                          distance_4=dist_cand;
                          p_x = cand_x;
                          p_y = cand_y;
 
             if( (distance_4 < distance_3) && (p_x~=1 && p_y~=1)&&(p_x~=m && p_y~=n) )
                              r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end
                              count=count+1;
                              a_x( count ) = p_x;
                              a_y( count ) = p_y;
                              distance_5=dist_cand;
                              p_x = cand_x;
                              p_y = cand_y;
                              
             if( (distance_5 < distance_4) && (p_x~=1 && p_y~=1)&&(p_x~=m && p_y~=n) )
                                  r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end
                                  count=count+1;                        
                                  a_x( count ) = p_x;
                                  a_y( count ) = p_y;
                                  distance_6=dist_cand;
                                  p_x = cand_x;
                                  p_y = cand_y;
 
             if( (distance_6 < distance_5) && (p_x~=1 && p_y~=1)&&(p_x~=m && p_y~=n) )
                                      r=1;
dist_cand=1; 
 
for i= -r:r
    for j= -r:r
        
       if ((i~=0) || (j~=0))
            r_dif = (h(p_x+i,p_y+j,1)-h(p_x,p_y,1));
            g_dif = (h(p_x+i,p_y+j,2)-h(p_x,p_y,2));
            b_dif = (h(p_x+i,p_y+j,3)-h(p_x,p_y,3));
            
            dist = (r_dif * r_dif) + (g_dif * g_dif)+ ( b_dif * b_dif);
            
            if( dist < dist_cand )
                dist_cand = dist;
                cand_x = p_x+i;
                cand_y = p_y+j;
            end
        end
    end
end
                                      count=count+1;
                                      a_x( count ) = p_x;
                                      a_y( count ) = p_y;
                                  end
                              end
                          end
                      end
                  end
              end                 
              % x2,y2,z2 are center of sphere        
              % f_nx, f_ny are first nearest neighbour 
              for ii=2:count
                  value_1 = value_1 + h ( a_x(ii) , a_y(ii) , 1 ) / ( count   ) ;
                  value_2 = value_2 + h ( a_x(ii) , a_y(ii) , 2 ) / ( count   ) ;
                  value_3 = value_3 + h ( a_x(ii) , a_y(ii) , 3 ) / ( count   ) ;
              end
              x2 = value_1;
              y2 = value_2;
              z2 = value_3;

              % below x1,y1,z1 are selected pixel value of image
              x1 = h(x,y,1);
              y1 = h(x,y,2);
              z1 = h(x,y,3);

 % calculation of distance from selected pixel to the calculated center.....
              r_dif = x1 - x2 ;
              g_dif = y1 - y2 ;
              b_dif = z1 - z2 ;            
              dist_center = sqrt ((r_dif * r_dif) + (g_dif * g_dif)+ (b_dif * b_dif));

 % calculation of distance from the calculated center to first nearest neighbour.....
              r_dif = x2-h(f_nx , f_ny , 1) ;
              g_dif = y2-h(f_nx , f_ny , 2) ;
              b_dif = z2-h(f_nx , f_ny , 3) ;            
           dist_neighbour = sqrt ((r_dif * r_dif) + (g_dif * g_dif)+ (b_dif * b_dif));
              r = dist_center - dist_neighbour;

                % putting value into image h_new...            
                if( (r > 0) )
                
                            f_dist = ( (dist_center - dist_neighbour) / dist_center ); 
                
                            h_new(x,y,1) = x1 + ( x2-x1 ) * f_dist ;
                            h_new(x,y,2) = y1 + ( y2-y1 ) * f_dist ; 
                            h_new(x,y,3) = z1 + ( z2-z1 ) * f_dist ;

                            h_new2(x,y,1) =  1   ;
                            h_new2(x,y,2) =  0   ;
                            h_new2(x,y,3) =  0   ;
                                
                   
                end
    end
end
% showing and saving the output image... 
figure,imshow(h_new2);
imwrite(h_new2,'Pixels_for_processing.jpg');
 
figure,imshow(h_new);
imwrite(h_new,'After_processing_R.jpg');
 


