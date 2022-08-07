import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundWave extends StatelessWidget {
  final double height;
  final String text;


  const BackgroundWave({Key? key, required this.height, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipPath(
          clipper: BackgroundWaveClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF26C9FF), Color(0x554DA7FF)],
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 30),
                child: Text(
                  this.text,
                  style: GoogleFonts.pacifico(fontSize: 84, color: Colors.white, shadows: [Shadow(
                    blurRadius: 10.0,
                    color: Colors.blue,
                    offset: Offset(5.0, 5.0),
                  ),])
                ),
              ),
            ),

          ),
    ),
    );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    const minSize = 80.0;

    // when h = max = 280
    // h = 280, p1 = 210, p1Diff = 70
    // when h = min = 140
    // h = 140, p1 = 140, p1Diff = 0
    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}