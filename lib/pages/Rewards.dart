
import 'package:flutter/material.dart';
import 'CartPage.dart';
import 'ProfilePage.dart';
import 'SellPage.dart';
import 'BuyPage.dart';



class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Ouvre le menu Drawer
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
                  color: Colors.green[50],
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
          SizedBox(
            width: double.infinity,
            height: 60, // Taille réduite
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2E8CF), // Couleur de fond
                borderRadius: BorderRadius.circular(20), // Coins arrondis
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Découvrez vos Récompenses',
                    style: TextStyle(
                      fontSize: 16, // Taille réduite pour correspondre à la nouvelle hauteur
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A994E),
                    ),
                  ),
                  SizedBox(height: 4), // Espacement réduit
                  Text(
                    '🌟🌟🌟🌟🌟🌟',
                    style: TextStyle(fontSize: 14), // Ajustement de la taille du texte
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RewardTile(
                    title: 'Livraison gratuite',
                    description:
                    'Achetez 50 kg de déchets alimentaires ou plus en une seule commande : Livraison à domicile gratuite.',
                    imagePath: 'assets/image_7.png', // Chemin de l'image locale
                  ),
                  RewardTile(
                    title: 'Remise de 20%',
                    description:
                    'Achetez 100 kg de déchets alimentaires ou plus en une seule commande : Une remise de 20% sur vos achats.',
                    imagePath: 'assets/image_9.png', // Chemin de l'image locale
                  ),
                  RewardTile(
                    title: 'Points de récompense',
                    description: 'Chaque achat ou vente de déchets alimentaires rapporte des points.',
                    imagePath: 'assets/image_8.png', // Chemin de l'image locale
                  ),
                  SizedBox(height: 4),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Action du bouton
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF2E8CF), // Couleur de fond du bouton
                        fixedSize: Size(400, 60),  // Taille fixe : largeur et hauteur
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Coins arrondis
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding interne
                      ),
                      child: Text(
                        'Consulter mes points',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A994E), // Couleur du texte
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
    );
  }
}

class RewardTile extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const RewardTile({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFBC4749)
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }
}