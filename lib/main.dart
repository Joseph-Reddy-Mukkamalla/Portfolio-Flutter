import 'package:flutter/material.dart';

void main() {
  runApp(MyPortfolio());
}

// ---------- Variables for easy editing ----------
class PortfolioData {
  // Profile
  static const String profilePic =
      'https://wallpapers.com/images/high/user-profile-placeholder-icon-jiv4adftoq5dhj54.png'; // replace with actual URL
  static const String name = 'Joseph';
  static const String title = 'Software Engineer';

  // Projects
  static const List<Map<String, String>> projects = [
    {
      'name': 'Weather App',
      'description': 'Shows weather details of selected cities.'
    },
    {
      'name': 'Flutter Portfolio App',
      'description': 'Portfoilo app built using Flutter.'
    },
    {
      'name': 'Image Encryption',
      'description': 'Fastened Image Encryption using MPI.'
    },
  ];
}

// ---------- Main App ----------
class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ---------- Home Page ----------
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(PortfolioData.profilePic),
            ),
            SizedBox(height: 20),
            // Name
            Text(
              PortfolioData.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Title
            Text(
              PortfolioData.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[400]),
            ),
            SizedBox(height: 30),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AboutPage()));
                  },
                  child: Text('About Me'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProjectsPage()));
                  },
                  child: Text('Projects'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ---------- About Page ----------
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello! I am ${PortfolioData.name}, a ${PortfolioData.title}.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Projects Page ----------
class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: PortfolioData.projects.length,
          itemBuilder: (context, index) {
            final project = PortfolioData.projects[index];
            return Card(
              color: Colors.grey[900],
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['name']!,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      project['description']!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
