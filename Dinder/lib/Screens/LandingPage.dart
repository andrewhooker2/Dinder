import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double x = 0.00;
  double y = 0.00;
  double amplitude = 0.3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..rotateX(x)..rotateY(y),
          child: GestureDetector(
            onPanUpdate: (value) {
              if (y - value.delta.dx < 0) {
                setState(() {
                  y = max(y - value.delta.dx / 100, -amplitude);
                });
              } else {
                setState(() {
                  y = min(y - value.delta.dx / 100, amplitude);
                });
              }
              if (x - value.delta.dy < 0) {
                setState(() {
                  x = max(x - value.delta.dy / 100, -amplitude);
                });
              } else {
                setState(() {
                  x = min(x - value.delta.dy / 100, amplitude);
                });
              }
            },
            child: Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://media.istockphoto.com/photos/poultry-roast-chicken-drumstick-isolated-on-white-background-picture-id182359988?k=20&m=182359988&s=170667a&w=0&h=kzfytL2bm8oro_65TLzF9oZ3RES_4e60gGGRLgO3v20='),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}