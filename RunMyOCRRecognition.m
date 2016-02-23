%% If no input is provided, it runs by default on test1.bmp and its corresponding label that was designed by hand.
function[perte,pertr] =RunMyOCRRecognition(testimage,locations, classes)
clear all;close all;clc;
if nargin<1
load locations;
locations=locations1;
classes=classes1;
addpath(genpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1'));
testimage=imread('test1.bmp');
end
%% Add path to where the source code for moments is located
addpath(genpath('/home/dhingratul/Dropbox/Academics/Spring2016/CS-534/HW/HW1'));
[perte,pertr]=OCR_Extract_Features(testimage,locations,classes);
end
