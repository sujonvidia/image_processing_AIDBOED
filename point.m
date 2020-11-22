function [ output_args ] = point( in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


r=imread(in);
f=im2bw(r);


w=[-1 -1 -1;-1 8 -1;-1 -1 -1];
g=abs(imfilter((f),w));
t=max(g(:));
g=g>=t;

imshow(r);
figure,imshow(g)


end

