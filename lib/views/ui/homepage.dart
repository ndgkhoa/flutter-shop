import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/favorites_provider.dart';
import 'package:flutter_application_1/controllers/product_provider.dart';
import 'package:flutter_application_1/views/shared/home_widget.dart';
import 'package:flutter_application_1/views/shared/appstyle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getMale();
    productNotifier.getFemale();
    productNotifier.getKids();

    //var favoritesNotifier = Provider.of<FavoritesNotifier>(context);
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
                        fit: BoxFit.fill)),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Athletics Shoes",
                        style: appstyleWithHt(
                            42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      Text(
                        "Collection",
                        style: appstyleWithHt(
                            42, Colors.white, FontWeight.bold, 1.2),
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
                            child: Text("Men shoes"),
                          ),
                          Tab(
                            child: Text("Women shoes"),
                          ),
                          Tab(
                            child: Text("Kids shoes"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.265),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(
                      male: productNotifier.male,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      male: productNotifier.female,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      male: productNotifier.kids,
                      tabIndex: 2,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
