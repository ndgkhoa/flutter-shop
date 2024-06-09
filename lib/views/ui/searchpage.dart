import 'package:flutter_application_1/services/products_helper.dart';
import 'package:flutter_application_1/views/shared/export.dart';
import 'package:flutter_application_1/views/shared/export_packages.dart';
import 'package:flutter_application_1/views/ui/product_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100.h,
          backgroundColor: Colors.black,
          elevation: 0,
          title: CustomField(
            hintText: 'Search for a product',
            controller: search,
            onEditingComplete: () {
              setState(() {});
            },
            prefixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(AntDesign.camera, color: Colors.black),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: const Icon(AntDesign.search1, color: Colors.black),
            ),
          ),
        ),
        body: search.text.isEmpty
            ? Container(
                height: 600.h, child: Image.asset('assets/images/search.png'))
            : FutureBuilder<List<Sneakers>>(
                future: Helper().search(search.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: reuseableText(
                        text: 'Error Retriving the data',
                        style: appstyle(20, Colors.black, FontWeight.bold),
                      ),
                    );
                  } else {
                    final shoes = snapshot.data;
                    if (shoes == null || shoes.isEmpty) {
                      return Center(
                        child: reuseableText(
                          text: 'No products found',
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: shoes.length,
                        itemBuilder: ((context, index) {
                          final shoe = shoes[index];
                          return GestureDetector(
                              onTap: () {
                                productProvider.shoeSizes = shoe.sizes;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductPage(sneakers: shoe)));
                              },
                              child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Container(
                                      height: 90.h,
                                      width: 325,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade500,
                                                spreadRadius: 5,
                                                blurRadius: 0.3,
                                                offset: const Offset(0, 1))
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(12.h),
                                                child: CachedNetworkImage(
                                                  imageUrl: shoe.imageUrl[0],
                                                  width: 70.w,
                                                  height: 70.h,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 12.h, left: 20.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    reuseableText(
                                                        text: shoe.name,
                                                        style: appstyle(
                                                            16,
                                                            Colors.black,
                                                            FontWeight.w600)),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    reuseableText(
                                                        text: shoe.category,
                                                        style: appstyle(
                                                            13,
                                                            Colors
                                                                .grey.shade500,
                                                            FontWeight.w600)),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    reuseableText(
                                                        text: "\$${shoe.price}",
                                                        style: appstyle(
                                                            13,
                                                            Colors
                                                                .grey.shade500,
                                                            FontWeight.w600)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )));
                        }),
                      );
                    }
                  }
                }));
  }
}
