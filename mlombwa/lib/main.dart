import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icare/controllers/auth_controller.dart';
import 'package:icare/controllers/theme.dart';
import 'package:icare/views/auth/splash_screen.dart';

void main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  // Make firebase available to the whole project
  await Firebase.initializeApp().then(
    (value) => Get.put(
      AuthController(),
    ),
  );
  runApp(const ICare());
}

class ICare extends StatelessWidget {
  const ICare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: IcareTheme.light(),
      darkTheme: IcareTheme.dark(),
      themeMode: ThemeMode.system,
      scrollBehavior: const CupertinoScrollBehavior(),
      home: const SplashScreen(),
    );
  }
}
