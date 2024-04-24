import 'package:flutter/material.dart';
import 'package:localizatec_app2/screens/home/home.dart';
import 'package:localizatec_app2/screens/edificios/edificios.dart';
import 'package:localizatec_app2/screens/horarios/horarios.dart';
import 'package:localizatec_app2/screens/contactos/contactos.dart';

class SideMenu extends StatefulWidget {
  final Function(String) onSearchTextChanged;

  const SideMenu({Key? key, required this.onSearchTextChanged})
      : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  // Método para cerrar el cajón lateral
  void closeDrawer() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Text('LocalizaTEC',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                SizedBox(height: 10),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                    // Notificar al padre (widget) sobre el cambio de texto de búsqueda
                    widget.onSearchTextChanged(value);
                  },
                  // Cerrar el cajón lateral cuando se presiona "Enter"
                  onSubmitted: (value) => closeDrawer(),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/fototec.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Inicio'),
            onTap: () {
              closeDrawer(); // Cerrar el cajón lateral
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Edificios'),
            onTap: () {
              closeDrawer(); // Cerrar el cajón lateral
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Edificios()));
            },
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('Horarios'),
            onTap: () {
              closeDrawer(); // Cerrar el cajón lateral
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Horarios()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Contactos'),
            onTap: () {
              closeDrawer(); // Cerrar el cajón lateral
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Contactos()));
            },
          ),
        ],
      ),
    );
  }
}
