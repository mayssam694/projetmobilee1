import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/image_1.png', // Remplacez par le chemin de votre logo
                height: 100,
              ),
              SizedBox(height: 20),
              // Texte principal
              Text(
                'Sign up',
                style:  TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF6A994E),
                ),
              ),
              Text(
                'To Continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 30),
              // Champs de texte pour l'inscription
              TextField(
                decoration: InputDecoration(
                  labelText: 'UserName',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 30),
              // Bouton "Sign Up"
              // Bouton "Sign Up"
              SizedBox(
                width: double.infinity, // Prend toute la largeur disponible comme les champs de texte
                child: ElevatedButton(
                  onPressed: () {
                    // Action lors de l'inscription
                    // Ajouter la logique pour inscrire l'utilisateur ici
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A994E) , // Couleur du bouton
                    padding: EdgeInsets.symmetric(vertical: 15), // Garde la hauteur inchangée
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}






