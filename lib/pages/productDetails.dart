import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'; 
import 'package:price_compare/components/customShimmer.dart';
import 'package:price_compare/models/product.dart'; 
import 'package:price_compare/theme/themeStyles.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails({@required this.product});

  Widget _buildProductProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Card(
            child: CachedNetworkImage(
              imageUrl: "${this.product.image}",
              fit: BoxFit.cover,
              placeholder: (context, url) => CustomShimmer(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${this.product.title}",
                  style: ThemeStyles.title,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 4),
                Text(
                  "${this.product.description}",
                  overflow: TextOverflow.clip,
                  style: ThemeStyles.dimText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListSeller() {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 80,
              width: 80,
              child: CachedNetworkImage(
                imageUrl:
                    "https://logos-world.net/wp-content/uploads/2020/11/eBay-Logo.png",
                fit: BoxFit.contain,
                placeholder: (context, url) => CustomShimmer(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Ebay",
                style: ThemeStyles.bigTitle,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "\$54",
                      style: ThemeStyles.bigTitle,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: ThemeColor.primeryColor,
        centerTitle: true,
        title: Text("${this.product.title}"),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Expanded(flex: 2, child: _buildProductProfile()),
          Divider(),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildListSeller(),
                  _buildListSeller(),
                  _buildListSeller(),
                  _buildListSeller(),
                  _buildListSeller(),
                  _buildListSeller(),
                  _buildListSeller(),
                  _buildListSeller(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
