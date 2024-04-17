import 'package:flutter/material.dart';

class Horarios extends StatefulWidget {
  const Horarios({Key? key}) : super(key: key);

  @override
  State<Horarios> createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDepartamentoInfo(
              nombre: 'Departamento de Escolar y Archivo',
              funcionalidad:
                  'Facilita trámites de inscripción, constancias de estudios, fechas de exámenes, entre otros.',
              horario: '08:00 a 18:00 horas',
              contacto: '8329 4000 ext 7736/7737',
            ),
            SizedBox(height: 20),
            _buildDepartamentoInfo(
              nombre: 'Área de Tesorería',
              funcionalidad:
                  'Manejo de recursos económicos, cuotas de inscripción, pagos de constancias, kárdex, etc.',
              horario: '8:00 a 15:00 horas',
              contacto: '8329 4000 ext. 7702',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartamentoInfo({
    required String nombre,
    required String funcionalidad,
    required String horario,
    required String contacto,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nombre,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(funcionalidad),
          SizedBox(height: 4),
          Text('Horario de atención: $horario'),
          SizedBox(height: 4),
          Text('Contacto telefónico: $contacto'),
        ],
      ),
    );
  }
}
