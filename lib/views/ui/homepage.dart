import 'package:flutter_application_1/views/shared/export.dart';
import 'package:flutter_application_1/views/shared/export_packages.dart';

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
    productNotifier.getNike();
    productNotifier.getMizuno();
    productNotifier.getAdidas();
    return Scaffold(
        backgroundColor: Color(0xFFE2E2E2),
        body: SizedBox(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
                height: 325.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/1.jpg"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: EdgeInsets.only(left: 8.w, bottom: 15.h),
                  width: 375.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reuseableText(
                        text: "Athletics Shoes",
                        style: appstyleWithHt(
                            42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      reuseableText(
                        text: "Collection",
                        style: appstyleWithHt(
                            42, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                        padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        controller: _tabController,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(
                            child: Text("Nike"),
                          ),
                          Tab(
                            child: Text("Mizuno"),
                          ),
                          Tab(
                            child: Text("Adidas"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 220.h),
                child: Container(
                  padding: EdgeInsets.only(left: 12.w),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(
                      cate: productNotifier.nike,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      cate: productNotifier.mizuno,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      cate: productNotifier.adidas,
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
