import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:price_compare/models/product.dart';

enum HomePageView { GridView, ListView }

class HomeService extends GetxController {
  bool isLoading = false;
  List<Product> products = [];
  HomePageView homePageView = HomePageView.GridView;
  RangeValues currentRangeValues = const RangeValues(10, 1000);

  _setLoadingStatus(bool status) {
    this.isLoading = status;
    update();
  }

  setHomePageView(HomePageView view) {
    this.homePageView = view;
    update();
  }

  setCurrentRangeValues(RangeValues rangeValues) {
    this.currentRangeValues = rangeValues;
    update();
  }

  Future<void> fetchProducts() async {
    _setLoadingStatus(true);
    try {
      final String response = await rootBundle.loadString('assets/sample.json');
      final data = await json.decode(response);
      this.products = List<Product>.from(
        data.map((data) => Product.fromJson(data)),
      );
      await Future.delayed(const Duration(milliseconds: 3000), () {});
    } catch (e) {
      _setLoadingStatus(false);
    }
    _setLoadingStatus(false);
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
}
