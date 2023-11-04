import 'package:flutter/material.dart';
import 'package:gallery/main.dart';
import 'package:gallery/src/data/models/product_model.dart';
import 'package:gallery/src/presentation/presentation.dart';
import 'package:gallery/src/shared/extention/context_ext.dart';
import 'package:gallery/src/shared/shared.dart';

import '../../base/base_state_wrapper.dart';

class HeroAnimationScreen extends StatefulWidget {
  const HeroAnimationScreen({super.key});

  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends BaseStateWrapper<HeroAnimationScreen> {
  @override
  Widget onBuild(
      BuildContext context, BoxConstraints constraints, PlatformType platform) {
    return Scaffold(
      appBar: const MAppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: productList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: context.screenWidth * .8,
              padding: const EdgeInsets.only(
                  bottom: 10, top: 10, left: 15, right: 15),
              margin: const EdgeInsets.only(bottom: 15),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadows: const [
                  BoxShadow(
                      color: Color(0X3F000000),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                      spreadRadius: 0)
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: MColorScheme.greyColorPalette[200],
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: MColorScheme.backgroundColor, width: 1)),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          productList[index].imageUrl,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productList[index].productName,
                          style: const TextStyle(
                              color: darkBlue, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(
                        "\$${productList[index].price.toString()}",
                        style: const TextStyle(
                          color: darkBlue,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  void onDispose() {}

  @override
  void onInit() {}

  @override
  void onPause() {}

  @override
  void onResume() {}
}

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends BaseStateWrapper<ProductDetailsScreen> {
  @override
  Widget onBuild(
      BuildContext context, BoxConstraints constraints, PlatformType platform) {
    return Scaffold(
      appBar: MAppBar(
        title: Text('Product Details'),
      ),
    );
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }
}
