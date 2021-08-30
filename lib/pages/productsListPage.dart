import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:price_compare/components/boxTextField.dart';
import 'package:price_compare/components/customShimmer.dart';
import 'package:price_compare/models/product.dart';
import 'package:price_compare/pages/favoriteProducts.dart';
import 'package:price_compare/pages/productDetailPage.dart';
import 'package:price_compare/services/productsListService.dart';
import 'package:price_compare/theme/themeStyles.dart';

class ProductsListPage extends StatelessWidget {
  final _ = Get.put(HomeService());

  Widget _buildHeadRowBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 6,
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(() => FavoriteProducts());
              },
              child: FaIcon(
                FontAwesomeIcons.heart,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              child: BoxTextFieldWithPrefix(
                hintText: "Search",
                label: "Search",
                onChange: () {},
                prefix: Icon(
                  Icons.search,
                  color: ThemeColor.primeryColor,
                ),
                keyboard: TextInputType.text,
                errorText: null,
                initialValue: "",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showFilters();
              },
              child: Icon(
                Icons.clear_all,
                color: Colors.white,
                size: 35,
              ),
            ),
          )
        ],
      ),
    );
  }

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
                      () => ProductDetails(
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
                      () => ProductDetails(
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
                    GestureDetector(
                      onTap: () {
                        product.isLiked
                            ? _.removeFromFavorite(product)
                            : _.addToFavorite(product);
                      },
                      child: FaIcon(
                        product.isLiked
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: ThemeColor.primeryColor,
                      ),
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

  Widget _buildListProduct(Product product) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => ProductDetails(
                    product: product,
                  ),
                );
              },
              child: Card(
                child: SizedBox(
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: "${product.image}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CustomShimmer(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
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
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetails(
                          product: product,
                        ),
                      );
                    },
                    child: Text(
                      "${product.title}",
                      style: ThemeStyles.title,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetails(
                          product: product,
                        ),
                      );
                    },
                    child: Text(
                      "${product.description}",
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: ThemeStyles.dimText,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: ThemeStyles.thinAndBigText,
                        ),
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: ThemeColor.primeryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showFilters() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return Container(
            color: Colors.grey[300],
            height: Get.height / 2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RangeSlider(
                    min: 1,
                    max: 10000,
                    divisions: 1,
                    onChanged: (RangeValues values) {},
                    values: RangeValues(1, 1000),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _appBar(height) => PreferredSize(
        preferredSize: Size(Get.size.width, height + 60),
        child: Container(
          color: ThemeColor.primeryColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  _buildHeadRowBox(),
                  GetBuilder<HomeService>(
                    builder: (__) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _.setHomePageView(PageListView.ListView);
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: _.homePageView == PageListView.GridView
                                    ? ThemeColor.primeryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.thList,
                                color: _.homePageView == PageListView.ListView
                                    ? ThemeColor.primeryColor
                                    : Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _.setHomePageView(PageListView.GridView);
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: _.homePageView == PageListView.ListView
                                    ? ThemeColor.primeryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.thLarge,
                                color: _.homePageView == PageListView.GridView
                                    ? ThemeColor.primeryColor
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _appBar(AppBar().preferredSize.height) as PreferredSizeWidget?,
      body: GetBuilder<HomeService>(
        builder: (__) => _.isLoading
            ? GridShimmer(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
              )
            : _.homePageView == PageListView.GridView
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 0.7,
                    children: [
                      ..._.products.map((e) => _buildGridProduct(e)),
                    ],
                  )
                : GridView.count(
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    childAspectRatio: 3.1,
                    children: [..._.products.map((e) => _buildListProduct(e))],
                  ),
      ),
    );
  }
}
