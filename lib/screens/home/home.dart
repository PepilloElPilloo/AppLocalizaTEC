import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  static of(BuildContext context) {}
}

class _HomeState extends State<Home> {
  final List<CustomMarker> markers = [
    CustomMarker(leftFraction: 0.50, topFraction: 0.25, info: 'Edificio S', info2: 'S', info3: 'Laboratorio Computo'),
    CustomMarker(leftFraction: 0.21, topFraction: 0.36, info: 'Edificio R', info2: 'R', info3: 'R'),
    CustomMarker(leftFraction: 0.55, topFraction: 0.47, info: 'Templo', info2: 'Edificio A', info3: 'Direccion'),
    CustomMarker(leftFraction: 0.22, topFraction: 0.34, info: 'Sala de maestros', info2: 'maestros', info3: 'Sala de maestros'),
    CustomMarker(leftFraction: 0.20, topFraction: 0.38, info: 'Edificio Y', info2: 'Y', info3: 'Y'),
    CustomMarker(leftFraction: 0.20, topFraction: 0.45, info: 'Gimnasio', info2: 'GYM', info3: 'GYM'),
    CustomMarker(leftFraction: 0.12, topFraction: 0.41, info: 'Mantenimiento de equipo', info2: 'Mantenimiento', info3: 'Mantenimiento'),
    CustomMarker(leftFraction: 0.12, topFraction: 0.41, info: 'Sala de teatro', info2: 'teatro', info3: 'teatro'),
    CustomMarker(leftFraction: 0.15, topFraction: 0.36, info: 'Edificio X', info2: 'X', info3: 'X'),
    CustomMarker(leftFraction: 0.15, topFraction: 0.35, info: 'Servicios generales', info2: 'Servicios generales', info3: 'Servicios generales'),
    CustomMarker(leftFraction: 0.18, topFraction: 0.29, info: 'Edificio G', info2: 'G', info3: 'G'),
    CustomMarker(leftFraction: 0.18, topFraction: 0.29, info: 'Edificio K', info2: 'K', info3: 'K'),
    CustomMarker(leftFraction: 0.18, topFraction: 0.19, info: 'Edificio L', info2: 'L', info3: 'L'),
    CustomMarker(leftFraction: 0.21, topFraction: 0.21, info: 'Edificio H', info2: 'H', info3: 'H'),
    CustomMarker(leftFraction: 0.20, topFraction: 0.14, info: 'Edificio M', info2: 'M', info3: 'M'),
    CustomMarker(leftFraction: 0.23, topFraction: 0.16, info: 'Edificio N', info2: 'N', info3: 'N'),
    CustomMarker(leftFraction: 0.23, topFraction: 0.22, info: 'Edificio J', info2: 'J', info3: 'J'),
    CustomMarker(leftFraction: 0.27, topFraction: 0.23, info: 'Biblioteca', info2: 'biblioteca', info3: 'biblioteca'),
    CustomMarker(leftFraction: 0.27, topFraction: 0.19, info: 'Cafetería', info2: 'cafeteria', info3: 'cafeteria'),
    CustomMarker(leftFraction: 0.25, topFraction: 0.13, info: 'Auditorio Fundadores', info2: 'Auditorio', info3: 'Fundadores'),
    CustomMarker(leftFraction: 0.30, topFraction: 0.14, info: 'Edificio O', info2: 'O', info3: 'O'),
    CustomMarker(leftFraction: 0.30, topFraction: 0.21, info: 'Edificio I', info2: 'I', info3: 'I'),
    CustomMarker(leftFraction: 0.31, topFraction: 0.18, info: 'Edificio Q', info2: 'Q', info3: 'Q'),
    CustomMarker(leftFraction: 0.32, topFraction: 0.11, info: 'Edificio P', info2: 'P', info3: 'P'),
    CustomMarker(leftFraction: 0.34, topFraction: 0.16, info: 'NITE', info2: 'NITE', info3: 'NITE'),
    CustomMarker(leftFraction: 0.32, topFraction: 0.15, info: 'Laboratorio metal mecánica', info2: 'Lab Mecanica', info3: 'Mecanica'),
    CustomMarker(leftFraction: 0.34, topFraction: 0.13, info: 'Laboratorio Ingenieria Química', info2: 'Lab Quimica', info3: 'Quimica'),
    CustomMarker(leftFraction: 0.38, topFraction: 0.20, info: 'Edificio U', info2: 'U', info3: 'U'),
    CustomMarker(leftFraction: 0.34, topFraction: 0.20, info: 'Edificio T', info2: 'T', info3: 'T'),
    CustomMarker(leftFraction: 0.32, topFraction: 0.24, info: 'Unidad de vinculación', info2: 'Vinculacion', info3: 'Unidad de vinculacion')
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 4.0,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset('assets/croquistec2.png'),
                ...markers
                    .where((marker) =>
                        marker.info.toLowerCase() == searchQuery.toLowerCase() ||
                        marker.info2.toLowerCase() == searchQuery.toLowerCase() ||
                        marker.info3.toLowerCase() == searchQuery.toLowerCase())
                    .map((marker) {
                  return Positioned(
                    left: MediaQuery.of(context).size.width * marker.leftFraction,
                    top: MediaQuery.of(context).size.height * marker.topFraction,
                    child: Column(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.place, color: Colors.white, size: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          marker.info,
                          style: const TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomMarker {
  final double leftFraction;
  final double topFraction;
  final String info;
  final String info2;
  final String info3;

  CustomMarker({required this.leftFraction, required this.topFraction, required this.info, required this.info2, required this.info3});
}
