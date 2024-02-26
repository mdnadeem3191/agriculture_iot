import 'package:agriculture_web/api/api_provider.dart';
import 'package:agriculture_web/repository/main_dashboard_model.dart';
import 'package:agriculture_web/responsive/responsiveness.dart';
import 'package:agriculture_web/screen/login_page.dart';
import 'package:agriculture_web/theme/theme_colors.dart';
import 'package:agriculture_web/widget/debugging.dart';
import 'package:agriculture_web/widget/navigate_route.dart';
import 'package:agriculture_web/widget/snack_bar_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
          BackdropFilter(
            filter: ui.ImageFilter.blur(
                sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
            child: Container(
              color: Colors.transparent, // You can change the color if needed
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
  late Future<void> _userDataFuture;

  @override
  void initState() {
    _userDataFuture = _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _userDataFuture,
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomText(),
                _MiddleBar(),
                _SensorHeading(),
                CustomTable(),
                _BottomBar(),
              ],
            ),
          );
        }
      },
    );
  }

  Future<MainDashBoardModel?> _getData1() async {
    try {
      MainDashBoardModel mainDashBoardModel =
          await UserRepository().userLogin();
      return mainDashBoardModel;
    } catch (e) {
      if (e is DioException) {
        if (!mounted) return null;
        SnackBarMessage.show(
            errorText: e.response?.data["message"], context: context);
      }
    }
    return null;
  }

  Future<void> _getData() async {
    try {
      await Future.wait(
        [
          _getData1(),
        ],
      );
    } catch (e) {
      Debugging.printing(text: 'Error fetching data: $e');
    }
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Text(
          "For more Data Visualisation",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

class _MiddleBar extends StatelessWidget {
  const _MiddleBar();
  static List<String> itemList = [
    "Home",
    "Aim",
    "Gallery",
    "About Us",
    "Logout"
  ];
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.75)),
      child: SizedBox(
        height: 50,
        child: Row(
            children: List.generate(
          5,
          (index) => Expanded(
              child: GestureDetector(
            onTap: () => _onTap(index, context),
            child: Center(
              child: Text(
                itemList[index],
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )),
        )),
      ),
    );
  }

  void _onTap(int index, BuildContext context) {
    if (index == 0) {
    } else if (index == 1) {
    } else if (index == 2) {
    } else if (index == 3) {
    } else {
      NavigatePageRoute().navigatePushAndRemoveUntil(
          context: context, widget: const LoginPage());
    }
  }
}

class _SensorHeading extends StatelessWidget {
  const _SensorHeading();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: ThemeColors.customZincColor.withOpacity(0.5)),
      child: const SizedBox(
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
              child: Text(
            "Sensor Data for Rice",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: ThemeColors.customYellowColor,
            ),
          )),
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 750, minWidth: 750),
      child: FittedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black.withOpacity(0.3),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Text(
              "IoT Based Agriculture Monitoring System",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 56, 207, 45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1100,
      child: Table(
        border: TableBorder.all(color: Colors.white.withOpacity(0.75)),
        children: [
          TableRow(
            children: [
              TableCell(
                  child: _buildCell(
                      text: 'Temperature sensor\nRange: (20-25°)',
                      isHeading: true)),
              TableCell(
                  child: _buildCell(
                      text: 'Humidity sensor\nRange: (50-60%°)',
                      isHeading: true)),
              TableCell(
                  child: _buildCell(
                      text: 'Pressure sensor\nRange: (1008-1015hPa°)',
                      isHeading: true)),
              TableCell(
                  child: _buildCell(
                      text: 'Soil Moisture sensor\nRange: (60-90%)',
                      isHeading: true)),
              TableCell(
                  child: _buildCell(
                      text: 'pH sensor\nRange: (6.0-7.0)', isHeading: true)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildCell(text: '30°')),
              TableCell(child: _buildCell(text: '45%')),
              TableCell(child: _buildCell(text: '1405hPa 5')),
              TableCell(child: _buildCell(text: '45%')),
              TableCell(child: _buildCell(text: '7.5')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildCell(text: '29°')),
              TableCell(child: _buildCell(text: '59%')),
              TableCell(child: _buildCell(text: '1005hPa 5')),
              TableCell(child: _buildCell(text: '45%')),
              TableCell(child: _buildCell(text: '4.8')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildCell(text: '29°')),
              TableCell(child: _buildCell(text: '40%')),
              TableCell(child: _buildCell(text: '1505hPa 5')),
              TableCell(child: _buildCell(text: '45%')),
              TableCell(child: _buildCell(text: '4.5')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildCell(text: '30°')),
              TableCell(child: _buildCell(text: '76%')),
              TableCell(child: _buildCell(text: '1005hPa 5')),
              TableCell(child: _buildCell(text: '45%')),
              TableCell(child: _buildCell(text: '3.6')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: _buildCell(text: '29°')),
              TableCell(child: _buildCell(text: '87%')),
              TableCell(child: _buildCell(text: '1005hPa 5')),
              TableCell(child: _buildCell(text: '45%')),
              TableCell(child: _buildCell(text: '5.6')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCell({required String text, bool isHeading = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeading ? FontWeight.bold : FontWeight.w600,
            fontSize: isHeading ? 17 : 15,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
