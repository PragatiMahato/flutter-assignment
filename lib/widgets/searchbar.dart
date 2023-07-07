// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';


class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  const SearchBox({
    super.key, required this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
