
This supplemental material is for review purposes only. “Living” versions of the experiments discussed in this paper, along with all stimuli, anonymous data, and analyses, are available in a github repository that we have excluded for reasons of anonymity. We did not include all experimental stimuli for reasons of space (the stimuli for experiment 1, for instance, require 84 MB of space). We have provided several sets of example stimuli in the paper proper, and include code for generating similar stimuli.

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
