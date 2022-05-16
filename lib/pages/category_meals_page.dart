import 'package:flutter/material.dart';
import 'package:meal_app/classes/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/Category-Meals';
  // final String categoryId;
  // final String categoryTitle;
  const CategoryMealsPage({Key? key}) : super(key: key);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  @override
  Widget build(BuildContext context) {
    final passedArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryId = passedArguments['id'];
    final String? categoryTitle = passedArguments['title'];
    final categoryMeals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(categoryId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
