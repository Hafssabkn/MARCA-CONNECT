import 'package:flutter/material.dart';
import 'login.dart'; // Assurez-vous que vous avez la page de connexion pour la redirection
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _functionalityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Fonction pour l'inscription Google
  Future<void> _signUpWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inscription avec Google réussie")),
      );
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de l'inscription avec Google")),
      );
    }
  }

  // Fonction pour l'inscription avec les identifiants (email, mot de passe, nom et fonctionnalité)
  void _signUp() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final name = _nameController.text;
      final functionality = _functionalityController.text;
      
      // Logique d'inscription ici (par exemple, appeler une API)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inscription réussie")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  'Create an Account',
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
                  'Sign up to continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'InriaSerif',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildTextFormField(
                  controller: _nameController,
                  label: 'Name',
                  validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                ),
                const SizedBox(height: 25),
                _buildTextFormField(
                  controller: _functionalityController,
                  label: 'Functionality',
                  validator: (value) => value!.isEmpty ? 'Please enter your functionality' : null,
                ),
                const SizedBox(height: 25),
                _buildTextFormField(
                  controller: _emailController,
                  label: 'Email',
                  validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                ),
                const SizedBox(height: 25),
                _buildTextFormField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _signUp, // Appeler la fonction _signUp ici
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0083bd),
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                  ),
                  child: const Text(
                    "Sign Up",
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
                  onPressed: _signUpWithGoogle, // Appeler la fonction pour la connexion Google
                  icon: const Icon(Icons.login),
                  label: const Text('Sign up with Google'),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
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
                          MaterialPageRoute(builder: (context) =>  LogIn()), // Assurez-vous que vous avez la page de connexion pour la redirection
                        );
                      },
                      child: const Text(
                        'Log In',
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
        ),
      ),
    );
  }

  // Méthode générique pour créer un champ de formulaire
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
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
      validator: validator,
    );
  }
}
