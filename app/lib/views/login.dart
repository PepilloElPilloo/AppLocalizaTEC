
//generate a login page in dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localizatec_app2/controller/session.dart';

class LoginPage extends StatefulWidget {

  final void Function(bool) onLogin;

  const LoginPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

//generate a login page in dart
class _LoginPageState extends State<LoginPage> {


  final ncontrol = TextEditingController();


  String getAuthTokenFromHeaders(http.Response response) {
    final cookies = response.headers['set-cookie']?.split(';');
    if (cookies != null) {
      for (var cookie in cookies) {
        final parts = cookie.trim().split('=');
        if (parts.length == 2 && parts[0] == 'auth-token') {
          return parts[1];
        }
      }
    }
    return ''; // Or throw an exception if no auth-token is found
  }

  Future<void> login() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/auth/login'),
      body: {
        'ncontrol': ncontrol.text,
      },
    );

    

    if (response.statusCode == 200) {

      final Session session = Session();

      final authToken = getAuthTokenFromHeaders(response);

      session.storeAuthToken(authToken);

      widget.onLogin(true);

      //session.retrieveAuthToken().then((value) => print(value));

      //final testing = await session.get('http://10.0.2.2:3000/api/auth/');

      //print(testing.body);

      //print(authToken);
      /*
      final res = await http.get( Uri.parse('http://10.0.2.2:3000/api/auth/'));
      if (res.statusCode == 200) {
        
      } else {
        print('Failed to get user data');
      }

      print(res.statusCode);


      widget.onLogin(true);*/
      
    } else {

      
      widget.onLogin(false);
    }
  }


  @override
  void dispose() {
    ncontrol.dispose();
    super.dispose();
  }


  @override
  void initState() {

    super.initState();
  }

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
              keyboardType: TextInputType.number,
              controller: ncontrol,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número de control',
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
                login();
                //widget.onLogin(true);
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