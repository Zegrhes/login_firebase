import 'search_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';


class MainPageUser extends StatefulWidget {
  const MainPageUser({super.key});

  @override
  State<MainPageUser> createState() => _MainPageUserState();
  
}

class _MainPageUserState extends State<MainPageUser> {
   int _selectedIndex = 0;

 final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(isAdmin: false,),
  ]; // List o

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: const Color(0xfff35702),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
