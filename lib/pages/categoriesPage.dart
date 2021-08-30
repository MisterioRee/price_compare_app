import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_compare/theme/themeStyles.dart';

import 'productsListPage.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  Widget _buildIcon({@required String? path, String? title}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductsListPage());
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.asset('$path'),
          ),
          SizedBox(height: 6),
          Text(
            "${title ?? ''}",
            style: ThemeStyles.title,
          )
        ],
      ),
    );
  }

  Widget _verticalDivider({double? height}) {
    return Container(
      height: height ?? 50,
      width: 1,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Home",
          style: ThemeStyles.appBarText,
        ),
        centerTitle: true,
        backgroundColor: ThemeColor.primeryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildIcon(
                        path: 'assets/computer.png',
                        title: 'Computer Accessories'),
                  ),
                  _verticalDivider(),
                  Expanded(
                    child: _buildIcon(
                      path: 'assets/dress.png',
                      title: 'Appeal & clothing',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildIcon(
                        path: 'assets/makeup.png', title: 'Beauty & Products'),
                  ),
                  _verticalDivider(),
                  Expanded(
                    child: _buildIcon(
                      path: 'assets/smart-tv.png',
                      title: 'Appliances & Gadgets',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildIcon(
                      path: 'assets/smartphone.png',
                      title: 'Smart Phones',
                    ),
                  ),
                  _verticalDivider(),
                  Expanded(
                    child: _buildIcon(
                      path: 'assets/football.png',
                      title: 'Sports',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildIcon(
                      path: 'assets/home.png',
                      title: 'Home',
                    ),
                  ),
                  _verticalDivider(),
                  Expanded(
                    child: _buildIcon(
                      path: 'assets/rocking-horse.png',
                      title: 'Kids',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
