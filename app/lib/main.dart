import 'package:flutter/material.dart';
//import 'package:localizatec_app2/screens/bottomTabBar/FabTabs.dart';
import 'package:localizatec_app2/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localiza TEC',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
      //home: FabTabs()
    );
  }
}

/* 
   Container(
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
                            fontWeight: FontWeight.bold,
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

*/