import org.apache.commons.math3.fitting.*;
import org.apache.commons.math3.distribution.NormalDistribution;
import java.util.Comparator;
import java.util.Arrays;

//mark size
float mr = 5;

//where to put the stimuli
String dirname;

void setup() {
  size(300, 525);
  pixelDensity(displayDensity());
  experimentOne();
  experimentTwo();
  experimentThree();
  exit();
}

void experimentOne() {
  dirname = "Exp1/";
  float[][] points;
  float[] fit;
  float[] residuals;
  float[] bestResiduals;
  float[][] tempPoints;
  float merror;
  float bestmerror;


  for (float i = 0.00; i<=0.25; i=round((i+0.05)*1000)/1000.0) {
    for (float j = -1; j<=1; j=round((j+0.1)*1000)/1000.0) {   
      if (j!=0 && round(j*1000)!=0) {
        bestmerror = 2;
        residuals = genResiduals(100, i);
        bestResiduals = permute(residuals);
        points = genPoints(100, 1.0, j);
        points = zoom(points);
        tempPoints = genPoints(100, 1.0, j);
        for (int k = 0; k<100; k++) {
          tempPoints = deepCopy(points);
          fit = fit(points);
          residuals = permute(residuals);
          tempPoints = addResiduals(tempPoints, fit, residuals);
          fit = fit(tempPoints);
          merror = abs(j-fit[0]);
          if ((merror<bestmerror)||k==0) {
            bestResiduals = residuals;
            bestmerror = merror;
          }
        }


        fit = fit(points);
        tempPoints = addResiduals(points, bestResiduals, j, 'l');
        fit = fit(points);
        merror = abs(j-fit[0]);

        System.err.println("S,m: ("+i+","+j+")");
        System.err.print("    ");
        System.err.println("error(m): "+merror);
        drawPoints(tempPoints);
        save(dirname+"line/scatter/S"+i+"m"+j+".png");
        drawTrend(j);
        save(dirname+"line/scattertrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 't');
        drawPoints(tempPoints);
        save(dirname+"trig/scatter/S"+i+"m"+j+".png");
        drawTTrend(j);
        save(dirname+"trig/scattertrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 'q');
        drawPoints(tempPoints);
        save(dirname+"quad/scatter/S"+i+"m"+j+".png");
        drawQTrend(j);
        save(dirname+"quad/scattertrend/S"+i+"m"+j+".png");
      }
    }
  }
}

void experimentTwo() {
  dirname = "Area/";
  float[][] points;
  float[] fit;
  float[] residuals;
  float[] bestResiduals;
  float[][] tempPoints;
  float merror;
  float bestmerror;


  for (float i = 0.00; i<=0.25; i=round((i+0.05)*1000)/1000.0) {
    for (float j = -1; j<=1; j=round((j+0.1)*1000)/1000.0) {   
      if (j!=0 && round(j*1000)!=0) {
        bestmerror = 2;
        residuals = genResiduals(100, i);
        bestResiduals = permute(residuals);
        points = genPoints(100, 1.0, j, true);
        points = zoom(points);
        tempPoints = genPoints(100, 1.0, j, true);
        for (int k = 0; k<100; k++) {
          tempPoints = deepCopy(points);
          fit = fit(points);
          residuals = permute(residuals);
          tempPoints = addResiduals(tempPoints, fit, residuals);
          fit = fit(tempPoints);
          merror = abs(j-fit[0]);
          if ((merror<bestmerror)||k==0) {
            bestResiduals = residuals;
            bestmerror = merror;
          }
        }


        fit = fit(points);
        tempPoints = addResiduals(points, bestResiduals, j, 'l');
        fit = fit(points);
        merror = abs(j-fit[0]);

        System.err.println("S,m: ("+i+","+j+")");
        System.err.print("    ");
        System.err.println("error(m): "+merror);
        drawPointsArea(tempPoints);
        save(dirname+"line/area/S"+i+"m"+j+".png");
        drawTrend(j);
        save(dirname+"line/areatrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 't');
        drawPointsArea(tempPoints);
        save(dirname+"trig/area/S"+i+"m"+j+".png");
        drawTTrend(j);
        save(dirname+"trig/areatrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 'q');
        drawPointsArea(tempPoints);
        save(dirname+"quad/area/S"+i+"m"+j+".png");
        drawQTrend(j);
        save(dirname+"quad/areatrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 'l');
        drawPointsLine(tempPoints);
        save(dirname+"line/line/S"+i+"m"+j+".png");
        drawTrend(j);
        save(dirname+"line/linetrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 't');
        drawPointsLine(tempPoints);
        save(dirname+"trig/line/S"+i+"m"+j+".png");
        drawTTrend(j);
        save(dirname+"trig/linetrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 'q');
        drawPointsLine(tempPoints);
        save(dirname+"quad/line/S"+i+"m"+j+".png");
        drawQTrend(j);
        save(dirname+"quad/linetrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 'l');
        drawPoints(tempPoints);
        save(dirname+"line/scatter/S"+i+"m"+j+".png");
        drawTrend(j);
        save(dirname+"line/scattertrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 't');
        drawPoints(tempPoints);
        save(dirname+"trig/scatter/S"+i+"m"+j+".png");
        drawTTrend(j);
        save(dirname+"trig/scattertrend/S"+i+"m"+j+".png");

        tempPoints = addResiduals(points, bestResiduals, j, 'q');
        drawPoints(tempPoints);
        save(dirname+"quad/scatter/S"+i+"m"+j+".png");
        drawQTrend(j);
        save(dirname+"quad/scattertrend/S"+i+"m"+j+".png");
      }
    }
  }
}

void experimentThree() {
  dirname = "Outliers/";
  float[][] points;
  float[] fit;
  float[] residuals;
  float[] bestResiduals;
  float[][] tempPoints;
  float merror;
  float bestmerror;

  char[] locations = {'b', 'm', 'e'};
  int[] outliers = {0, 5, 10, 15};
  Table metadata = new Table();
  metadata.addColumn("id");
  metadata.addColumn("o");
  metadata.addColumn("ol");
  metadata.addColumn("ix");
  metadata.addColumn("iy");
  metadata.addColumn("six");
  metadata.addColumn("siy");
  metadata.addColumn("actualm");
  metadata.addColumn("actualb");
  
  for (float i = 0.00; i<=0.25; i=round((i+0.05)*1000)/1000.0) {
    for (float j = -1; j<=1; j=round((j+0.1)*1000)/1000.0) {
      for (int k = 0; k<locations.length; k++) {
        for (int l = 0; l<outliers.length; l++) {
          if (j!=0 && round(j*1000)!=0) {
            bestmerror = 2;
            residuals = genResiduals(100, i);
            bestResiduals = permute(residuals);
            points = genPoints(100, 1.0, j, true);
            points = zoom(points);
            tempPoints = genPoints(100, 1.0, j, true);
            for (int m = 0; m<100; m++) {
              tempPoints = deepCopy(points);
              fit = fit(points);
              residuals = permute(residuals);
              tempPoints = addResiduals(tempPoints, fit, residuals);
              fit = fit(tempPoints);
              merror = abs(j-fit[0]);
              if ((merror<bestmerror)||m==0) {
                bestResiduals = residuals;
                bestmerror = merror;
              }
            }
            int start = 0;
            int sign = 1;
            switch(locations[k]){
              case 'b':
              start = 0;
              sign = j<0 ? -1 : 1;
              break;
              
              case 'm':
              start = 33 - ceil(outliers[l]/2.0);
              sign = j<0 ? -1 : 1;
              break;
              
              default:
              case 'e':
              start = 100-outliers[l];
              sign = j<0 ? 1 : -1;
            }
            fit = fit(points);
            tempPoints = addResiduals(points, bestResiduals, j, 'l');
            tempPoints = addOutliers(tempPoints, start, outliers[l], sign);
            fit = fit(points);
            merror = abs(j-fit[0]);
        
            System.err.println("S,m: ("+i+","+j+") + outlier position:"+start);
            System.err.print("    ");
            System.err.println("error(m): "+merror);
            drawPoints(tempPoints);
            save(dirname+"line/scatter/S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
            drawTrend(j);
            drawTrend(fit(tempPoints));
            save(dirname+"line/scattertrend/S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
            
            drawPointsLine(tempPoints);
            save(dirname+"line/line/S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
            drawTrend(j);
            save(dirname+"line/linetrend/S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
            
            drawPointsArea(tempPoints);
            save(dirname+"line/area/S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
            drawTrend(j);
            save(dirname+"line/areatrend/S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
            
            
            if(outliers[l]>0){
              float[] actual = fit(tempPoints);
              float[] intercept = intersect(fit, actual);
              drawTrend(fit(tempPoints));
              TableRow row = metadata.addRow();
              row.setString("id","S"+i+"m"+j+"o"+locations[k]+outliers[l]+".png");
              row.setInt("o",outliers[l]);
              row.setString("ol",locations[k]+"");
              row.setFloat("ix",intercept[0]);
              row.setFloat("iy",intercept[1]);
              row.setFloat("six",toScreenX(intercept[0]));
              row.setFloat("siy",toScreenY(intercept[1]));
              row.setFloat("actualm",actual[0]);
              row.setFloat("actualb",actual[1]); 
            } 
          }
        }
      }
    }
  }
  saveTable(metadata,dirname+"metadata.csv");
}


float adjustY(float x, float y, float lambda) {
  return (lambda * x + (1-lambda) * y) / sqrt(sq(lambda) + sq(1-lambda));
}

float lambda(float r, float rz) {
  //Harrison et al 2014
  float a = (2 * sq(r) - 2 * sq(r)*rz - 1 + 2 * rz - sq(rz) );
  float b = (-2 * sq(r) + 2 * sq(r)*rz - 2*rz + 2*sq(rz));
  float c = (sq(r) - sq(rz));
  return (-1*b - sqrt(sq(b)-4*a*c))/(2*a);
}

float[][] genPoints(int n, float r, float m) {
  return genPoints(n, r, m, false);
}

float[][] genPoints(int n, float r, float m, boolean regularX) {
  float x;
  float y;

  float[][] points = new float[n][2];
  float[] G;
  //Make sure we have at least some points in each binned horizontal region
  int bins = 10;
  int perBin = (int) floor(n/bins);
  if (!regularX) {
    for (int i = 0; i<bins; i++) {
      for (int j = 0; j<perBin; j++) {
        G = rand2G(0.5, 0.2);
        x = random( float(i)/float(bins), float(i+1)/float(bins));
        // Could also have gaussian "football" plots, if needed
        //x = G[0];
        y = G[1];
        points[i*perBin + j] = new float[]{x, y};
      }
    }
  } else {
    float delta = 1.0/float(n);
    float curx = 0;
    for (int i = 0; i<n; i++) {
      G = rand2G(0.5, 0.2);
      x = curx;
      y = G[1];
      points[i] = new float[]{x, y};
      curx+=delta;
    }
  }

  //Make the remaining points
  for (int i = bins*perBin; i<n; i++) {
    G = rand2G(0.5, 0.2);
    x = random(1);
    //x = G[0];
    y = G[1];
    points[i] = new float[]{x, y};
  }

  //Standardize
  points = standardize(points);

  //Correlate the points
  float lambda = lambda(r, r(points));
  for (float[] point : points) {
    point[1] = adjustY(point[0], point[1], lambda);
  }

  //Add slope
  points = retarget(points, m);

  //Zoom out so points fit in [0,1]
  //points = zoom(points);

  return points;
}

/****************
 * Point Drawing *
 *****************/

void draw() {
}

float toScreenX(float dataX) {
  return map(dataX, 0, 1, (2*mr), width-(2*mr));
}

float toScreenY(float dataY) {
  return map(dataY, 0, 1, height-(2*mr)-112.5, (2*mr)+112.5);
}

float toDataY(float screenY) {
  return map(screenY, height-(2*mr)-112.5, (2*mr)+112.5, 0, 1);
}

void drawPoints(float[][] values) {
  background(255);
  noStroke();
  color fillC = color(0);
  fill(fillC, 128);
  for (float[] point : values) {
    ellipse(toScreenX(point[0]), toScreenY(point[1]), mr, mr);
  }
}

void drawPointsArea(float[][] values) {
  sortX(values);
  background(255);
  color fillC = color(0);
  stroke(fillC, 128);
  fill(fillC, 64);
  beginShape();
  vertex(toScreenX(0), height);
  vertex(toScreenX(0), toScreenY(values[0][1]));
  for (int i =0; i<values.length; i++) {
    vertex(toScreenX(values[i][0]), toScreenY(values[i][1]));
  }
  vertex(toScreenX(1), toScreenY(values[values.length-1][1]));
  vertex(toScreenX(1), height);
  endShape(CLOSE);
}

void drawPointsLine(float[][] values) {
  sortX(values);
  background(255);
  color fillC = color(0);
  stroke(fillC, 128);
  fill(fillC, 0);
  for (int i =0; i<values.length-1; i++) {
    line(toScreenX(values[i][0]), toScreenY(values[i][1]), toScreenX(values[i+1][0]), toScreenY(values[i+1][1]));
  }
}

void drawPointsBar(float[][] values) {
  sortX(values);
  background(255);
  color fillC = color(0);
  fill(fillC, 64);
  noStroke();
  float dx = 1.0/float(values.length);
  rectMode(CORNERS);
  for (int i =0; i<values.length; i++) {
    rect(toScreenX(values[i][0]), height, toScreenX(values[i][0]+dx), toScreenY(values[i][1]));
  }
}

void drawTrend(float m) {
  float b = map(m, -1, 1, 1, 0);
  drawTrend(new float[]{m, b});
}

void drawTTrend(float m) {
  float resolution = 100;
  float X1;
  float Y1;
  float X2;
  float Y2;
  stroke(0);
  strokeWeight(2);
  for (int i = 0; i<resolution-1; i++) {
    X1 = map(i, 0, resolution, 0, PI);
    Y1 = map(-1 * m * cos(X1), -1, 1, 0, 1);
    X2 = map(i+1, 0, resolution, 0, PI);
    Y2 = map(-1 * m * cos(X2), -1, 1, 0, 1);
    line(toScreenX(i/resolution), toScreenY(Y1), toScreenX((i+1)/resolution), toScreenY(Y2));
  }
}

void drawQTrend(float m) {
  float b = map(m, -1, 1, 1, 0);
  float resolution = 100;
  float X1;
  float Y1;
  float X2;
  float Y2;
  stroke(0);
  strokeWeight(2);
  for (int i = 0; i<resolution; i++) {
    X1 = map(i, 0, resolution, 0, 1);
    Y1 = m*sq(X1)+b;
    X2 = map(i+1, 0, resolution, 0, 1);
    Y2 = m*sq(X2)+b;
    line(toScreenX(i/resolution), toScreenY(Y1), toScreenX((i+1)/resolution), toScreenY(Y2));
  }
}

void drawTrend(float[] fit) {
  stroke(0);
  strokeWeight(2);
  line(toScreenX(0), toScreenY(fit[1]), toScreenX(1), toScreenY(fit[0]+fit[1]));
}

/**************
 * Adjustments *
 ***************/

float[][] standardize(float[][] points) {
  //Standardize so mean = 0, sd = 1

  float mx = meanX(points);
  float my = meanY(points);
  float sx = stddevX(points);
  float sy = stddevY(points);

  for (float[] point : points) {
    point[0] = (point[0]-mx)/sx;
    point[1] = (point[1]-my)/sy;
  }
  return points;
}

float[][] standardizeY(float[][] points, float nmx, float nsy) {
  float my = meanY(points);
  float sy = stddevY(points);
  for (float[] point : points) {
    point[1] = (point[1]-my)/sy;
    point[1] = (point[1]+nmx)*nsy;
  }
  return points;
}

float[][] renormalize(float[][] points) {
  //Renormalize points to be in 0,1

  float[] mins = {min(0, minX(points)), min(0, minY(points))};
  float[] maxs = {max(1, maxX(points)), max(1, maxY(points))};
  for (float[] point : points) {
    point[0] = map(point[0], mins[0], maxs[0], 0, 1);
    point[1] = map(point[1], mins[1], maxs[1], 0, 1);
  }

  return points;
}

float[][] renormalizeY(float[][] points) {
  float minY = min(0, minY(points));
  float maxY = max(1, maxY(points));
  for (float[] point : points) {
    point[1] = map(point[1], minY, maxY, 0, 1);
  }
  return points;
}

float[][] meanCenter(float[][] points) {
  return meanCenter(points, 0.5);
}

float[][] meanCenter(float[][] points, float nm) {
  //Shift means, but do not adjust sd
  float mx = meanX(points);
  float my = meanY(points);
  for (float[] point : points) {
    point[0] = (point[0]-mx)+nm;
    point[1] = (point[1]-my)+nm;
  }

  return points;
}

float[][] zoom(float[][] points) {
  //zooming out symmetrically so the points will be in [0,1]
  //but without squash or stretch
  float newmin = min(min(0, minX(points)), min(0, minY(points)));
  float newmax = max(max(1, maxX(points)), max(1, maxY(points)));

  //System.err.println("New min,max: "+newmin+","+newmax);
  float bound = max(abs(0-newmin), abs(newmax-1));
  //System.err.println("Bounds: " + bound);
  for (float[] point : points) {
    point[0] = map(point[0], 0-bound, 1+bound, 0, 1);
    point[1] = map(point[1], 0-bound, 1+bound, 0, 1);
  }
  return points;
}

float[][] removeTrend(float[][] points) {
  float[] fit = fit(points);
  for (float[] point : points) {
    point[1]-= ((fit[0]*point[0]) + fit[1]);
  }
  return points;
}

float[][] stretchY(float[][] points, float s) {
  float my = meanY(points);
  float meanDiff;
  for (float[] point : points) {
    meanDiff = point[1] - my;
    point[1] = my + (s*meanDiff);
  }
  return points;
}

float[][] retarget(float [][] points, float m) {
  //reportStats(points);

  float[] fit = fit(points);

  points = meanCenter(points);
  points = stretchY(points, m/fit[0]);


  return points;
}

float[][] addResiduals(float[][] points, float[] residuals, float constant, char type) {
  float[][] residPoints;
  switch(type) {
  case 'q':
    residPoints = addQResiduals(deepCopy(points), residuals, constant);
    break;

  case 't':
    residPoints = addTResiduals(deepCopy(points), residuals, constant);
    break;

  case 'l':
  default:
    residPoints = addLResiduals(deepCopy(points), residuals, constant);
    break;
  }

  return residPoints;
}

float[][] addLResiduals(float[][] points, float[] residuals, float m) {
  float b = map(m, -1, 1, 1, 0);
  for (int i = 0; i<points.length; i++) {
    points[i][1] = (m*points[i][0] + b) + residuals[i];
  }
  return points;
}

float[][] addQResiduals(float[][] points, float[] residuals, float m) {
  float b = map(m, -1, 1, 1, 0);
  for (int i = 0; i<points.length; i++) {
    points[i][1] = m==0 ? 0.5 : (m*sq(points[i][0]) + b) + residuals[i];
  }
  return points;
}

float[][] addTResiduals(float[][] points, float[] residuals, float m) {
  float trigX;
  float trigY;
  for (int i = 0; i<points.length; i++) {
    trigX = map(points[i][0], 0, 1, 0, PI);
    trigY = (-1 * m * cos(trigX));
    points[i][1] = map(trigY, -1, 1, 0, 1) + + residuals[i];
  }
  return points;
}

float[][] addResiduals(float[][] points, float[] fit, float[] residuals) {
  for (int i = 0; i<points.length; i++) {
    points[i][1] = (fit[0]*points[i][0] + fit[1]) + residuals[i];
  }
  return points;
}


float[][] addOutliers(float[][] points, int location, int number, int sign) {
  //Add outliers to list of points.
  int sindex = location;
  int eindex = location+number;
  float tenP = toDataY(0) - toDataY(.1*height);
  float minY = toDataY(height-mr);
  float maxY = toDataY(mr);

  for (int i = sindex; i<eindex; i++) {
    points[i][1] = sign<=0 ? random(minY,minY+tenP) : random(maxY-tenP,maxY);
  }

  return points;
}


float[][] deepCopy(float[][] points) {
  float[][] copy = new float[points.length][];
  for (int i = 0; i<points.length; i++) {
    copy[i] = new float[points[i].length];
    for (int j = 0; j<points[i].length; j++) {
      copy[i][j] = points[i][j];
    }
  }
  return copy;
}
/*********************
 * Summary Statistics *
 **********************/

float mean(float[] values) {
  float sum = 0;
  for (float point : values) {
    sum+=point;
  }
  return sum/values.length;
}

float meanY(float[][] values) {
  float sum = 0;
  for (float[] point : values) {
    sum+=point[1];
  }
  return sum/float(values.length);
}

float meanX(float[][] values) {
  float sum = 0;
  for (float[] point : values) {
    sum+=point[0];
  }
  return sum/float(values.length);
}

float minX(float[][] values) {
  float curMin = values[0][0];
  for (float[] point : values) {
    if (point[0]<curMin) {
      curMin = point[0];
    }
  }
  return curMin;
}

float maxX(float[][] values) {
  float curMax = values[0][0];
  for (float[] point : values) {
    if (point[0]>curMax) {
      curMax = point[0];
    }
  }
  return curMax;
}

float minY(float[][] values) {
  float curMin = values[0][1];
  for (float[] point : values) {
    if (point[1]<curMin) {
      curMin = point[1];
    }
  }
  return curMin;
}

float maxY(float[][] values) {
  float curMax = values[0][1];
  for (float[] point : values) {
    if (point[1]>curMax) {
      curMax = point[1];
    }
  }
  return curMax;
}

float stddev(float[] values) {
  float mu = mean(values);
  float sum = 0;
  for (float point : values) {
    sum+= pow(point-mu, 2);
  }
  return sqrt(sum/float(values.length));
}

float stddevY(float[][] values) {
  float mu = meanY(values);
  float sum = 0;
  for (float[] point : values) {
    sum+= sq(point[1]-mu);
  }
  return sqrt(sum/float(values.length));
}

float stddevX(float[][] values) {
  float mu = meanX(values);
  float sum = 0;
  for (float[] point : values) {
    sum+= sq(point[0]-mu);
  }
  return sqrt(sum/float(values.length));
}

//covariance
float covvar(float[][] values) {
  float mx = meanX(values);
  float my = meanY(values);
  float sum = 0;
  for (float[] point : values) {
    sum+= (point[0]-mx)*(point[1]-my);
  }
  return sum/float(values.length);
}

//OLS. returns [m, b]
float[] fit(float[][] values) {
  float cov = covvar(values);
  float var = pow(stddevX(values), 2);
  float mx = meanX(values);
  float my = meanY(values);
  float[] fit = new float[2];
  fit[0] = cov/var;
  fit[1] = my - (fit[0]*mx);
  return fit;
}

//Pearson's r
float r(float[][] points) {
  return abs(covvar(points) / (stddevX(points)*stddevY(points)));
}

//Intersection of two lines
float[] intersect(float[] fitA, float[] fitB){
  try{
    float x = (fitB[1]-fitA[1])/(fitA[0]-fitB[0]);
    float y = (fitA[0]*x) + fitA[1];
    return new float[]{x,y};
  }
  catch(ArithmeticException e){
    System.err.println("No valid intersection");
    return new float[]{0,0};
  }
}

//Sum of squared residuals

float rss(float[][] points, float[] fit) {
  float sum = 0;
  float expected;
  for (float[] point : points) {
    expected = fit[0]*point[0] + fit[1];
    sum += sq(point[1] - expected);
  }
  return sum;
}

//Fisher-Yates shuffle

float[] permute(float[] anArray) {
  int j = 0;
  float temp;
  float[] tempA = new float[anArray.length];
  arrayCopy(anArray, tempA);
  for (int i = anArray.length-1; i>1; i--) {
    j = int(random(0, i));
    temp = tempA[j];
    tempA[j] = tempA[i];
    tempA[i] = temp;
  }
  return tempA;
}


//Sort by x coordinate asc

void sortX(float[][] anArray) {
  Arrays.sort(anArray, new xCompare());
  return;
}

class xCompare implements Comparator<float[]> {
  public int compare(float[] a, float[] b) { 
    return (new Float(a[0])).compareTo(new Float(b[0]));
  }
};

//Verbose fit information.
void reportStats(float[][] points) {

  float[] fit = fit(points);
  float cov = covvar(points);
  float r = r(points);
  if (Float.isNaN(r)) {
    r = 1.0;
  }
  if (fit[1]<0) {
    System.err.println("Actual: y = "+fit[0]+"x"+fit[1]);
  } else {
    System.err.println("Actual: y = "+fit[0]+"x+"+fit[1]);
  }
  System.err.println("R = "+r+", r^2 = "+sq(r));
  System.err.println("X: ["+minX(points)+","+maxX(points)+"] Y: ["+minY(points)+","+maxY(points)+"]");
  System.err.println("VX: " + sq(stddevX(points)) + " VY: "+sq(stddevY(points))+" COV(X,Y): "+covvar(points));
  System.err.println("RSS: "+ rss(points, fit));
}

/*************
 * Generators *
 **************/

float randG() {
  return randG(0.5, 0.25);
}

float randG(float mu, float s) {
  //Polar Box-Muller
  float u1;
  float u2;
  float r;
  do {
    u1 = 2 * random(1) - 1;
    u2 = 2 * random(1) - 1;
    r = pow(u1, 2) + pow(u2, 2);
  } while (r>1 || r==0);
  return (u1 * sqrt(-2 * log(r) / r))/(1.0/s) + mu;
}

float[] rand2G(float mu, float s) {
  return rand2G(mu, s, true);
}

float[] rand2G(float mu, float s, boolean reject) {
  //Non-polar Box-Muller
  float x, y;
  do {
    float u1 = random(1);
    float u2 = random(1);
    x = sqrt(-2*log(u1))*cos(2*PI*u2)*s+mu;
    y = sqrt(-2*log(u1))*sin(2*PI*u2)*s+mu;
  } while ( reject && (((x-mu/s) > 2) || ((y-mu/s) > 2)) );
  float[] vals = {x, y};
  return vals;
}

float[] genResiduals(int n, float sigma) {
  float[] residuals = new float[n];
  NormalDistribution normal;
  if (sigma>0) {
    normal = new NormalDistribution(0, (double)sigma);
  } else {
    normal = new NormalDistribution();
  }
  double p;
  for (int i = 1; i<=n; i++) {
    p = (double)map(i, 0, n, 0.005, 0.995);
    residuals[i-1] = sigma==0 ? 0 : (float)normal.inverseCumulativeProbability(p);
  }
  return residuals;
}