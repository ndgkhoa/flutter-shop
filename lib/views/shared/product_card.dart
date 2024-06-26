import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/favorites_provider.dart';
import 'package:flutter_application_1/controllers/login_provider.dart';
import 'package:flutter_application_1/views/shared/appstyle.dart';
import 'package:flutter_application_1/views/shared/reuseable_text.dart';
import 'package:flutter_application_1/views/ui/auth/login.dart';
import 'package:flutter_application_1/views/ui/favorites.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});

  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: true);
    favoritesNotifier.getFavorites();
    var authNotifier = Provider.of<LoginNotifier>(context);
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: 325.h,
          width: 225.w,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 186.h,
                    width: 225.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: Consumer<FavoritesNotifier>(
                        builder: (context, favoritesNotifier, child) {
                          return Consumer<LoginNotifier>(
                              builder: (context, authNotifier, child) {
                            return GestureDetector(
                              onTap: () async {
                                if (authNotifier.loggedIn == true) {
                                  if (favoritesNotifier.ids
                                      .contains(widget.id)) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Favorites(),
                                      ),
                                    );
                                  } else {
                                    favoritesNotifier.createFav({
                                      "id": widget.id,
                                      "name": widget.name,
                                      "category": widget.category,
                                      "price": widget.price,
                                      "imageUrl": widget.image,
                                    });
                                  }
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                }
                                setState(() {});
                              },
                              child: favoritesNotifier.ids.contains(widget.id)
                                  ? const Icon(AntDesign.heart)
                                  : const Icon(AntDesign.hearto),
                            );
                          });
                        },
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reuseableText(
                      text: widget.name,
                      style: appstyleWithHt(
                          34, Colors.black, FontWeight.bold, 1.1),
                    ),
                    reuseableText(
                      text: widget.category,
                      style:
                          appstyleWithHt(18, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: reuseableText(
                          text: widget.price,
                          style: appstyle(28, Colors.black, FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          reuseableText(
                            text: "Colors",
                            style: appstyle(16, Colors.grey, FontWeight.w500),
                          ),
                          ChoiceChip(
                            label: const Text(""),
                            selected: selected,
                            visualDensity: VisualDensity.compact,
                            selectedColor: Colors.black,
                            shape: const CircleBorder(),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
