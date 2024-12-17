import 'package:consult_minus/navigation_menu/BottomNavBar.dart';
import 'package:consult_minus/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:consult_minus/menu/home.dart';
import 'package:url_launcher/url_launcher.dart';

class favorite_screen extends StatefulWidget {
  @override
  _favorite_screenState createState() => _favorite_screenState();
}

class _favorite_screenState extends State<favorite_screen> {
  final List<Consultant> favourites = [
    Consultant(name: 'Алексей', rating: 4.9, description: 'Помог справится с разводом'),
    Consultant(name: 'Андрей', rating: 4.8, description: 'Были проблемы с налогами, помог очень сильно'),
    Consultant(name: 'Денис', rating: 4.2, description: 'Убили человека на корпоротиве, благодаря нему выиграли суд'),
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
          ? const Center(child: Text('Нет избранных консультантов'))
          : ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final consultant = favourites[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(consultant.name),
            subtitle: Text(consultant.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.chat, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(consultant: consultant),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {
                    launchPhoneCall(consultant.name);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void launchPhoneCall(String consultantName) async {
    final phoneNumber = "+7 123 456 7890";
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Не удалось открыть телефон: $url';
    }
  }
}

class ChatScreen extends StatefulWidget {
  final Consultant consultant;

  ChatScreen({required this.consultant});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чат с ${widget.consultant.name}'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                  leading: const Icon(Icons.message),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'Введите сообщение',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      messages.add(messageController.text);
                      messageController.clear();
                    });
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