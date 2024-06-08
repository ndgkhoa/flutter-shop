import 'package:flutter_application_1/views/shared/export.dart';
import 'package:flutter_application_1/views/shared/export_packages.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.sneakers});

  final Sneakers sneakers;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: true);
    favoritesNotifier.getFavorites();
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Consumer<ProductNotifier>(
        builder: (context, productNotifier, child) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    leadingWidth: 0,
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              productNotifier.shoeSizes.clear();
                            },
                            child: const Icon(AntDesign.close,
                                color: Colors.black),
                          ),
                          Consumer<FavoritesNotifier>(
                            builder: (context, favoritesNotifier, child) {
                              return GestureDetector(
                                onTap: () {
                                  if (favoritesNotifier.ids
                                      .contains(widget.sneakers.id)) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Favorites(),
                                      ),
                                    );
                                  } else {
                                    favoritesNotifier.createFav({
                                      "id": widget.sneakers.id,
                                      "name": widget.sneakers.name,
                                      "category": widget.sneakers.category,
                                      "price": widget.sneakers.price,
                                      "imageUrl": widget.sneakers.imageUrl[0],
                                    });
                                  }
                                  setState(() {});
                                },
                                child: favoritesNotifier.ids
                                        .contains(widget.sneakers.id)
                                    ? const Icon(AntDesign.heart,
                                        color: Colors.black)
                                    : const Icon(AntDesign.hearto,
                                        color: Colors.black),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                    snap: false,
                    floating: true,
                    backgroundColor: Colors.transparent,
                    expandedHeight: MediaQuery.of(context).size.height,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          SizedBox(
                            height: 400.h,
                            width: 375.w,
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.sneakers.imageUrl.length,
                              controller: pageController,
                              onPageChanged: (page) {
                                productNotifier.activePage = page;
                              },
                              itemBuilder: (context, int index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: 330.h,
                                      width: 375.w,
                                      color: Colors.grey.shade300,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            widget.sneakers.imageUrl[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List<Widget>.generate(
                                          widget.sneakers.imageUrl.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  productNotifier.activePage !=
                                                          index
                                                      ? Colors.grey
                                                      : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.62,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.sneakers.name,
                                        style: appstyle(
                                            32, Colors.black, FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Text(widget.sneakers.category,
                                              style: appstyle(20, Colors.grey,
                                                  FontWeight.bold)),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 22,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1),
                                            itemBuilder: (context, _) =>
                                                const Icon(Icons.star,
                                                    size: 18,
                                                    color: Colors.black),
                                            onRatingUpdate: (rating) {},
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${widget.sneakers.price} VND",
                                              style: appstyle(26, Colors.black,
                                                  FontWeight.w600)),
                                          Row(
                                            children: [
                                              Text(
                                                "Colors",
                                                style: appstyle(18, Colors.grey,
                                                    FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.black,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.red,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Select sizes",
                                                style: appstyle(
                                                    20,
                                                    Colors.black,
                                                    FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "View size guide",
                                                style: appstyle(20, Colors.grey,
                                                    FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 40.h,
                                            child: ListView.builder(
                                              itemCount: productNotifier
                                                  .shoeSizes.length,
                                              scrollDirection: Axis.horizontal,
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) {
                                                final sizes = productNotifier
                                                    .shoeSizes[index];
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: ChoiceChip(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      side: const BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                    ),
                                                    disabledColor: Colors.white,
                                                    label: Text(
                                                      sizes['size'],
                                                      style: appstyle(
                                                        18,
                                                        sizes['isSelected']
                                                            ? Colors.white
                                                            : Colors.black,
                                                        FontWeight.w500,
                                                      ),
                                                    ),
                                                    selectedColor: Colors.black,
                                                    selected:
                                                        sizes['isSelected'],
                                                    onSelected: (newState) {
                                                      if (newState) {
                                                        productNotifier.sizes
                                                            .add(sizes['size']);
                                                      } else {
                                                        productNotifier.sizes
                                                            .remove(
                                                                sizes['size']);
                                                      }
                                                      productNotifier
                                                          .toggleCheck(index);
                                                    },
                                                    checkmarkColor:
                                                        Colors.white,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      const Divider(
                                        indent: 10,
                                        endIndent: 10,
                                        color: Colors.black,
                                      ),
                                      SizedBox(height: 5.h),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: Text(widget.sneakers.title,
                                            style: appstyle(22, Colors.black,
                                                FontWeight.w700)),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        widget.sneakers.description,
                                        textAlign: TextAlign.justify,
                                        maxLines: 5,
                                        style: appstyle(14, Colors.black,
                                            FontWeight.normal),
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CheckoutButton(
                  onTap: () async {
                    List<String> sizesCopy = List.from(productNotifier.sizes);
                    cartProvider.createCart({
                      "id": widget.sneakers.id,
                      "name": widget.sneakers.name,
                      "category": widget.sneakers.category,
                      "sizes": sizesCopy,
                      "imageUrl": widget.sneakers.imageUrl,
                      "price": widget.sneakers.price,
                      "qty": 1,
                    });
                    productNotifier.sizes.clear();
                    Navigator.pop(context);
                  },
                  label: "Add to Cart",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
