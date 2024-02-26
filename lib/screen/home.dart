import 'package:agriculture_web/responsive/responsiveness.dart';
import 'package:agriculture_web/widget/custom_scrollable.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f3f5),
      body: Stack(
        children: [
          SizedBox.expand(
            child: DecoratedBox(
              decoration: const BoxDecoration(),
              child: Image.asset(
                "assets/soil.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          const ResponsiveWidget(
            largeScreen: _SmallScreen(),
            mediumScreen: _SmallScreen(),
            smallScreen: _SmallScreen(),
          ),
        ],
      ),
    );
  }
}

class _SmallScreen extends StatefulWidget {
  const _SmallScreen();

  @override
  State<_SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<_SmallScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _getData(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const SizedBox.expand(
            child: CustomScrollAble(
              child: Text(
                "Iot Based Agriculture Monitoring System",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _getData() async {}
}
