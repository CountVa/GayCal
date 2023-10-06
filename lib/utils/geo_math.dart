import "dart:math" show pi, cos, sin, atan, sqrt;

void main() {
  // print(GeoMath.toReverseGeo(247.32, 870.54, 705.65, -567.83));
}

class GeoMath {
  static double _toRad([double deg = 180.0]) {
    double rad = deg * pi / 180;
    return rad;
  }

  static double toDeg([double degree = 0, double min = 0, double sec = 0]) {
    double deg = degree + min / 60 + sec / 3600;
    return deg;
  }

  static String toGMS([double deg = 0]) {
    int degree = deg.toInt();
    double min = ((deg - deg.toInt()) * 60);
    double sec = double.parse(((min - min.toInt()) * 60).toStringAsFixed(2));
    return "${degree.toString()}° ${min.toInt().toString()}′ ${sec.toString()}′′";
  }

  static String toGeo([double xa = 0, double ya = 0, double d = 0, double degree = 0, double min = 0, double sec = 0]) {
    double al = toDeg(degree, min, sec);
    double x = cos(_toRad(al)) * d;
    double y = sin(_toRad(al)) * d;
    double xb = xa + x;
    double yb = ya + y;
    return "Xb=${xb.toStringAsFixed(2)} Yb=${yb.toStringAsFixed(2)}";
  }

  static String toReverseGeo([double xa = 0, double ya = 0, double xb = 0, double yb = 0]) {
    double x = sqrt((xb - xa)*(xb - xa));
    double y = sqrt((yb - ya)*(yb - ya));
    double r = atan(y/x) * 180 / pi;
    double al = 360 - r;
    double d =x/(cos(_toRad(al)));
    return "d=${d.toStringAsFixed(2)}";
  }
}
