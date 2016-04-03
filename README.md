# MatlabPortfolio
Some example programs written in Matlab:
applyfilters.m - Uses avgfilter.m and medianfilter.m to apply an average filter and a median filter of a specified x by y mask size. The image is first corrupted (using noise.m) by a specified percentage amount.

avgfilter.m - Applies an average filter to an image of a specified x by y mask size

medianfilter.m - Applies a median filter to an image of a specified x by y mask size

noise.m - Applies black and white "visual noise" to the image. The percentage of the image covered in noise is specified by the second parameter.

makehisteq.m - Performs histogram equalization on an inputted image.

detectorscripttest.m - Trains a cascadeobjectdetector to detect faces, preferably in a classroom. Does not include a full folder of positive examples or a positiveInstaces variable. These must be created using the trainingImageLabeler tool. A premade faceDetector.xml has been provided though, and can be used instead of a freshly trained face detector by pressing 2 when prompted.

