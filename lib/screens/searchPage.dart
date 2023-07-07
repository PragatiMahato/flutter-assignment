import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestore/models/product_models.dart';
import 'package:onlinestore/screens/detailedpage.dart';

class SearchPage extends StatefulWidget {
  final List<ProductModel> products;

  const SearchPage({Key? key, required this.products}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductModel> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = List.from(widget.products);
  }

  void filterResults(String searchQuery) {
    setState(() {
      searchResults = widget.products
          .where((product) =>
              product.title.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF5C519A),
        title: TextField(
          onChanged: filterResults,
          decoration: const InputDecoration(
            hintText: 'Search ',
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final product = searchResults[index];
          return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return DetailedPage(productModel: product);
                    }),
                  );
                },
                leading: Container(
                  height: 180,
                  width: 100,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(
                  product.title,
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Text(
                  '\$${product.price.toString()}',
                  style: TextStyle(
                    color: Color(0XFF5C519A),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
