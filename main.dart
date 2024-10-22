import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicația Medicală',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.white), // Înlocuiesc headline1 cu displayLarge
          bodyMedium: TextStyle(color: Colors.white70), // bodyText1 cu bodyMedium
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spitale și Doctori'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/adriana.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Categorie
            SizedBox(height: 20),
            Text(
              'Categorii',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[900]),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryCard(category: 'Stomatologie', imageUrl: 'assets/stomatologie.jpg'),
                  CategoryCard(category: 'Cardiologie', imageUrl: 'assets/cardiologie.png'),
                  CategoryCard(category: 'Pediatrie', imageUrl: 'assets/pediatrie.png'),
                  CategoryCard(category: 'Neurologie', imageUrl: 'assets/neurologie.png'),
                  CategoryCard(category: 'Dermatologie', imageUrl: 'assets/dermatologie.png'),
                  CategoryCard(category: 'Oncologie', imageUrl: 'assets/oncologie.png'),
                  CategoryCard(category: 'Chirurgie', imageUrl: 'assets/chirurgie.png'),
                  CategoryCard(category: 'Ortopedie', imageUrl: 'assets/ortopedie.png'),
                  CategoryCard(category: 'Ginecologie', imageUrl: 'assets/ginecologie.png'),
                  CategoryCard(category: 'Psihiatrie', imageUrl: 'assets/psihiatrie.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Doctori',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[900]),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                DoctorCard(
                  name: 'Dr. Elena Ionescu',
                  specialty: 'Stomatolog',
                  imageUrl: 'assets/doctor1.jpg',
                  center: 'Clinica Medlife',
                  rating: '4.8',
                  reviews: '200 recenzii',
                ),
                DoctorCard(
                  name: 'Dr. Andrei Popescu',
                  specialty: 'Cardiolog',
                  imageUrl: 'assets/doctor2.jpg',
                  center: 'Spitalul Colțea',
                  rating: '4.7',
                  reviews: '150 recenzii',
                ),
                DoctorCard(
                  name: 'Dr. Maria Georgescu',
                  specialty: 'Pediatru',
                  imageUrl: 'assets/doctor3.jpg',
                  center: 'Clinica Grigore Alexandrescu',
                  rating: '4.9',
                  reviews: '300 recenzii',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Centre Medicale Apropie',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[900]),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                NearbyCenterCard(
                  name: 'Spitalul Universitar',
                  location: 'Str. Spitalului 15, București, România',
                  imageUrl: 'assets/spital1.jpg',
                  rating: '4.5',
                  reviews: '120 recenzii',
                ),
                NearbyCenterCard(
                  name: 'Clinica Medlife',
                  location: 'Str. Moșilor 18, București, România',
                  imageUrl: 'assets/spital2.jpg',
                  rating: '4.6',
                  reviews: '150 recenzii',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Card pentru categorii
class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;

  const CategoryCard({required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 50,
            width: 50,
          ),
          SizedBox(height: 8),
          Text(
            category,
            style: TextStyle(color: Colors.pink[900], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Card pentru doctori
class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final String center;
  final String rating;
  final String reviews;

  const DoctorCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.center,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink[100],
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(specialty),
                  Text('Centrul: $center'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('$rating ($reviews)'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Card pentru centre medicale apropiate
class NearbyCenterCard extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  final String rating;
  final String reviews;

  const NearbyCenterCard({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink[200],
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(location),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text('$rating ($reviews)'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}