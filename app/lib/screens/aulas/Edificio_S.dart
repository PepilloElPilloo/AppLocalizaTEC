import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:localizatec_app2/controller/session.dart';


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
                print(curso);

                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Maestro: ${curso['maestro']}'),
                        Text(
                          'Salón: ${curso['aula']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Materia: ${curso['materia']}'),
                        Text('Hora: ${DateTime.parse(curso['startAt']).hour} - ${DateTime.parse(curso['endAt']).hour}'), 

                    
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