import 'package:flutter/material.dart';

import 'package:meal_app/classes/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Categories',
      //     style: Theme.of(context).textTheme.headline2,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map(
                //represents each item in the dummies
                (e) => CategoryItem(e.id, e.title, e.color),
              )
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
