import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealplan/bloc/bloc.dart';
import 'package:mealplan/models/models.dart';
import 'package:mealplan/pages/meal_dropdown.dart';

/// Displays the current meal plan and provides options to update it.
/// Uses BlocBuilder to react to state changes from MealPlanBloc.
/// Contains dropdown menus for selecting meals for breakfast, lunch, and dinner.
class MealPlanPage extends StatelessWidget {
  void _selectMeal(BuildContext context, Meal meal, String mealType) {
    final mealPlanBloc = context.read<MealPlanBloc>();
    final currentState = mealPlanBloc.state;

    if (currentState is MealPlanLoaded) {
      final currentMealPlan = currentState.mealPlan;
      final updatedMealPlan = currentMealPlan.copyWith(
        breakfast: mealType == 'Breakfast' ? meal : currentMealPlan.breakfast,
        lunch: mealType == 'Lunch' ? meal : currentMealPlan.lunch,
        dinner: mealType == 'Dinner' ? meal : currentMealPlan.dinner,
      );

      mealPlanBloc.add(UpdateMealPlan(updatedMealPlan));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan'),
      ),
      body: BlocBuilder<MealPlanBloc, MealPlanState>(
        builder: (context, state) {
          if (state is MealPlanLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MealPlanLoaded) {
            final mealPlan = state.mealPlan;
            final availableMeals = state.availableMeals;

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealDropdown(
                      title: 'Breakfast',
                      selectedMeal: mealPlan.breakfast,
                      meals: availableMeals['breakfast']!,
                      onChanged: (meal) => _selectMeal(context, meal, 'Breakfast'),
                    ),
                    SizedBox(height: 20),
                    MealDropdown(
                      title: 'Lunch',
                      selectedMeal: mealPlan.lunch,
                      meals: availableMeals['lunch']!,
                      onChanged: (meal) => _selectMeal(context, meal, 'Lunch'),
                    ),
                    SizedBox(height: 20),
                    MealDropdown(
                      title: 'Dinner',
                      selectedMeal: mealPlan.dinner,
                      meals: availableMeals['dinner']!,
                      onChanged: (meal) => _selectMeal(context, meal, 'Dinner'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('Failed to load meal plan'));
          }
        },
      ),
    );
  }
}