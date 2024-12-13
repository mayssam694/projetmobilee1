
import 'package:flutter/material.dart';
import 'CartPage.dart';
import 'ProfilePage.dart';
import  'Rewards.dart';
import 'SellPage.dart';


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
        border: Border.all(color:Color(0xFFF2E8CF), width: 1),
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

