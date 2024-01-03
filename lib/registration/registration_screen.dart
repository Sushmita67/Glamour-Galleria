import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../splash/splash_screen.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);
   static const routeName = 'MyRegister';

  @override
   _MyRegisterState createState() => _MyRegisterState();
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const MyLogin(),
        '/register': (context) => const MyRegister(),
      },
    );
  }
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isReenterPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan.shade800,
          title: const Text('Register',
             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.all(10),
            //   child: const Text(
            //     'Create Account',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 30,
            //     ),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: fullNameController,
                style: TextStyle(fontStyle: FontStyle.italic),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: emailController,
                style: TextStyle(fontStyle: FontStyle.italic),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontStyle: FontStyle.italic),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: !isPasswordVisible,
                controller: passwordController,
                style: TextStyle(fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: !isReenterPasswordVisible,
                controller: reenterPasswordController,
                style: TextStyle(fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Re-enter Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isReenterPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isReenterPasswordVisible =
                        !isReenterPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Register'),
                onPressed: () async {
                  // You need to implement AuthService
                  // Replace AuthService() with your actual authentication service
                  User? user = await AuthService().registerWithEmailAndPassword(
                    emailController.text,
                    mobileNumberController.text,
                    passwordController.text,
                  );

                  // if (user != null) {
                  //   // Registration successful, navigate to dashboard or home page
                  //   Navigator.pushReplacementNamed(context, '/dashboard');
                  // } else {
                  //   // Handle registration failure
                  // }
                },
              ),
            ),

        Row(
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyLogin.routeName);
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
          ],
        ),
      ),
    );
  }
}

// Replace AuthService with your actual authentication service
class AuthService {
  Future<User?> registerWithEmailAndPassword(
      String email, String mobile, String password) async {

    return User();
  }
}

class User {
  // User model or information
}

