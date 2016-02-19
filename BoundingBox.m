% L is the connected components obtained from L=bwlabel(im2), where im2 is
% binarized
function [Features]=BoundingBox(L,im2,disp_on_off,AR_threshold)
Features=[];
Nc=max(max(L));
% figure
imagesc(L)
hold on;
im2=padarray(im2, [1 1], 0, 'both');
for i=1:Nc;
[r,c]=find(L==i);
maxr=max(r);
minr=min(r);
maxc=max(c);
minc=min(c);
if(minr~=maxr && minc~=maxc && (maxr-minr)-(maxc-minc)<AR_threshold)
rectangle('Position',[minc,minr,maxc-minc+1,maxr-minr+1], 'EdgeColor','w');
cim = im2((minr+1)-1:(maxr+1)+1,(minc+1)-1:(maxc+1)+1);
[centroid, theta, roundness, inmo] = moments(cim, disp_on_off);
Features=[Features;theta,roundness,inmo];
end
end
hold off
end