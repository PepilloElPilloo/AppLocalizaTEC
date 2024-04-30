import 'package:flutter/material.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_R.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_Y.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_K.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_H.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_M.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_N.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_J.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_S.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_O.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_I.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_Q.dart';
import 'package:localizatec_app2/screens/aulas/Edificio_T.dart';

class Edificios extends StatefulWidget {
  const Edificios({Key? key}) : super(key: key);

  @override
  State<Edificios> createState() => _EdificiosState();
}

class _EdificiosState extends State<Edificios> {
  List<Map<String, dynamic>> edificios = [
    {'id': 1, 'nombre': 'Edificio R', 'imagen': 'assets/user.png'},
    {'id': 2, 'nombre': 'Edificio Y', 'imagen': 'assets/fototec.png'},
    {'id': 3, 'nombre': 'Edificio K', 'imagen': 'assets/croquistec.png'},
    {'id': 4, 'nombre': 'Edificio H', 'imagen': 'assets/croquistec2.png'},
    {'id': 5, 'nombre': 'Edificio M', 'imagen': 'assets/user.png'},
    {'id': 6, 'nombre': 'Edificio N', 'imagen': 'assets/fototec.png'},
    {'id': 7, 'nombre': 'Edificio J', 'imagen': 'assets/fototec.png'},
    {'id': 8, 'nombre': 'Edificio S', 'imagen': 'assets/user.png'},
    {'id': 9, 'nombre': 'Edificio O', 'imagen': 'assets/user.png'},
    {'id': 10, 'nombre': 'Edificio I', 'imagen': 'assets/user.png'},
    {'id': 11, 'nombre': 'Edificio Q', 'imagen': 'assets/user.png'},
    {'id': 12, 'nombre': 'Edificio T', 'imagen': 'assets/Original.png'},
  ];

  String searchQuery = '';


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredEdificios = edificios.where((edificio) {
      final nombre = edificio['nombre'].toString().toLowerCase();
      final query = searchQuery.toLowerCase();

      
      return nombre.contains(query);
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: filteredEdificios.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _navigateToEdificio(
                    context, filteredEdificios[index]['nombre']);
              },
              child: _buildEdificioInfo(
                nombre: filteredEdificios[index]['nombre'],
                imagen: filteredEdificios[index]['imagen'],
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToEdificio(BuildContext context, String edificioNombre) {
    switch (edificioNombre) {
      case 'Edificio R':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_R()),
        );
        break;
      case 'Edificio Y':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_Y()),
        );
        break;
      case 'Edificio K':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_K()),
        );
        break;
      case 'Edificio H':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_H()),
        );
        break;
      case 'Edificio M':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_M()),
        );
        break;
      case 'Edificio N':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_N()),
        );
        break;
      case 'Edificio J':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_J()),
        );
        break;
      case 'Edificio S':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_S()),
        );
        break;
      case 'Edificio O':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_O()),
        );
        break;
      case 'Edificio I':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_I()),
        );
        break;
      case 'Edificio Q':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_Q()),
        );
        break;
      case 'Edificio T':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Edificio_T()),
        );
        break;
      default:
        break;
    }
  }

  Widget _buildEdificioInfo({
    required String nombre,
    required String imagen,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            imagen,
            height: 150, // Ajusta la altura según tus necesidades
            width: 150, // Ajusta la anchura según tus necesidades
          ),
        ],
      ),
    );
  }
}
