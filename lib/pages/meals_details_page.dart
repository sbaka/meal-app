import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/classes/dummy_data.dart';

class MealsDetailsPage extends StatelessWidget {
  static const routeName = "/meals-details";
  const MealsDetailsPage({Key? key}) : super(key: key);

  Widget _ingredientList(e, ctx) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      padding: const EdgeInsets.only(
        left: 30,
        top: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Theme.of(ctx).primaryColor,
              const Color(0xff7bed9f),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              // spreadRadius: 0.2,
              blurRadius: 6,
            ),
          ]),
      child: Text(
        e,
        style: TextStyle(
          color: Colors.grey[50],
          // fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _stepsList(e, ctx) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          padding: const EdgeInsets.only(
            left: 30,
            top: 10,
          ),
          child: Text(
            e,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 18,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 30),
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: meal.ingredients
                          .map(
                            (e) => _ingredientList(e, context),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 30),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        ...meal.steps
                            .map((e) => _stepsList(e, context))
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
