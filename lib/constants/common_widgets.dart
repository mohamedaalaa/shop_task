import 'package:flutter/material.dart';

PreferredSizeWidget appBarC() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (BuildContext context) {
        return CustomPaint(
          size: Size(122, (122 * 0.3333333333333333).toDouble()),
          painter: RPSCustomPainter(),
        );
      },
    ),
    actions: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            // borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(width: 1, color: Colors.black)),
      )
    ],
  );
}

/*
child: CustomPaint(
  size: Size(WIDTH,(WIDTH*0.3333333333333333).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
  painter: RPSCustomPainter(),
)*/

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.1657000, size.height * 0.7971000);
    path0.cubicTo(
        size.width * 0.0422667,
        size.height * 0.7993000,
        size.width * 0.0446000,
        size.height * 0.1996000,
        size.width * 0.1657000,
        size.height * 0.2000000);
    path0.cubicTo(
        size.width * 0.2901083,
        size.height * 0.2000000,
        size.width * 0.5389250,
        size.height * 0.2000000,
        size.width * 0.6633333,
        size.height * 0.2000000);
    path0.cubicTo(
        size.width * 0.8373667,
        size.height * 0.2009000,
        size.width * 1.0307000,
        size.height * 0.8499000,
        size.width * 0.7700000,
        size.height * 0.8000000);
    path0.cubicTo(
        size.width * 0.7700000,
        size.height * 0.7900000,
        size.width * 0.6189250,
        size.height * 0.7992750,
        size.width * 0.1657000,
        size.height * 0.7971000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

BoxDecoration getDecoration(Color color, double circular) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(circular),
    border: Border.all(color: Colors.grey, width: 1),
  );
}

TextStyle textStyle(double size, FontWeight fontWeight, Color color) {
  return TextStyle(
    color: color,
    fontSize: size,
    overflow: TextOverflow.ellipsis,
    fontWeight: fontWeight,
  );
}
