import 'package:flutter/material.dart';

class Marker extends StatefulWidget {
    final double leftFraction;
    final double topFraction;
    final String info;
    final String info2;
    final String info3;
    final List<String> aulas;

    const Marker({
        Key? key,
        required this.leftFraction,
        required this.topFraction,
        required this.info,
        required this.info2,
        required this.info3,
        required this.aulas,
    }) : super(key: key);

    @override
    _MarkerState createState() => _MarkerState();
    }

    class _MarkerState extends State<Marker> {
    @override
    Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        double leftFraction = widget.leftFraction;
        double topFraction = widget.topFraction;
        String info = widget.info;
        String info2 = widget.info2;
        String info3 = widget.info3;
        List<String> aulas = widget.aulas;


        return Positioned(
            left: screenWidth * leftFraction,
            top: screenHeight * topFraction,
            child: GestureDetector(
                onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text(info),
                                content: Column(
                                    children: [
                                        Text(info2),
                                        Text(info3),
                                        Text(aulas.join(', ')),
                                    ],
                                ),
                                actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                            Navigator.of(context).pop();
                                        },
                                        child: const Text('Cerrar'),
                                    ),
                                ],
                            );
                        },
                    );
                },
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
                            Text(info,
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                           /* Text(info2,
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            Text(info3,
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            Text(aulas.join(', '),
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),*/
                        ],
                        ),
                    ),
                ],
            ),
            )
        );
    }
}


