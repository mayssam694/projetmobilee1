
import 'package:flutter/material.dart';
class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers pour les champs du formulaire
  final TextEditingController titleController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  // Fonction pour envoyer les données
  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "title": titleController.text,
        "quantity": quantityController.text,
        "price": priceController.text,
        "location": locationController.text,
        "type": typeController.text,
      };

      print("Données envoyées : $data");
      // Réinitialiser le formulaire après l'envoi
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bouton "I Sell!" stylisé
            SizedBox(
              width: double.infinity, // Même largeur pour tous les éléments
              child: Container(
                decoration:BoxDecoration(
                  color:Color(0xFF6A994E),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    "I Sell!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Image stylisée
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/image_2.jpg', // Assurez-vous que l'image existe
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Titre de section
            SizedBox(
              width: double.infinity,
              child: Text(
                "More Informations:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xFFBC4749)),
              ),
            ),
            SizedBox(height: 20.0),

            // Formulaire
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField("Announcement Title:", titleController),
                  SizedBox(height: 15.0),
                  _buildTextField("Quantity:", quantityController, isNumeric: true),
                  SizedBox(height: 15.0),
                  _buildTextField("Price:", priceController, isNumeric: true),
                  SizedBox(height: 15.0),
                  _buildTextField("Location:", locationController),
                  SizedBox(height: 15.0),
                  _buildTextField("Type:", typeController),
                  SizedBox(height: 30.0),

                  // Bouton pour soumettre les données
                  SizedBox(
                    width: double.infinity, // Uniformise la largeur
                    child: ElevatedButton(
                      onPressed: _submitData,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: const TextStyle(
                          color: Color(0xFF6A994E),
                          fontSize: 20, // Taille de la police
                          fontWeight: FontWeight.bold, // Texte en gras
                          letterSpacing: 1.2, // Espacement entre les lettres
                          height: 1.5, // Hauteur de ligne
                          fontFamily: 'Arial', // Police (optionnel, vous pouvez changer par une autre police disponible)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour construire un champ de formulaire avec des styles
  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false}) {
    return SizedBox(
      width: double.infinity, // Assure une largeur uniforme pour les champs
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter $label";
            }
            return null;
          },
        ),
      ),
    );
  }
}