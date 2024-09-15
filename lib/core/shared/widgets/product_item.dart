import 'package:elevate_task/core/styles.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.img,
    required this.name,
    required this.desc,
    required this.price,
    required this.rate,
  });
  final String img;
  final String name;
  final String desc;

  final String price;

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      // padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Image.network(
                  img,
                  height: 115,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 14,
                  child: Icon(
                    Icons.favorite_border,
                    color: Styles.mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              name.substring(0, 18),
              overflow: TextOverflow.ellipsis,
              style: Styles.itemStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              desc,
              style: Styles.itemStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Text(
                  'EGP $price',
                  style: Styles.itemStyle,
                ),
                const SizedBox(width: 10.0),
                Text(
                  '$price EGP',
                  style: Styles.itemStyle.copyWith(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Review (${rate})',
                      style: Styles.itemStyle,
                    ),
                    const SizedBox(width: 1.0),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.0,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Color(0xff014089),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20.0,
                    ),
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
