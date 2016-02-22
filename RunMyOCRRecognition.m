%% If no input is provided, it runs by default on test2.bmp and its corresponding label that was designed by hand.
function[perte,pertr,perte_knn,labelte] =RunMyOCRRecognition(testimage,locations, classes)
if nargin<1
load locations;
locations=locations1;
classes=classes1;
addpath(genpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1'));
testimage=imread('test1.bmp');
end

addpath(genpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1'));
[perte,pertr,perte_knn,labelte]=OCR_Extract_Features(testimage,locations,classes);
end
