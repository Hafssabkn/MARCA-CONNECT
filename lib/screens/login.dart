import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'signup.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  // Instance de GoogleSignIn
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Fonction pour la connexion Google
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      // Lancer le processus de connexion
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user != null) {
        // Connexion réussie, tu peux ajouter ici la logique pour naviguer ou récupérer des informations
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Connexion réussie avec Google")),
        );
      }
    } catch (e) {
      // En cas d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erreur de connexion avec Google")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/Marsa_connect_logo-1.png'),
              height: 100,
              width: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontFamily: 'InriaSerif',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Hello there, sign in to continue',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.normal,
                fontFamily: 'InriaSerif',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF0083bd),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF003f6c),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF0083bd),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF003f6c),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Remplacer par une logique de connexion plus tard
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
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'InriaSerif',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Or',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.normal,
                fontFamily: 'InriaSerif',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Appeler la fonction pour la connexion Google
                _signInWithGoogle(context);
              },
              icon: const Icon(Icons.login),
              label: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'InriaSerif',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0083bd),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'InriaSerif',
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF0083bd),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
