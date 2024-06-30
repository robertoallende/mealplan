import 'package:flutter/material.dart';
import 'package:mealplan/models/models.dart';

/// A reusable widget that displays a dropdown for selecting a meal.
/// Takes a title, selected meal, list of available meals, and a callback function.
/// Used in MealPlanPage to display meal selection options.
class MealDropdown extends StatelessWidget {
  final String title;
  final Meal? selectedMeal;
  final List<Meal> meals;
  final ValueChanged<Meal> onChanged;

  const MealDropdown({
    Key? key,
    required this.title,
    required this.selectedMeal,
    required this.meals,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        DropdownButton<Meal>(
          value: selectedMeal,
          hint: Text('Select $title'),
          onChanged: (Meal? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          items: meals.map((Meal meal) {
            return DropdownMenuItem<Meal>(
              value: meal,
              child: Text(meal.name),
            );
          }).toList(),
        ),
      ],
    );
  }
}
