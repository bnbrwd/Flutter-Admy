import 'package:flutter/material.dart';
import 'package:meals_app_udm_basic/dummy_data.dart';
import 'package:meals_app_udm_basic/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Daily Meals'),
      //   centerTitle: true,
      // ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView(
          padding: const EdgeInsets.all(25),
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.color,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
