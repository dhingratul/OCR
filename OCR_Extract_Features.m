%% Extracts OCR Features from Image
% Function to extract OCR Features
% Input: Image, locations, classes
% Output: Testing, training accuracy
% Note: Call from RunMyOCRRecognition.m

function[perte,pertr,label_conf]=OCR_Extract_Features(im,locations,classes)
load data4;
fea=[];count=0;
thr=200;i=0;

% srcFiles = dir('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1/Code/H1-16images/*.bmp');
%     for i=1:length(srcFiles)
%         filename = strcat('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1/Code/H1-16images/',srcFiles(i).name);
%         im =imread(filename);
%         [C]=strsplit(srcFiles(i).name,'.');
%         label=double(C{1,1})-96;

%%

im2=im; imd=uint8(im<thr);
se = strel('disk',1,4);
im2d=imdilate(imd,se);
se = strel('disk',1,4);
im2=imerode(im2d,se);

L=bwlabel(im2);
[temp,cim,labelte,L,im2]=BoundingBox(L,im2,0,50,5,5,10,85,8,locations,classes);
if(i==1)
    fea=temp;
    %             labeltr(1:size(temp,1),:)=label;
    
else
    fea=[fea;temp];
    %  %% Automatic Labelling Data for training images
    %         for k=length(labeltr)+1:length(labeltr)+size(temp,1)
    %             labeltr(k,1)=label;
    %         end
    %         temp=0;
end
%     end
%% Normalization of features
load data4 mu sigma
for k=1:size(fea,2)
    %     mu(1,k)=mean(fea(:,k));
    %     sigma(1,k)=var(fea(:,k));
    fea(:,k)=(fea(:,k)-mu(1,k))/sigma(1,k);
end
% fea=normc(fea);


%% Confusion Matrix Calculation- Training
d=dist2(train,train);
[D_sorted, D_index]=sort(d,1);
label_new=D_index(2,:)';

for i=1:size(D_index,2)
    label_conf(i,1)=labeltr(label_new(i));
end

%% Percentage accuracy - Training
for i=1:size(D_index,2)
    if(label_conf(i)==labeltr(i))
        count=count+1;
    end
end
pertr=count/size(D_index,2)*100
count=0;
d=0;
%% Confusion Matrix Calculation-Recognition
d=dist2(train,fea);
[D_sorted, D_index]=sort(d,1);
label_new=D_index(1,:)';

for i=1:size(D_index,2)
    label_conf(i,1)=labeltr(label_new(i));
end

%% Percentage accuracy - Recognition
for i=1:length(labelte)
    if(label_conf(i)==labelte(i))
        count=count+1;
    end
end
perte=count/size(D_index,2)*100;

% print_Te(L,im2,label_conf,labelte,50,5,5,10,85,8);

end
