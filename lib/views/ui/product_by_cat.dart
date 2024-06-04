import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/product_provider.dart';
import 'package:flutter_application_1/views/shared/appstyle.dart';
import 'package:flutter_application_1/views/shared/category_btn.dart';
import 'package:flutter_application_1/views/shared/custom_spacer.dart';
import 'package:flutter_application_1/views/shared/lastest_shoes.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.tabIndex);
  }

  List<String> brand = [
    "assets/images/nike.png",
    "assets/images/adidas.jpg",
    "assets/images/nike.png",
    "assets/images/adidas.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getMale();
    productNotifier.getFemale();
    productNotifier.getKids();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 194, 194),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/1.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men shoes",
                      ),
                      Tab(
                        text: "Women shoes",
                      ),
                      Tab(
                        text: "Kids shoes",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: 16,
                right: 12,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    lastestShoes(male: productNotifier.male),
                    lastestShoes(male: productNotifier.female),
                    lastestShoes(male: productNotifier.kids),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.84,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        const CustomSpacer(),
                        Text(
                          "Filter",
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        const CustomSpacer(),
                        Text(
                          "Gender",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: const [
                          CategoryBtn(
                            label: "Men",
                            buttonClr: Colors.black,
                          ),
                          CategoryBtn(
                            label: "women",
                            buttonClr: Colors.grey,
                          ),
                          CategoryBtn(
                            label: "Kids",
                            buttonClr: Colors.grey,
                          ),
                        ]),
                        CustomSpacer(),
                        Text(
                          "Category",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            CategoryBtn(
                              label: "Shoes",
                              buttonClr: Colors.black,
                            ),
                            CategoryBtn(
                              label: "Apperrels",
                              buttonClr: Colors.grey,
                            ),
                            CategoryBtn(
                              label: "Accessories",
                              buttonClr: Colors.grey,
                            ),
                          ],
                        ),
                        const CustomSpacer(),
                        Text(
                          "Price",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const CustomSpacer(),
                        Slider(
                            value: _value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 500,
                            divisions: 50,
                            label: _value.toString(),
                            secondaryTrackValue: 200,
                            onChanged: (double value) {}),
                        CustomSpacer(),
                        Text(
                          "Brand",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          child: ListView.builder(
                            itemCount: brand.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset(
                                    brand[index],
                                    height: 60,
                                    width: 80,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
