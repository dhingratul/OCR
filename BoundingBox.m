% L is the connected components obtained from L=bwlabel(im2), where im2 is
% binarized
function [Features,cim]=BoundingBox(L,im2,disp_on_off,AR_threshold,R_Size,C_Size,AR,Pixel_No, Neighborhood)
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
if(minr~=maxr && minc~=maxc && abs((maxr-minr)-(maxc-minc))<AR_threshold && abs((maxr-minr)>R_Size) && abs((maxc-minc)>C_Size)&& abs((maxr-minr)/(maxc-minc))<AR )
cim = im2((minr+1)-1:(maxr+1)+1,(minc+1)-1:(maxc+1)+1);
if(sum(cim(:))>Pixel_No)
rectangle('Position',[minc,minr,maxc-minc+1,maxr-minr+1], 'EdgeColor','w');
[centroid, theta, roundness, inmo] = moments(cim, disp_on_off);
area=sum(cim(:));
% hogfeature = extractHOGFeatures(cim)
% perimeter=bwperim(cim,Neighborhood); perimeter=sum(perimeter(:))
stats = regionprops(cim,'all');
rmv = bwmorph(cim,'remove');
skeleton=bwmorph(rmv,'skel',Inf); skeleton=sum(skeleton(:));
Features=[Features;theta,roundness,inmo,area,centroid,...
stats.Area,stats.MajorAxisLength,stats.MinorAxisLength,...
stats.Orientation,stats.EulerNumber,stats.EquivDiameter,...
stats.Solidity,stats.Extent];
end
end
end
hold off
end