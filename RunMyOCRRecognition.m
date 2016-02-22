%% If no input is provided, it runs by default on test2.bmp and its corresponding label that was designed by hand.
% function RunMyOCRRecognition(testimage)

OCR_Extract_Features()
%% Percentage accuracy - Recognition-KNN
mdl = fitcknn(train,labeltr);
label_conf = predict(mdl,fea);
for i=1:length(label)
if(label_conf(i)==label(i))
count=count+1;
end
end
perte_knn=count/size(D_index,2)*100

% end
