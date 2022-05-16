import 'package:flutter/material.dart';
import 'package:meal_app/classes/meal.dart';
import 'package:meal_app/pages/meals_details_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  void selectMeal(BuildContext ctx) {
    Navigator.pushNamed(
      ctx,
      MealsDetailsPage.routeName,
      arguments: id,
    );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.hard:
        return "Hard";
      case Complexity.medium:
        return "Challenging";
      case Complexity.simple:
        return "Simple";
      default:
        return "default";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      case Affordability.pricey:
        return "Pricey";
      default:
        return "default";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    width: 250,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.caption,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
