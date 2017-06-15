%% Returns testlabels based on locations and classes
function [labelte]=classlabels(locations,classes,centroid)

for i=1:length(classes)
    residual(i,1)=centroid(1)-locations(i,1);
    residual(i,2)=centroid(2)-locations(i,2);
end
idx2 = knnsearch(residual(:,2),0);
idx1 = knnsearch(residual(:,1),0);
labelte=classes(idx2);

end