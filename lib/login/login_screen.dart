
import 'package:flutter/material.dart';
import '../registration/registration_screen.dart';

class MyLogin extends StatefulWidget {

  const MyLogin({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        title: const Text('Login',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Welcome To'
                    '\nGlamour Galleria',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.all(10),
            //   child: const Text(
            //     'Sign in',
            //     style: TextStyle(fontSize: 20),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                style: TextStyle(fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
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
                  border: OutlineInputBorder(),
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
            TextButton(
              onPressed: () {
                // Forgot password functionality
              },
              child: const Text('Forgot Password?'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {

                  User? user = await AuthService().signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );

                  // if (user != null) {
                  //   // Login successful, navigate to dashboard or home page
                  //   Navigator.pushReplacementNamed(context, '/dashboard');
                  // } else {
                  //   // Handle login failure
                  // }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Does not have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRegister.routeName);
                  },
                  child: const Text(
                    'Create An Account',
                    style: TextStyle(fontSize: 15),
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


class AuthService {
  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    return User();
  }
}


