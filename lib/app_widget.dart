import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/screens/bar_code_screen/bar_code_scanner_screen.dart';
import 'package:nlw_two/screens/home_screen.dart/home_screen.dart';
import 'package:nlw_two/screens/insert_boleto/insert_boleto_screen.dart';
import 'package:nlw_two/screens/login_screen/login_screen.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'shared/models/user_models.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payflow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => MySplashScreen(),
        "/home": (context) => HomeScreen(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginScreem(),
        "/barcode_scanner": (context) => BarCodeScaneerScreen(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
}

/* class MyApp extends StatelessWidget {
  MyApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.secondary,
        scaffoldBackgroundColor: AppColors.terciary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => MySplashScreen(),
        "/home": (context) => HomeScreen(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginScreem(),
        "/barcode_scanner": (context) => BarCodeScaneerScreen(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
} */
