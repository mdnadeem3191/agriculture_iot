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
    return const Scaffold(
      backgroundColor: Color(0xfff2f3f5),
      body: ResponsiveWidget(
        largeScreen: _SmallScreen(),
        mediumScreen: _SmallScreen(),
        smallScreen: _SmallScreen(),
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
              child: Text("data"),
            ),
          );
        }
      },
    );
  }

  Future<void> _getData() async {}
}
