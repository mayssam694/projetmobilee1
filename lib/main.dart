import 'package:flutter/material.dart';

void main() {
  runApp(Waste2GreenApp());
}

class Waste2GreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Redirection après 2 secondes
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A994E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waste2Green',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.recycling,
              size: 80,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image_1.png', // Remplacez par le chemin de votre logo
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Waste2Green',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A994E),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A994E),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Log in',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF6A994E),
                      fontWeight: FontWeight.bold,
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
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo ou image
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espacement entre l'image et les champs de texte
              // Champ pour l'email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Champ pour le mot de passe
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Bouton de connexion
              // Bouton de connexion
              SizedBox(
                width: double.infinity, // Prend toute la largeur disponible comme les TextFormFields
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardPage()), // Assurez-vous que DashboardPage est importée
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A994E),
                    padding: const EdgeInsets.symmetric(vertical: 15), // Garde une hauteur confortable
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 3), // Espacement avant le texte "Forgot password?"
              // Le texte "Forgot password?"
              TextButton(
                onPressed: () {
                  // Redirection vers la page ForgotPassword
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()), // Assurez-vous que ForgotPasswordPage est importée
                  );
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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







class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center( // Centrer l'ensemble du contenu
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
          crossAxisAlignment: CrossAxisAlignment.center, // Centrer horizontalement
          children: [
            // Les textes en haut
            Column(
              children: [
                Text(
                  'Waste2Green',
                  style:  TextStyle(
                    color:  Color(0xFF6A994E),
                    fontSize: 50,  // Taille du texte agrandie
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),  // Espacement entre les textes
                Text(
                  '"Earth loves second chances"',
                  style:const TextStyle(
                    fontSize: 20,  // Taille du texte agrandie
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // Espacement entre les textes et les boutons
            SizedBox(height: 80),
            // Le bouton "Buy"
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyPage()),
                );
              },
              icon: Icon(Icons.shopping_cart, color: Colors.white,),
              label: Text(
                'Buy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,  // Taille du texte du bouton agrandie
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFF6A994E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 60),  // Espacement entre les boutons
            // Le bouton "Sell"
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellPage()),
                );
              },
              icon: Icon(Icons.add, color: Colors.white,),
              label: Text(
                'Sell',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,  // Taille du texte du bouton agrandie
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A994E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Ajout de l'image
              Center(
                child: Image.asset(
                  'assets/image_1.png', // Remplacez cette URL par celle de votre image
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Texte d'instruction
              Text(
                'Enter your email to reset your password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Champ de saisie pour l'email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Bouton d'envoi
              SizedBox(
                width: double.infinity, // Prend toute la largeur disponible
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Logique de réinitialisation du mot de passe ici
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password reset email sent')),
                      );
                      Navigator.pop(context); // Retour à la page précédente
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF6A994E),
                    padding: const EdgeInsets.symmetric(vertical: 15), // Ajuste uniquement la hauteur
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send Reset Link',
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
      appBar: AppBar(),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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











class BuyPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "Peels and Food Scraps", "weight": "3kg", "price": "5dt"},
    {"name": "Coffee Waste", "weight": "2kg", "price": "4dt"},
    {"name": "Meat and Seafood Waste", "weight": "1kg", "price": "3dt"},
    {"name": "Cooked Food Waste", "weight": "5kg", "price": "15dt"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green[50],
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color:Colors.green[50] ,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Color(0xFF6A994E),
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Color(0xFF6A994E)),
                title: Text('Home', style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BuyPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Color(0xFF6A994E)),
                title: Text('Cart', style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Color(0xFF6A994E)),
                title: Text('Profile', style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF6A994E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(


                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Icon(Icons.search, color: Colors.black),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        // Déterminer le chemin de l'image en fonction du nom du produit
                        String imagePath;
                        switch (product['name']) {
                          case "Peels and Food Scraps":
                            imagePath = 'assets/image_3.jpg';
                            break;
                          case "Coffee Waste":
                            imagePath = 'assets/image_6.jpg';
                            break;
                          case "Meat and Seafood Waste":
                            imagePath = 'assets/image_5.jpg';
                            break;
                          case "Cooked Food Waste":
                            imagePath = 'assets/image_4.jpg';
                            break;
                          default:
                            imagePath = 'assets/default_image.jpg'; // Valeur par défaut
                        }
                        return ProductCard(
                          name: product['name']!,
                          weight: product['weight']!,
                          price: product['price']!,
                          imagePath: imagePath, // Passez le chemin de l'image
                          onAdd: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartPage(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer avec les icônes
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF6A994E),
              borderRadius: BorderRadius.circular(8), // Ajoute des coins arrondis
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Couleur de l'ombre
                  blurRadius: 8, // Intensité du flou
                  offset: Offset(0, 4), // Décalage de l'ombre
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BuyPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rewards()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SellPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String weight;
  final String price;
  final String imagePath; // Image path ajouté ici
  final VoidCallback onAdd;

  ProductCard({
    required this.name,
    required this.weight,
    required this.price,
    required this.imagePath, // Assurez-vous que cette variable est reçue
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Color(0xFFF2E8CF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath, // Utilisation de la variable imagePath
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 8, // Remplacez 16 par la taille de texte que vous souhaitez
              ),
              textAlign: TextAlign.center,
            ),

          ),
          Text("$weight - $price"),
          IconButton(
            icon: Icon(Icons.add, color: Color(0xFFA7C957)),
            onPressed: onAdd, // Appel de l'action
          ),
        ],
      ),
    );
  }
}
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("Cart is empty!"),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("Welcome to the Profile Page!"),
      ),
    );
  }
}

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("Welcome to the Rewards Page!"),
      ),
    );
  }
}
