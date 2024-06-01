import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sneaker_model.dart';
import 'package:flutter_application_1/views/shared/stagger_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class lastestShoes extends StatelessWidget {
  const lastestShoes({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          final male = snapshot.data!;
          return MasonryGridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: male.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final shoe = male[index];
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: StaggerTile(
                  imageUrl: shoe.imageUrl[0],
                  name: shoe.name,
                  price: "\$${shoe.price}",
                ),
              );
            },
          );
        }
      },
    );
  }
}
