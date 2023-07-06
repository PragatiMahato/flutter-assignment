import 'package:flutter/material.dart';
import 'package:onlinestore/models/product_models.dart';


class Headlines extends StatelessWidget {
  final ProductModel product;

  const Headlines({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return DetailPage(
        //     article: article,
        //   );
        // }));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    product.image,
                    height: 140,
                    width: 250,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 250,
                padding: const EdgeInsets.only(left: 10111),
                child: Text(
                  product.title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color.fromARGB(221, 89, 85, 80),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          )),
    );
  }
}
