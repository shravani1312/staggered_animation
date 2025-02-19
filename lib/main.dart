import 'package:flutter/material.dart';

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> opacity;
  late Animation<double> width;
  late Animation<double> height;
  late Animation<EdgeInsets> padding;
  late Animation<BorderRadius?> borderRadius;
  late Animation<Color?> color;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.100,
          curve: Curves.ease,
        ),
      ),
    );
    width = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.125,
          0.250,
          curve: Curves.ease,
        ),
      ),
    );
    height = Tween<double>(begin: 0.0, end: 250.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.250,
          0.375,
          curve: Curves.ease,
        ),
      ),
    );
    padding = EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.250,
          0.375,
          curve: Curves.ease,
        ),
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.500,
          curve: Curves.ease,
        ),
      ),
    );
    width = Tween<double>(
      begin: 150.0,
      end: 350.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.500,
          0.750,
          curve: Curves.ease,
        ),
      ),
    );
    height = Tween<double>(begin: 20.0, end: 600.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.1000,
          0.2000,
          curve: Curves.ease,
        ),
      ),
    );
    color = ColorTween(
      begin: Colors.red[100],
      end: Colors.blue[100],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.700,
          0.850,
          curve: Curves.ease,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: GestureDetector(
        onTap: () {
          if (controller.status == AnimationStatus.dismissed) {
            controller.forward();
          } else if (controller.status == AnimationStatus.completed) {
            controller.reverse();
          }
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: AnimatedBuilder(
              animation: controller,
              builder: _buildAnimation,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: Colors.indigo,
              width: 3.0,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: StaggerDemo()));
}
