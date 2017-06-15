%% Driver file to Run OCR Recogniton
% If no input is provided, it runs by default on test2.bmp and its 
% corresponding label from locations, classes vectors

function[perte,pertr,outlabelte] =RunMyOCRRecognition(testimage,locations, classes)
%% Add path to where the source code for moments is located
if nargin<1
    addpath(genpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1'));
    load locations2;
    im=imread('test2.bmp');
    locations=locations2;
    classes=classes2;
end
[perte,pertr,outlabelte]=OCR_Extract_Features(testimage,locations,classes);
end
