import 'package:flutter/material.dart';
import 'login.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('images/marsa-port.png'),
            width: 450,
            height: 300,
          ),
          const SizedBox(height: 50),
          const Text(
            "L'esprit Marsa : entraide,\n partage, succès !",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontFamily: 'InriaSerif',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LogIn()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0083bd),
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
            ),
            child: const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'InriaSerif',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
