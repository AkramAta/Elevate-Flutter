import 'package:flutter/material.dart';
import 'package:task_1/Model/Products.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 140,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.favorite_border, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "EGP ${product.price}",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ), 
                  Text(
                    "EGP ${product.oldPrice}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rating ${product.rating} ",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Icon(Icons.star, color: Colors.yellow, size: 16),
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
