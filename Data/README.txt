This directory contains data tables as well as stimuli for the experiments in our paper.

MonteCarloPoints.pde is a Processing 3.2.1 sketch we used for generating stimuli for this experiment. As the procedure relies on randomness we assign residuals, stimuli will not be identical from run to run, but will embody the required factor levels. MonteCarloPoints requires the apache math commons 3 library.

exp1.csv, exp2.csv, and exp3.csv correspond to the data from the three experiments presented in the paper. We anonymized the data by replacing the Mechanical Turk WorkerID with an integer. We collected demographics information from participants after they completed the main experimental task. This data is stored in demographics.csv.

Column Key for exp1.csv, exp2.csv, exp3.csv:

Unless otherwise noted, parameters values assume a data range of [0,1] in x. To convert to pixel space, multiply by 600.

sigma: bandwidth of the Gaussian used to generate residuals {0.05,0.1,0.15,0.2}
sign: sign of the slope of the OLS trend line {-1,1}
type: type of fit {line,trig,quad}
m: slope of OLS trend line (or curvature of quad trend, or amplitude of trig trend) {0.1,0.2,0.4,0.8}
src: the file path of the actual stimulus image.
isValidation: should be null or false: validation images (where the trend was explicitly provided) are excluded from this dataset.
id: participant id, a per-experiment anonymized integer representing the order they submitted the HIT. 
graphtype: the type of visualization {line,scatter,area}
answer: the user submitted trend. For experiments 1 and 3, this is the slope, in the range [-1,1], with slider increments of 0.01. For experiment 2, it is the intercept, in the range [-0.25,0.25], with increments of 0.005.
error: for experiments 1 and 3, m*sign-answer. for experiment 2, offset-answer.
unsignedError: |error|
index: the presentation order of the stimulus.
offset: in experiment 2, the uniform translation of the points away from the center. in the range [-0.25,0.25]
outlierLoc: in experiment 3, the location of the extreme points, either at the beginning “b”, first third “m”, or end “e” of the series.
outlierNum: the number of points in the outlier location replaced with extreme values, {0,5,10,15}
ix, iy: in experiment 3, the x and y coordinates of the intersection between the robust line (the linear least squares fit of the points, excluding the outliers) and the non-robust OLS line (the linear least squares fit with outliers included). If there are no outliers, these are 0.
actualm: in experiment 3, the slope of the non-robust OLS line
actualb: in experiment 3, the y intercept of the non-robust OLS line
errorActual: actualm - answer
unsignedErrorActual: |errorActual|


The stimuli folder contains zip files of the stimuli we used in each of our three experiments. Not every stimulus contained in these folders was used in our experiments.

The file path of the image contains its metadata:

The level subfolder is one of {line,quad,trig}, indicating the type of fit.
The next level is one of {area,line,scatter}, indicating the type of plot. The optional “trend” at the end of the directory name indicates the presence or absence of trend lines. Stimuli with visible trend lines were used as engagement checks.

The filename of the image contains:
S[a floating point number]: the bandwidth of the residuals.
m[a floating point number]: the slope/signed amplitude of the trend line.

Experiment three introduces ambiguity in the trend line, with the presence of outliers. The values indicated by the m parameter refer to the robust OLS trend line (that is, the one where outliers are not considered). There is an additional segment to the file name of images in Exp3:

o + {b,m,e}[an integer]: The position (Beginning, Middle, or End of the time series), and number of outliers.

Additionally, experiment three contains a csv with information about each dataset:
Column key for Exp3/metadata.csv:

Unless otherwise noted, parameters values assume a data range of [0,1] in x. To convert to pixel space, multiply by 600.

id: the file name of the stimulus image.
o: the number of outliers:
ol: the location of these outliers, in the beginning, first third, or end of the time series {b,m,e}
ix: the x coordinate of the intersection between the robust and non-robust (outlier-sensitive) lines of best fit.
iy: the y coordinate of the intersection between the robust and non-robust line of best fit.
six: ix, in pixel space coordinates
siy: iy, in pixel space coordinates
actualm: the slope of the non-robust line of best fit.
actualb: the intercept of the non-robust line of best fit.