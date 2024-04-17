import 'package:flutter/material.dart';
import 'package:localizatec_app2/components/infopage.dart';
import 'package:localizatec_app2/views/home.dart';


class NavigationDrawerWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 30);

  const NavigationDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color: Colors.red,
        child: ListView(
          padding: Padding,
          children: <Widget>[
            Container(
              padding: Padding,
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  buildMenuItem(
                    text: 'Acerca de',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  buildMenuItem(
                    text: 'Sugerencias',
                    icon: Icons.open_in_new,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const Divider(color: Colors.white70),
                  const Text('LocalizaTEC App v1.0.0', style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String nameapp,
    required String ciudad,
    required VoidCallback onClicked,
  }) =>
      InkWell(
          onTap: onClicked,
          child: Container(
            padding: Padding.add( const EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameapp,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ciudad,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ));

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style:const TextStyle(color: Colors.white)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
    }
  }
}
