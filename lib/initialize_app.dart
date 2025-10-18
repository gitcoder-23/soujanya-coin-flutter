import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saujanya/constants/colors.dart';
import 'package:saujanya/pages/home_screen/dashboard_screen.dart';
import 'package:saujanya/pages/login/login_screen.dart';

import 'controllers/auth_controller.dart';
import 'routes/page_route.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.put(AuthController());

  bool isTokenChecked = false;

  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  Future<void> checkUserAuthentication() async {
    await authController.loadUserTokenFromStore();

    setState(() {
      isTokenChecked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    if (!isTokenChecked && !authController.isAuthenticated) {
      return Container(
        color: appRedColor4,
        child: Center(child: CircularProgressIndicator(color: appBlueColor)),
      );
    }

    return MaterialApp(
      title: 'Soujanya Coins',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
      ),
      onGenerateRoute: PageRoutes.generateRoute,
      home: determineHomeScreen(),
    );
  }

  Widget determineHomeScreen() {
    if (!authController.isAuthenticated) {
      return const LoginScreen();
    }

    if (authController.isAuthenticated) {
      return const DashboardScreen();
    }
    return const LoginScreen();
  }
}
