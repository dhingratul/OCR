% L is the connected components obtained from L=bwlabel(im2), where im2 is
% binarized
function [Features,cim]=BoundingBox(L,im2,disp_on_off,AR_threshold,...
    R_Size,C_Size,AR,Pixel_No,Neighborhood)%,locations, classes)
Features=[];labelte=[];
Nc=max(max(L));
% figure
imagesc(L)
hold on;
im2=padarray(im2, [1 1], 0, 'both');
for i=1:Nc;
[r,c]=find(L==i);
[maxr]=max(r);
[minr]=min(r);
[maxc]=max(c);
[minc]=min(c);
if(minr~=maxr && minc~=maxc && abs((maxr-minr)-(maxc-minc))<AR_threshold && abs((maxr-minr)>R_Size) && abs((maxc-minc)>C_Size)&& abs((maxr-minr)/(maxc-minc))<AR )
cim = im2((minr+1)-1:(maxr+1)+1,(minc+1)-1:(maxc+1)+1);
if(sum(cim(:))>Pixel_No)
rectangle('Position',[minc,minr,maxc-minc+1,maxr-minr+1], 'EdgeColor','w');
% %% LabelTe
% centroid_bb=[(minc+(maxc-minc)/2),(minr+(maxr-minr)/2)];
% temp=classlabels(locations,classes,centroid_bb);
% labelte=[labelte;temp];
%% Features
[centroid, theta, roundness, inmo] = moments(cim, disp_on_off);
area=sum(cim(:));
cim=imresize(cim,[28,28]);
H=hough(cim);
peaks=houghpeaks(H);
hogfeature = extractHOGFeatures(cim);
[A,D] = dwt(double(cim),'sym4');
% perimeter=bwperim(cim,Neighborhood); perimeter=sum(perimeter(:));
rproject=sum(double(cim),1);
cproject=sum(double(cim),2);
transform=fft(hogfeature);
[A1,D1]=dwt(hogfeature,'sym4');
stats = regionprops(cim,'all');
rmv = bwmorph(cim,'remove');
skeleton=bwmorph(rmv,'skel',Inf); skeleton=sum(skeleton(:));
Features=[Features;theta,roundness,inmo,area,centroid,...
stats.Area,stats.MajorAxisLength,stats.MinorAxisLength,...
stats.Orientation,stats.EulerNumber,stats.EquivDiameter,...
stats.Solidity,stats.Extent,rproject,cproject',transform(1:20),peaks, A',D',A1,D1];
end
end
end
hold off
end