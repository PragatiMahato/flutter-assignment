import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestore/models/product_models.dart';

import '../widgets/searchbar.dart';
import 'detailedpage.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  Map<String, List<ProductModel>> productsByCategory = {};

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
        filteredProducts = List.from(products);
        productsByCategory = _groupProductsByCategory(products);
      });
    }

    _searchController.addListener(() {
      String searchQuery = _searchController.text.toLowerCase();
      setState(() {
        filteredProducts = products
            .where(
                (product) => product.title.toLowerCase().contains(searchQuery))
            .toList();
        productsByCategory = _groupProductsByCategory(filteredProducts);
      });
    });
  }

  Map<String, List<ProductModel>> _groupProductsByCategory(
      List<ProductModel> products) {
    Map<String, List<ProductModel>> groupedProducts = {};

    for (var product in products) {
      if (!groupedProducts.containsKey(product.category)) {
        groupedProducts[product.category] = [];
      }
      groupedProducts[product.category]!.add(product);
    }

    return groupedProducts;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0XFF5C519A),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
            title: Column(
              children: const [
                Text(
                  "Our Products",
                  style: TextStyle(fontSize: 23),
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
                            bottomRight: Radius.circular(44),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 84,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 4,
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 15),
                                blurRadius: 50,
                                color:
                                    const Color(0XFF5C519A).withOpacity(0.45),
                              ),
                            ],
                          ),
                          child: SearchBox(controller: _searchController),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 5, left: 9, right: 7),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = productsByCategory.keys.toList()[index];
                  final categoryProducts = productsByCategory[category]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        width: 180,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0XFF5C519A), width: 2),
                            borderRadius: BorderRadius.circular(17)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            category,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0XFF5C519A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          itemCount: categoryProducts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = categoryProducts[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return DetailedPage(productModel: product);
                                  }),
                                );
                              },
                              child: Container(
                                width: 160,
                                margin: const EdgeInsets.only(right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                        height: 70,
                                        child: Image.network(product.image)),
                                    const SizedBox(height: 10),
                                    Text(
                                      product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${product.price.toString()}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                childCount: productsByCategory.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
