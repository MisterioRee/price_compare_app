import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:price_compare/components/customShimmer.dart';
import 'package:price_compare/models/product.dart';
import 'package:price_compare/pages/productDetails.dart';
import 'package:price_compare/services/favoriteProductsService.dart';
import 'package:price_compare/theme/themeStyles.dart';

class FavoriteProducts extends StatelessWidget {
  final _ = Get.put(FavoriteProductsService());
  Widget _buildGridProduct(Product product) {
    return SizedBox(
      height: 250,
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      ProductDetails(
                        product: product,
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 120,
                    width: 180,
                    child: CachedNetworkImage(
                      imageUrl: "${product.image}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CustomShimmer(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      ProductDetails(
                        product: product,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(
                          "${product.title}",
                          style: ThemeStyles.title,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${product.description}",
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: ThemeStyles.dimText,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: ThemeStyles.thinAndBigText,
                    ),
                    FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: ThemeColor.primeryColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
        title: Text("Favourite"),
        elevation: 0,
      ),
      body: GetBuilder<FavoriteProductsService>(
        builder: (__) => GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.7,
          children: [
            ..._.products.map((e) => _buildGridProduct(e)),
          ],
        ),
      ),
    );
  }
}
