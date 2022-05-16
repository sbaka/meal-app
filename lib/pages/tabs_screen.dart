import 'package:flutter/material.dart';
import 'package:meal_app/pages/category_page.dart';
import 'package:meal_app/pages/favorites_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // ignore: non_constant_identifier_names
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const CategoryPage(),
      'title': 'Categories',
    },
    {
      'page': const FavoritesScreen(),
      'title': 'Favorites',
    },
  ];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPage]['title'] as String,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
