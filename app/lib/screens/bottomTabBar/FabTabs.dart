import 'package:flutter/material.dart';
import 'package:localizatec_app2/screens/home/home.dart';
import 'package:localizatec_app2/screens/edificios/edificios.dart';
import 'package:localizatec_app2/screens/horarios/horarios.dart';
import 'package:localizatec_app2/screens/contactos/contactos.dart';

// ignore: must_be_immutable
class FabTabs extends StatefulWidget {
  int apartadoSeleccionado = 0;

  @override
  State<FabTabs> createState() => _FabTabsState();
}

class _FabTabsState extends State<FabTabs> {
  int apartadoActual = 0;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> pages = [
    const HomeMap(),
    const Edificios(),
    const Horarios(),
    const Contactos(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    Widget currentScreen = apartadoActual == 0
        ? const HomeMap()
        : apartadoActual == 1
            ? const Edificios()
            : apartadoActual == 2
                ? const Horarios()
                : const Contactos();
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              MaterialButton(
                minWidth: 50,
                onPressed: () {
                  setState(() {
                    currentScreen = const HomeMap();
                    apartadoActual = 0;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: apartadoActual == 0 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Inicio',
                        style: TextStyle(
                            color:
                                apartadoActual == 0 ? Colors.red : Colors.grey),
                      )
                    ]),
              ),
              MaterialButton(
                minWidth: 50,
                onPressed: () {
                  setState(() {
                    currentScreen = const Edificios();
                    apartadoActual = 1;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        color: apartadoActual == 1 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Edificios',
                        style: TextStyle(
                            color:
                                apartadoActual == 1 ? Colors.red : Colors.grey),
                      )
                    ]),
              ),
              MaterialButton(
                minWidth: 50,
                onPressed: () {
                  setState(() {
                    currentScreen = const Horarios();
                    apartadoActual =
                        2; // Cambiado de 3 a 2 para que represente la posición de Horarios en la lista de páginas
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.alarm,
                        color: apartadoActual == 2
                            ? Colors.red
                            : Colors.grey, // Cambiado de 3 a 2
                      ),
                      Text(
                        'Horarios',
                        style: TextStyle(
                          color: apartadoActual == 2
                              ? Colors.red
                              : Colors.grey, // Cambiado de 3 a 2
                        ),
                      )
                    ]),
              ),
              MaterialButton(
                minWidth: 50,
                onPressed: () {
                  setState(() {
                    currentScreen = const Contactos();
                    apartadoActual = 3;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: apartadoActual == 3 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Contacto',
                        style: TextStyle(
                            color:
                                apartadoActual == 3 ? Colors.red : Colors.grey),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
