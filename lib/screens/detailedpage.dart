import 'package:flutter/material.dart';
import 'package:onlinestore/models/product_models.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF5C519A),
          title: Text(productModel.category),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 300,
                child: Image.network(
                  productModel.image.toString(),
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Price: \$${productModel.price.toString()}',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 33, 33, 33),
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Color(0XFF5C519A),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      productModel.title,
                      style: const TextStyle(
                          color: Color(0XFF5C519A),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'RobotoMono'),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      productModel.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 15,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 93, 93, 93)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                height: 55,
                width: 220,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 99, 88, 163),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          "Add to cart",
                          style: TextStyle(fontSize: 19, color: Colors.white),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
