import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_models.dart';
import '../widgets/searchbar.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String url = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        products = List.from(jsonData)
            .map((data) => ProductModel.fromJson(data))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
      SliverAppBar(backgroundColor: Color(0XFF5C519A),
                leading: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert)),
                title: Column(
                  children: [
                    Text(
                      "Our Products",
                      style: const TextStyle(fontSize: 23),
                    ),
                  ],
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 240,
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * 0.13,
                            decoration: const BoxDecoration(
                                color: Color(0XFF5C519A),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(44),
                                    bottomRight: Radius.circular(44))),
                          ),
                          Positioned(
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 84),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 4),
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 15),
                                      blurRadius: 50,
                                      color: Color(0XFF5C519A).withOpacity(0.45))
                                ],
                              ),
                              child: const SearchBox(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.title),
                  subtitle: Text(product.category),
                  trailing: Text(product.price.toString()),
                );
              },
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
