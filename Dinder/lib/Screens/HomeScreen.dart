import 'package:flutter/material.dart';
import 'dart:math';

import '../Common/backgroundwave.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  final int durationInSeconds;
  HomeScreen({required this.child, this.durationInSeconds = 2,});
  //const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  double x = 0.00;
  double y = 0.00;
  double amplitude = 0.3;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationInSeconds),
    );
    animation = Tween<double>(
      begin: 0,
      end: 12.5664, // 2Radians (360 degrees)
    ).animate(animationController);

    animationController.forward();

    animation.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
    animationController.repeat();
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back),
      //   title: Text('Dinder'),
      //   backgroundColor: Colors.purple,
      // ),
      backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
              child: BackgroundWave(
                height: 180,
                text: "Dinder",
              ),
            ),
            Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..rotateX(x)..rotateY(y),
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => Transform.rotate(
                angle: animation.value,
                child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset('assets/images/chickenerdrummerstick.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),
        ),
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 120, 0, 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/ConfigruationPage");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(2.0),
                      ),
                      child: Ink(
                        decoration: const BoxDecoration(
                         gradient: LinearGradient( colors: <Color>[Color(0x2dc9ffFF), Color(0x64C9FBFF)],),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'Create',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/CodeEntryPage");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(2.0),
                      ),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient( colors: <Color>[Color(0x78CAF9FF), Color(0x9DD0f6FF)],),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'Connect',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
        ),

      );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}

// Path getClip(Size size) {
//   var path = Path();
//   path.lineTo(0.0, size.height);
//   // We subtracted 80 from the height here
//   path.lineTo(size.width, size.height - 80);
//   path.lineTo(size.width, 0.0);
//   return path;
// }
//
// class BackgroundWaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(BackgroundWaveClipper oldClipper) =>
//       oldClipper != this;
// }