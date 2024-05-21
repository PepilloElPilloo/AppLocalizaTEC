import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localizatec_app2/controller/session.dart';

// Supongamos que tienes una clase para representar los datos de un curso
class Curso {
  final String salon;
  final String maestro;
  final String materia;
  final String carrera;
  final String semestre;
  final String hora;

  Curso({
    required this.salon,
    required this.maestro,
    required this.materia,
    required this.carrera,
    required this.semestre,
    required this.hora,
  });
}

// Esta función simula la obtención de datos de la base de datos
Future<List<Curso>> obtenerCursos() async {
  // Aquí iría tu lógica para obtener los datos de la base de datos
  // Por ahora, devolveré datos simulados
  await Future.delayed(Duration(seconds: 2)); // Simular carga de datos

  return [
    Curso(
      salon: 'S1',
      maestro: 'Juan Perez',
      materia: 'Programación Avanzada',
      carrera: 'Ingeniería en Sistemas',
      semestre: '8',
      hora: '8:00 - 10:00',
    ),
    Curso(
      salon: 'S2',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'S3',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'S4',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'S5',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'S6',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'S7',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    // Aquí agregarías más datos según lo necesites
  ];
}

class Edificio_S extends StatefulWidget {
  const Edificio_S({Key? key}) : super(key: key);

  @override
  State<Edificio_S> createState() => _AulasState();
}

class _AulasState extends State<Edificio_S> {



  Session session = Session();


    

  Future<List<dynamic>>  getData() async {

    final response = await session.get('/api/schedule?aulas=EdificioS');
    
    if(response.statusCode == 200) {
      final data = jsonDecode(response.body)  as List;
      return data; 
    }

    return [];
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Future<List<dynamic>>  edificioData = getData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edificio S', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(156, 42, 42, 1),
      ),
      body: FutureBuilder<List<dynamic>>(
                future: edificioData,
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {

                    print(snapshot.error);
                    return const Center(child: Text('Error al cargar datos'));
                }  else {
            // Mostrar los datos en tarjetas
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final curso = snapshot.data![index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salón: ${curso.salon}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Maestro: ${curso.maestro}'),
                        
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}