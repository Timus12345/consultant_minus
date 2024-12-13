import 'package:consult_minus/navigation_menu/BottomNavBar.dart';
import 'package:consult_minus/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:consult_minus/menu/home.dart';

class favorite_screen extends StatefulWidget {
  @override
  _favorite_screenState createState() => _favorite_screenState();
}

class _favorite_screenState extends State<favorite_screen> {
  final List<Consultant> favourites = [
    Consultant(name: 'Алексей', rating: 4.9, description: 'Помог справится с разводом'),
    Consultant(name: 'Андрей', rating: 4.8, description: 'Были проблемы с налогами, помог очень сильно'),
    Consultant(name: 'Денис', rating: 4.2, description: 'Убили человека на корпоротиве, благодаря нему выиграли суд')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBar(context),
      appBar: AppBar(
        title: Text('Избранные консультанты'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: favourites.isEmpty
          ? Center(child: Text('Нет избранных консультантов'))
          : ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final consultant = favourites[index];
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
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  consultant.isFavorite = false;
                  favourites.remove(consultant);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConsultantDetailScreen(
                    consultant: consultant,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}