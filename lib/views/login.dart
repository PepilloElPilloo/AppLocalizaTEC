
//generate a login page in dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  final void Function(bool) onLogin;

  const LoginPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

//generate a login page in dart
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 20 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // image url 
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Logo_ITM.gif/220px-Logo_ITM.gif',
              width: 200,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                labelStyle: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                labelStyle: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // change elevated button color to red and white text
              // make bigger the button

              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                minimumSize: const Size(150, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),              

              onPressed: () {
                // Respond to button press
                widget.onLogin(true);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

/*
class LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 
  }
}
*/
// Path: AppLocalizaTEC/lib/views/register.dart