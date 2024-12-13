import 'package:consult_minus/navigation_menu/BottomNavBar.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_screen(),
    );
  }
}

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List<Consultant> consultants = [
    Consultant(name: 'Алексей Волков', rating: 4.9, description: 'Юрист с опытом в области семейного права', isFavorite: false),
    Consultant(name: 'Андрей Ездаков', rating: 4.8, description: 'Специалист по налоговому праву', isFavorite: false),
    Consultant(name: 'Денис Агеров', rating: 4.2, description: 'Юрист по корпоративным делам', isFavorite: false),
    // Добавьте сюда других консультантов
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBar(context),
      appBar: AppBar(
        title: Image.asset('logobar.png', height: 40), // Логотип приложения
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Поиск консультантов',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: consultants
                    .where((consultant) => consultant.name.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList()
                    .length,
                itemBuilder: (context, index) {
                  Consultant consultant = consultants
                      .where((consultant) => consultant.name.toLowerCase().contains(searchQuery.toLowerCase()))
                      .toList()[index];

                  return ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text(consultant.name),
                    subtitle: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text('${consultant.rating}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        consultant.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          consultant.isFavorite = !consultant.isFavorite;
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConsultantDetailScreen(consultant: consultant),
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
    );
  }
}

class Consultant {
  final String name;
  final double rating;
  final String description;
  bool isFavorite;

  Consultant({
    required this.name,
    required this.rating,
    required this.description,
    this.isFavorite = false,
  });
}

class ConsultantDetailScreen extends StatelessWidget {
  final Consultant consultant;

  ConsultantDetailScreen({required this.consultant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBar(context),
      appBar: AppBar(
        title: Text(consultant.name),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 20),
            Text(
              consultant.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text('${consultant.rating}', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Описание:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(consultant.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewsScreen(consultant: consultant),
                  ),
                );
              },
              child: Text('Посмотреть отзывы'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsScreen extends StatelessWidget {
  final Consultant consultant;

  ReviewsScreen({required this.consultant});

  @override
  Widget build(BuildContext context) {
    List<String> reviews = [
      'Отличный специалист, помог мне с налоговыми вопросами.',
      'Очень внимательная и профессиональная.',
      'Помог решить семейный конфликт, рекомендую.',
    ];

    return Scaffold(
      bottomNavigationBar: appBar(context),
      appBar: AppBar(
        title: Text('Отзывы о ${consultant.name}'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reviews[index]),
            leading: Icon(Icons.comment),
          );
        },
      ),
    );
  }
}