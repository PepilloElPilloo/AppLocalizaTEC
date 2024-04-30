import 'package:flutter/material.dart';
import 'package:localizatec_app2/controller/session.dart';
import 'dart:convert';


class Mapping extends StatefulWidget {
  const Mapping({Key? key}) : super(key: key);

  @override
  State<Mapping> createState() => _MapState();

}

class _MapState extends State<Mapping> {

  final Session session = Session();

  final List<CustomMarker> markers = [
    CustomMarker(leftFraction: 0.50, topFraction: 0.25, info: 'Edificio S', info2: 'S', aulas: [ 'S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8'  ], info3: 'Laboratorio Computo'),
    CustomMarker(leftFraction: 0.21, topFraction: 0.36, info: 'Edificio R', info2: 'R', aulas: [ 'R1', 'R2', '43', 'R4', 'R5', 'R6', 'R7', 'R8', 'R9', 'R10', 'R11'  ], info3: 'R'),
    /*CustomMarker(leftFraction: 0.55, topFraction: 0.47, info: 'Templo', info2: 'Edificio A', info3: 'Direccion'),
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
    CustomMarker(leftFraction: 0.32, topFraction: 0.24, info: 'Unidad de vinculación', info2: 'Vinculacion', info3: 'Unidad de vinculacion')*/
  ];

  String searchQuery = 'r';

  Future<List<dynamic>>  getData() async {

    final response = await session.get('/api/schedule/');
    print(response.body);

    if(response.statusCode == 200) {

      final data = jsonDecode(response.body) as List;
      return data;
    }

    return [];
  }

  @override 
  void initState() {
    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {


    final Future<List<dynamic>>  horarios = getData();

    return Scaffold(
      body: FutureBuilder<List<dynamic>>( 
        future: horarios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(child: Text('Error al cargar datos'));
          }
          return Container(
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
                    
                    ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) { 

                        //final aulas = snapshot.data?[index]['aulas'] as List;
                        final aula = snapshot.data?[index]['aula'];

                        final marker = markers.firstWhere((marker) => marker.aulas.contains(aula));

        
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
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(marker.info, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    Text(marker.info2, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    Text(marker.info3, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    Text(aula, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );

                      })    
                    
                  ],
                ),
              ),
            ),
          );

        },
      )
    );
  }
}

class CustomMarker {
  final double leftFraction;
  final double topFraction;
  final String info;
  final String info2;
  final String info3;
  final List<String> aulas;

  CustomMarker({required this.leftFraction, required this.topFraction, required this.info, required this.info2, required this.info3, this.aulas = const [] });
}
