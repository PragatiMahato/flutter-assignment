import 'package:flutter/material.dart';
import 'package:onlinestore/models/product_models.dart';

class NewsTile extends StatelessWidget {
  final ProductModel product;

  const NewsTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return DetailPage(product:product);
        // }));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    product.image,
                    height: 70,
                    width: 100,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 12,
                width: 23,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  product.title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color.fromARGB(221, 89, 85, 80),
                      fontSize: 15,
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
