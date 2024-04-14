import 'package:flutter/material.dart';
import 'package:localizatec_app2/screens/drawer/sidemenu.dart';

class Contactos extends StatefulWidget {
  const Contactos({Key? key}) : super(key: key);

  @override
  State<Contactos> createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  final List<Map<String, dynamic>> contactos = [
    {
      'puesto': 'Coordinador Sistemas Computacionales',
      'nombre': 'Alex Tinajero',
      'correo': 'coor.sistemas@tamaulipas.tecnm.mx',
      'telefono': '868-835-3685',
      'foto': 'assets/user.png', // Ruta de la imagen
    },
    // Agrega más contactos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        onSearchTextChanged: (String) {},
      ),
      appBar: AppBar(
        title: const Text('Contactos', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(156, 42, 42, 1),
      ),
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(contactos[index]['nombre']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Puesto: ' + contactos[index]['puesto']),
                  Text('Correo: ' + contactos[index]['correo']),
                  Text('Teléfono: ' + contactos[index]['telefono']),
                ],
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(contactos[index]
                    ['foto']), // Carga la imagen específica para cada contacto
              ),
            ),
          );
        },
      ),
    );
  }
}