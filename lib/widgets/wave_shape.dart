import 'package:flutter/material.dart';

class FirstWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SecondWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.625,
        size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.875, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TopWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.blue[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.25, 0, size.height * 0.75);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LeftHalfScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var colors = [Colors.blue[200]!, Colors.blue[400]!, Colors.blue[600]!];
    var stops = [0.0, 0.5, 1.0];
    var gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: colors,
      stops: stops,
    );
    paint.shader =
        gradient.createShader(Rect.fromLTRB(0, 0, size.width / 2, size.height));
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width / 2, 0);

    var curveControlPoint1 = Offset(size.width * 0.25, size.height * 0.15);
    var curveEndPoint1 = Offset(size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
      curveControlPoint1.dx,
      curveControlPoint1.dy,
      curveEndPoint1.dx,
      curveEndPoint1.dy,
    );

    var curveControlPoint2 = Offset(size.width * 0.25, size.height * 0.45);
    var curveEndPoint2 = Offset(size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
      curveControlPoint2.dx,
      curveControlPoint2.dy,
      curveEndPoint2.dx,
      curveEndPoint2.dy,
    );

    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


