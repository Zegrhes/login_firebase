import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final desiredWidth = screenWidth * (5 / 6);
    final screenHeight = MediaQuery.of(context).size.height;
    final desiredHeight = screenHeight * (1.15 / 20);
    return Scaffold(
      appBar: AppBar(
          title: TextField(
            controller: _searchController,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 2, left: 20),
          suffixIcon: const Icon(Icons.search, color: Color(0xfff35702),),
          constraints: BoxConstraints(
                maxWidth: desiredWidth, maxHeight: desiredHeight),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80),
              borderSide:
                  const BorderSide(color: Color(0xfff35702))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80),
              borderSide: const BorderSide(
                  color: Color(0xfff35702))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80),
              borderSide: const BorderSide(
                  color: Color(0xfff35702))),
        ),
      ),
      centerTitle: true,),
      body: const Center(
        child: Text('Search'),
      ),
    );
  }
}
