import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/home.dart';
import 'package:untitled5/screens/Items.dart';
import 'package:untitled5/screens/info.dart';
import 'package:untitled5/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    ItemScreen(),
    CategoryScreen(),
    ProfilePage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Abdelrhman Adel'),
              accountEmail: const Text('abdelrhman@g,mail.com'),
              currentAccountPicture: CircleAvatar(
                child: Image.network(
                    'https://thenounproject.com/api/private/icons/3069450/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0'),
              ),
            ),
            const ListTile(
              title: Text('home'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: const Text('Developer'),
              leading: const Icon(Icons.engineering),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Info()));
              },
            ),
            ListTile(
              title: const Text('info app'),
              leading: const Icon(Icons.info),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StoreInfo()));
              },
            ),
            const ListTile(
              title: Text('logout'),
              leading: Icon(Icons.logout),
            ),
            const ListTile(
              title: Text('close'),
              leading: Icon(Icons.close),
            ),
          ],
        ),
      ),
appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'catogrey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ProfilePage',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
