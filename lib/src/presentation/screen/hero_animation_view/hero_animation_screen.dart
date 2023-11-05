import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gallery/main.dart';
import 'package:gallery/src/data/models/product_model.dart';
import 'package:gallery/src/presentation/presentation.dart';
import 'package:gallery/src/shared/extention/context_ext.dart';
import 'package:gallery/src/shared/routes/routes.dart';
import 'package:gallery/src/shared/shared.dart';
import 'package:go_router/go_router.dart';

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
      body: AnimationLimiter(
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: productList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 800),
                child: SlideAnimation(
                  verticalOffset: -50.0,
                  horizontalOffset: -50.0,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(Routes.PRODUCT_DETAILS.toNamed,
                            pathParameters: {
                              'index': index.toString(),
                            });
                      },
                      child: Container(
                        width: context.screenWidth * .8,
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 10, left: 15, right: 15),
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0X3F000000),
                              blurRadius: 15,
                              offset: Offset(5, 5),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Hero(
                              tag: productList[index].imageUrl,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: MColorScheme.greyColorPalette[200],
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: MColorScheme.backgroundColor,
                                        width: 1)),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      height: 60,
                                      width: 60,
                                      imageUrl: productList[index].imageUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: imageProvider,
                                        )),
                                      ),
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
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
                                        color: darkBlue,
                                        fontWeight: FontWeight.bold)),
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
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
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
  const ProductDetailsScreen({super.key, required this.index});
  final String index;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends BaseStateWrapper<ProductDetailsScreen> {
  @override
  Widget onBuild(
      BuildContext context, BoxConstraints constraints, PlatformType platform) {
    return Scaffold(
      appBar: const MAppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: productList[int.parse(widget.index)].imageUrl,
            child: Container(
              height: 300,
              width: context.screenWidth,
              decoration: const BoxDecoration(color: Colors.white),
              child: CachedNetworkImage(
                height: 300,
                width: context.screenWidth,
                imageUrl: productList[int.parse(widget.index)].imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1000),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productList[int.parse(widget.index)].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${productList[int.parse(widget.index)].price.toString()}',
                          style: const TextStyle(
                            color: darkBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      productList[int.parse(widget.index)].details,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
