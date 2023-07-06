// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';


class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: const InputDecoration(
          hintText: "What are you looking for?",
          hintStyle: TextStyle(color: Color(0XFF5C519A)),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0XFF5C519A),
            size: 33,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none),
      onSubmitted: (String) {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return const SearchPage();
        // }));
      },
    );
  }
}
