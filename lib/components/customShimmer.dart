import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  CustomShimmer({this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.white70,
      highlightColor: highlightColor ?? Colors.white10,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class GridShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  GridShimmer({this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.white70,
      highlightColor: highlightColor ?? Colors.white10,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.7,
        children: List.generate(300, (index) {
          return Column(
            children: [
              Container(
                width: 180,
                height: 180,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Container(
                width: 180.0,
                height: 20.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Container(
                width: 180.0,
                height: 20.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      color: Colors.white,
                    ),
                    FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
