import 'package:flutter_application_1/models/cart/get_products.dart';
import 'package:flutter_application_1/services/cart_helper.dart';
import 'package:flutter_application_1/views/shared/export.dart';
import 'package:flutter_application_1/views/shared/export_packages.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> cart = [];

  late Future<List<Product>> _cartList;
  @override
  void initState() {
    _cartList = CartHelper().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    AntDesign.close,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "My Cart",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: FutureBuilder(
                      future: _cartList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: reuseableText(
                              text: "Failed to get cart data",
                              style:
                                  appstyle(18, Colors.black, FontWeight.w600),
                            ),
                          );
                        } else {
                          final cartData = snapshot.data;
                          return ListView.builder(
                            itemCount: cartData!.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final data = cartData[index];
                              return GestureDetector(
                                onTap: () {
                                  cartProvider.setProductIndex = index;
                                  print(cartProvider.productIndex);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Slidable(
                                      key: const ValueKey(0),
                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            flex: 1,
                                            onPressed: (context) {
                                              //cartProvider.deleteCart(data['key']);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainScreen()));
                                            },
                                            backgroundColor:
                                                const Color(0xFF000000),
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: 'Delete',
                                          )
                                        ],
                                      ),
                                      child: Container(
                                        height: 93.h,
                                        width: 375.w,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade500,
                                              spreadRadius: 5,
                                              blurRadius: 0.3,
                                              offset: const Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: CachedNetworkImage(
                                                    imageUrl: data
                                                        .cartItem.imageUrl[0],
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: -4,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await CartHelper()
                                                          .deleteItem(data.id)
                                                          .then((response) => {
                                                                if (response ==
                                                                    true)
                                                                  {
                                                                    Navigator.pushReplacement(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MainScreen()))
                                                                  }
                                                                else
                                                                  {
                                                                    debugPrint(
                                                                        "Failed to delete the item")
                                                                  }
                                                              });
                                                    },
                                                    child: Container(
                                                      width: 40,
                                                      height: 30,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        AntDesign.delete,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 12,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data.cartItem.name,
                                                    style: appstyle(
                                                      16,
                                                      Colors.black,
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    data.cartItem.category,
                                                    style: appstyle(
                                                      14,
                                                      Colors.grey,
                                                      FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\$${data.cartItem.price}",
                                                        style: appstyle(
                                                          18,
                                                          Colors.black,
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                      // const SizedBox(width: 40),
                                                      // Text(
                                                      //   "Size",
                                                      //   style: appstyle(
                                                      //     18,
                                                      //     Colors.grey,
                                                      //     FontWeight.w600,
                                                      //   ),
                                                      // ),
                                                      // const SizedBox(width: 15),
                                                      // Text(
                                                      //   data['sizes'][0],
                                                      //   style: appstyle(
                                                      //     18,
                                                      //     Colors.grey,
                                                      //     FontWeight.w600,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(16),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            AntDesign
                                                                .minussquare,
                                                            size: 20,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          "0",
                                                          style: appstyle(
                                                            16,
                                                            Colors.black,
                                                            FontWeight.w600,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            AntDesign
                                                                .plussquare,
                                                            size: 20,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                            },
                          );
                        }
                      }),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
