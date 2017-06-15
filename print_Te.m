%% Prints text based on OCR information from Running OCR_Extract_Features.m
function []=print_Te(L,im2,label_conf,labelte,AR_threshold, R_Size,C_Size,AR,Pixel_No,Neighborhood)
Nc=max(max(L));
% figure
imagesc(L)
hold on;
im2=padarray(im2, [1 1], 0, 'both');
for i=1:Nc
    [r,c]=find(L==i);
    [maxr]=max(r);
    [minr]=min(r);
    [maxc]=max(c);
    [minc]=min(c);
    if(minr~=maxr && minc~=maxc && abs((maxr-minr)-(maxc-minc))<AR_threshold && abs((maxr-minr)>R_Size) && abs((maxc-minc)>C_Size)&& abs((maxr-minr)/(maxc-minc))<AR )
        cim = im2((minr+1)-1:(maxr+1)+1,(minc+1)-1:(maxc+1)+1);
        if(sum(cim(:))>Pixel_No)
            rectangle('Position',[minc,minr,maxc-minc+1,maxr-minr+1], 'EdgeColor','w');
            outtext=printlabels(label_conf(i));
            text(minc,maxr,outtext,'Color',[1 0 0],'FontSize',10);
            outtext=printlabels(labelte(i));
            text(minc,minr,outtext,'Color',[1 0 0],'FontSize',10);
            
        end
    end
end
