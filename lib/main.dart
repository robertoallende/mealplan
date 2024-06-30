import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealplan/bloc/bloc.dart';
import 'package:mealplan/pages/pages.dart';
import 'package:mealplan/providers/providers.dart';
import 'package:mealplan/repositories/repositories.dart';

void main() {
  runApp(MyApp());
}

/// The main entry point of the application.
/// Sets up the theme, home page, and BlocProvider for dependency injection.
/// Initializes MealPlanProvider and MealPlanRepository.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealPlanProvider = MealPlanProvider();
    final mealPlanRepository = MealPlanRepository(mealPlanProvider: mealPlanProvider);

    return MaterialApp(
      title: 'Meal Plan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => MealPlanBloc(mealPlanRepository: mealPlanRepository)..add(LoadMealPlan()),
        child: MealPlanPage(),
      ),
    );
  }
}