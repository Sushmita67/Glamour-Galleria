import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_book_store/views/screens/detail_page.dart';
import 'package:online_book_store/views/screens/home_page.dart';
import 'package:online_book_store/views/screens/intro_screen.dart';
import 'package:online_book_store/views/screens/log_in_screen.dart';
import 'package:online_book_store/views/screens/log_sign_page.dart';
import 'package:online_book_store/views/screens/sign_in_screen.dart';
import 'package:online_book_store/views/screens/splash_screen.dart';
import 'package:online_book_store/views/screens/view_screen.dart';
import 'package:provider/provider.dart';

import 'controller/provider/cart_provider.dart';
import 'models/getx/theme_getx_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeModel.lightTheme,
          darkTheme: ThemeModel.darkTheme,
          initialRoute: 'splashScreen',
          routes: {
            'splashScreen': (context) => SplashScreen(),
            'introScreen': (context) => IntroScreen(),
            'logSignPage': (context) => LogSignPage(),
            'signInScreen': (context) => SignInScreen(),
            'logInScreen': (context) => LogInScreen(),
            'homePage': (context) => HomePage(),
            'viewScreen': (context) => ViewScreen(),
             'DetailPage': (context) => DetailPage(),


          },
        );
      },
    );
  }
}
