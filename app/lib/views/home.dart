import 'package:flutter/material.dart';
import 'package:localizatec_app2/components/drawer.dart';
import 'package:localizatec_app2/screens/contactos/contactos.dart';
import 'package:localizatec_app2/screens/edificios/edificios.dart';
import 'package:localizatec_app2/screens/horarios/horarios.dart';
import 'package:localizatec_app2/views/login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:localizatec_app2/screens/home/home.dart';

class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int _selectedIndex = 0;
    bool isLogin = false;


    void setUserLogin(bool state) {
        setState( ()  {
            isLogin = state;
        });
    }


    final List<Widget> _pages = [
        const Home(),
        const Horarios(),
        const Edificios(),
        const Contactos(),
    ];


    

    @override
    void initState() {
        super.initState();

    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body:  isLogin ?  _pages[_selectedIndex] : LoginPage( onLogin: (state) => setUserLogin(state) ),
            appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                centerTitle: true,
                title: Text( 
                    'Localiza TEC'.toUpperCase(),  
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                backgroundColor: Colors.red,
                actions: [
                    IconButton(
                        icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        ),
                        onPressed: () {
                        //showSearch(context: context, delegate: NegociosSearchDelegate());
                        },
                    ),
                ],
                
            ),
            drawer:  NavigationDrawerWidget( ),
            bottomNavigationBar:  isLogin ? navbar() : null, 
        );
    }

    Widget navbar() { 
        return Container(
            color: Colors.white,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: GNav(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                color: Colors.black,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                tabBackgroundColor: Colors.red,
                gap: 0,
                onTabChange: (index) {
                    setState(() {
                        _selectedIndex = index;
                        //setUserLogin(false);
                    });
                },
                padding: const EdgeInsets.all(16),
                tabs: const [
                    GButton(
                        icon: Icons.home,
                        text: 'Inicio',
                    ),
                    GButton(
                        icon: Icons.event,
                        text: 'Horario',
                    ),
                    GButton(
                        icon: Icons.apartment,
                        text: 'Edificios',
                    ),
                    GButton(
                        icon: Icons.phone_callback_sharp,
                        text: ' Contactos',
                    ),
                ],
            ),
            ),
        );
    }
}


