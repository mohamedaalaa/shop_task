import 'package:flutter/material.dart';
import 'package:task/models/user.dart';

PreferredSizeWidget appBarC() {
  return AppBar(
    titleSpacing: 0,
    elevation: 0,
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        size: Size(122, (122 * 0.3333333333333333).toDouble()),
        painter: RPSCustomPainter(),
        child: Container(
          width: 122,
          height: 122 * 0.3333333333333333,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                Text(
                  cUser.name,
                  style: textStyle(10, FontWeight.normal, Colors.white),
                )
              ],
            ),
          ),
        ),
        // child: SizedBox(
        //     height: 100,
        //     width: 100,
        //     child: Center(
        //       child: Text(
        //         cUser.name,
        //         style: textStyle(10, FontWeight.normal, Colors.white),
        //       ),
        //     )),
      ),
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
