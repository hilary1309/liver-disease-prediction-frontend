import 'package:flutter/material.dart';
import 'package:ldp_prediction/components/bottom_nav_component.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
    debugShowCheckedModeBanner: false, 
      home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'images/landing_page2.jpg',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 140, left: 13),
                child: Text(
                  'Predict Your Scans \nWith Us',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
     const SizedBox(
                height: 10,
              ),
              Positioned(
                  child: Container(
                      height: 0,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 600, bottom: 10),
                      child: SizedBox(
                          height: 80,
                          width: 300,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BottomNavComponent()));
                            },
                            icon: const Icon(Icons.flag),
                            label: const Text(
                              "Start",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ), //label text
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.9),
                              foregroundColor: Colors.black,
                              //minimumSize: Size(100, 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(52.0),
                              ),
                            ),
                          ))))
            ],
          ),
        ));
  }
}
