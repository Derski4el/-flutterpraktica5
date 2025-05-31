import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Обо мне',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[800],
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.grey?.withOpacity(0.2),
          elevation: 4,
          margin: const EdgeInsets.all(0),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Colors.blueGrey,
          labelStyle: TextStyle(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
      home: const ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _launchURL(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Не удалось открыть ссылку')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ошибка при открытии ссылки')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой профиль'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/83275328?v=4'),
            ),
            const SizedBox(height: 16),
            Text(
              'Карсканов Илья Юрьевич',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Python-разработчик',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Обо мне:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Хей! Я back-end разработчик на Python.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Стек:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: const [
                        Chip(label: Text('Python')),
                        Chip(label: Text('FastAPI')),
                        Chip(label: Text('SQLAlchemy')),
                        Chip(label: Text('Jinja2')),
                        Chip(label: Text('SQL Oracle')),
                        Chip(label: Text('Git')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey, height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Контакты:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: 'Telegram',
                        child: IconButton(
                          icon: Icon(
                            Icons.telegram,
                            size: 40,
                            color: Colors.blue,
                          ),
                          onPressed: () => _launchURL('https://t.me/Der4el', context),
                        ),
                      ),
                      Tooltip(
                        message: 'GitHub',
                        child: IconButton(
                          icon: Icon(
                            Icons.code,
                            size: 40,
                            color: Colors.grey,
                          ),
                          onPressed: () => _launchURL('https://github.com/Derski4el', context),
                        ),
                      ),
                      Tooltip(
                        message: 'Email',
                        child: IconButton(
                          icon: const Icon(Icons.email, size: 40),
                          color: Colors.red,
                          onPressed: () => _launchURL('mailto:karckanovilya@gmail.com', context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
