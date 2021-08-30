import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:price_compare/models/database.dart';
import 'package:price_compare/models/product.dart';

class FavoriteProductsService extends GetxController {
  bool isLoading = false;
  List<Product> products = [];
  _setLoadingStatus(bool status) {
    this.isLoading = status;
    update();
  }

  Future<void> fetchProducts() async {
    _setLoadingStatus(true);
    try {
      var likedProducts = await DBProvider.db.getAllProduct();

      this.products = List.from(
        likedProducts.map(
          (e) => Product(
            id: e.id,
            category: e.category ?? '',
            description: e.description,
            image: e.image,
            price: e.price,
            title: e.title,
            isLiked: true,
          ),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 3000), () {});
    } catch (e) {
      _setLoadingStatus(false);
    }
    _setLoadingStatus(false);
  }

  removeFromFavorite(Product product) {
    DBProvider.db.deleteProduct(product.id!);
    var index = this.products.indexOf(product);
    this.products[index].isLiked = false;
    update();
  }

  addToFavorite(Product product) {
    DBProvider.db.addProduct(product);
    var index = this.products.indexOf(product);
    this.products[index].isLiked = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
}
