import 'package:flutter/material.dart';

class CommonScaffold extends StatefulWidget {
  final Widget child;

  const CommonScaffold({
    required this.child,
    super.key,
  });

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              height: screenHeight,
              width: screenWidth,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                widget.child,
              ],
            )
          ],
        ),
      ),
    );
  }
}
