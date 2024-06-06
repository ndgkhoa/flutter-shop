import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controllers/product_provider.dart';
import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/views/shared/appstyle.dart';
import 'package:flutter_application_1/views/shared/new_shoes.dart';
import 'package:flutter_application_1/views/shared/product_card.dart';
import 'package:flutter_application_1/views/shared/reuseable_text.dart';
import 'package:flutter_application_1/views/ui/product_by_cat.dart';
import 'package:flutter_application_1/views/ui/product_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> cate,
    required this.tabIndex,
  }) : _cate = cate;

  final Future<List<Sneakers>> _cate;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
          height: 325.h,
          child: FutureBuilder<List<Sneakers>>(
              future: _cate,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Errer ${snapshot.error}");
                } else {
                  final list = snapshot.data;
                  return ListView.builder(
                    itemCount: list!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          productNotifier.shoeSizes = shoe.sizes;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                      id: shoe.id, category: shoe.category)));
                        },
                        child: ProductCard(
                          price: "\$${shoe.price}",
                          category: shoe.category,
                          id: shoe.id,
                          name: shoe.name,
                          image: shoe.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              }),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reuseableText(
                    text: "Lastest Shoes",
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCat(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        reuseableText(
                          text: "Show all",
                          style: appstyle(22, Colors.black, FontWeight.w500),
                        ),
                        Icon(
                          AntDesign.caretright,
                          size: 20.h,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 105.h,
          child: FutureBuilder<List<Sneakers>>(
              future: _cate,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Errer ${snapshot.error}");
                } else {
                  final list = snapshot.data;
                  return ListView.builder(
                    itemCount: list!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: NewShoes(
                          onTap: () {
                            productNotifier.shoeSizes = shoe.sizes;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        id: shoe.id, category: shoe.category)));
                          },
                          imageUrl: shoe.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              }),
        )
      ],
    );
  }
}
