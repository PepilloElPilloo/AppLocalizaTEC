import 'package:flutter/material.dart';

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
      salon: 'N1',
      maestro: 'Juan Perez',
      materia: 'Programación Avanzada',
      carrera: 'Ingeniería en Sistemas',
      semestre: '8',
      hora: '8:00 - 10:00',
    ),
    Curso(
      salon: 'N2',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'N3',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'N4',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'N5',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'N6',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    Curso(
      salon: 'N7',
      maestro: 'Maria Rodriguez',
      materia: 'Bases de Datos',
      carrera: 'Ingeniería en Sistemas',
      semestre: '6',
      hora: '10:00 - 12:00',
    ),
    // Aquí agregarías más datos según lo necesites
  ];
}

class Edificio_N extends StatefulWidget {
  const Edificio_N({Key? key}) : super(key: key);

  @override
  State<Edificio_N> createState() => _AulasState();
}

class _AulasState extends State<Edificio_N> {
  late Future<List<Curso>> _cursosFuture;

  @override
  void initState() {
    super.initState();
    _cursosFuture = obtenerCursos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edificio N', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(156, 42, 42, 1),
      ),
      body: FutureBuilder<List<Curso>>(
        future: _cursosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar los datos'),
            );
          } else {
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
                        Text('Materia: ${curso.materia}'),
                        Text('Carrera: ${curso.carrera}'),
                        Text('Semestre: ${curso.semestre}'),
                        Text('Hora: ${curso.hora}'),
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