import 'dart:math';
import 'global_data.dart';

void calculate(
    String strInterval, String strStarter, String strEnder, String strStat) {
  List<num> statList = [];
  statList = [for (String str in strStat.split(",")) double.parse(str)];
  setGlobalToZero();
  double interval = double.parse(strInterval);
  double starter = double.parse(strStarter);
  double ender = double.parse(strEnder);
// это не эффективно, но наглядный пример того, как делать это на бумаге
// среднее арифмитическое, дисперсия, отклонение, мода и медианна
// Moda  fm = max fi; m0 = x0 + (fm - fm-1) * h / (fm - fm-1) + (fm+ fm+1) where fm+1 its right one and fm-1 is left
// ######
// mediana = Me = x0 + (0.5 - Sme-1)*h / wme
// sme-1 накопленная относительная частота для интервала слева от медианного
// wme относительная частота медианного интервала
// ####
// D = 1/n * summ(xi - crednee)^2 *fi
  List<double> segments = [];
  List<int> rate = [];
  List<double> perc = [];
  List<double> accumPerc = [];
  int D = 0;
  while (starter <= ender) {
    segments.add(starter); //отрезки
    rate.add(0); // кол во элементов в отрезках
    perc.add(0); // частота
    accumPerc.add(0); // накопленная частота
    statList.forEach((element) {
      if (element >= segments[D] && element < (segments[D] + interval)) {
        rate[D] += 1;
      }
    });
    perc[D] = rate[D] / statList.length;
    if (D != 0) {
      accumPerc[D] = accumPerc[D - 1] + perc[D];
    } else
      accumPerc[D] = perc[D];
    starter += interval;
    D += 1;

    getMiddle(interval, segments, rate);
    getDisp(interval, segments, rate);
    deviation = pow(disp, 0.5).toDouble();
    getModa(interval, segments, perc);
    getMediana(interval, statList, segments, rate);
    prepareTable(segments, rate, perc, accumPerc);
  }
}


void setGlobalToZero() {
  mediana = 0;
  Moda = 0;
  midle = 0;
  disp = 0;
  deviation = 0;
  table_data = [];
}

void getMiddle(interval, segments, rate) {
  for (int index = 0; index < segments.length; index++) {
    midle += (segments[index] + interval / 2) * rate[index];
  }
  midle = midle / (segments.length + 1);
}

void getDisp(interval, segments, rate) {
  for (int index = 0; index < segments.length; index++) {
    disp += pow(((segments[index] + interval / 2) - midle), 2) * rate[index];
  }
  disp = midle / (segments.length + 1);
}

void getModa(interval, segments, perc) {
  int max = 0;
  for (int index = 0; index < perc.length; index++) {
    if (perc[index] > perc[max]) {
      max = index;
    }
  }
  if (max != (perc.length - 1) && max != 0) {
    Moda = segments[0] +
        (perc[max] - perc[max - 1]) *
            interval /
            (perc[max] - perc[max - 1] + (perc[max] - perc[max + 1]));
  } else {
    Moda = segments[max];
  }
}

void getMediana(interval, statList, segments, rate) {
  int medIndex = 0;
  num summ = 0;
  for (int index = 0; index < rate.length; index++) {
    summ += rate[index];
    if (summ >= statList.length / 2) {
      medIndex = index;
      break;
    }
  }
  int i = 0;
  num Sme = 0;
  while (i < medIndex) {
    Sme += rate[i];
    i += 1;
  }
  mediana = segments[medIndex] +
      interval * (statList.length / 2 - Sme) / rate[medIndex];
}

void prepareTable(segments, rate, perc, accumPerc) {
  for (int index = 0; index < segments.length; index++) {
    table_data.add([
      segments[index].toString(),
      rate[index].toString(),
      perc[index].toStringAsFixed(4),
      accumPerc[index].toStringAsFixed(4)
    ]);
  }
}