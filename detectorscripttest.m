%Trains a CascadeObjectDetector to recognize face, with ideally a strong
%true positive rate and a minimal (although not necessarily nonexistent)
%false positive rate.

%NOTE: In the interest of the privacy of people involved in this project,
%the folder of positive pictures has not been provided with this code.
%A new one must be created using the trainingImageLabeler tool, by running "trainingImageLabeler" in the command line.
%The results of the learning session must be saved as the file
%positiveInstances.mat

%Load the positive samples
load('positiveInstances.mat')
imDir = fullfile(pwd,'PositivePicsCS177');
addpath(imDir);
    
negativeFolder = fullfile(pwd,'NegativePicsCS177');

%Ensure that exported ROI file is named positiveInstances


disp('Begin Training...')
trainCascadeObjectDetector('faceDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.035,'NumCascadeStages',6);

%test file for face detector training
img = imread('Week1Photos/IMG_1339.jpg');
disp('Running Custom Trained Detector...')
faceDetector = vision.CascadeObjectDetector('faceDetector.xml');
disp('Detector Loaded...')
bboxes = step(faceDetector, img);
disp('Trained Detector Done')

annotatedimg3 = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');
figure;
imshow(annotatedimg3); 
title('Detected Faces: Trained Detector');