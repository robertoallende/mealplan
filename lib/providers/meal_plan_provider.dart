import 'package:mealplan/models/models.dart';
import 'dart:math';

/// Handles the interaction with the data source to retrieve and persist meal plans.
/// Manages the data for available meals for breakfast, lunch, and dinner.
/// Provides methods to get and set meal plans and available meals.
class MealPlanProvider {
  MealPlan? _storedMealPlan;

  Future<MealPlan> getMealPlan() async {
    if (_storedMealPlan != null) {
      return _storedMealPlan!;
    }

    _storedMealPlan = generateRandomMealPlan();
    return _storedMealPlan!;
  }

  Future<void> setMealPlan(MealPlan mealPlan) async {
    _storedMealPlan = mealPlan;
  }

  Map<String, List<Meal>> getAvailableMeals() {
    return {
      'breakfast': breakfastMeals,
      'lunch': lunchMeals,
      'dinner': dinnerMeals,
    };
  }
}


/// Mocked values for meals
final List<Meal> breakfastMeals = [
  const Meal(name: 'Pancakes', mealTypes: ['Breakfast']),
  const Meal(name: 'Oatmeal', mealTypes: ['Breakfast']),
  const Meal(name: 'Smoothie', mealTypes: ['Breakfast']),
  const Meal(name: 'Avocado Toast', mealTypes: ['Breakfast']),
  const Meal(name: 'Scrambled Eggs', mealTypes: ['Breakfast']),
  const Meal(name: 'Bagel with Cream Cheese', mealTypes: ['Breakfast']),
  const Meal(name: 'French Toast', mealTypes: ['Breakfast']),
  const Meal(name: 'Yogurt Parfait', mealTypes: ['Breakfast']),
  const Meal(name: 'Breakfast Burrito', mealTypes: ['Breakfast']),
  const Meal(name: 'Granola Bar', mealTypes: ['Breakfast']),
  const Meal(name: 'Muffins', mealTypes: ['Breakfast']),
];

final List<Meal> lunchMeals = [
  const Meal(name: 'Grilled Cheese Sandwich', mealTypes: ['Lunch']),
  const Meal(name: 'BLT Sandwich', mealTypes: ['Lunch']),
  const Meal(name: 'Chicken Noodle Soup', mealTypes: ['Lunch']),
  const Meal(name: 'Pasta Salad', mealTypes: ['Lunch']),
  const Meal(name: 'Fish Tacos', mealTypes: ['Lunch']),
  const Meal(name: 'Caprese Salad', mealTypes: ['Lunch']),
  const Meal(name: 'Club Sandwich', mealTypes: ['Lunch']),
  const Meal(name: 'Lasagna', mealTypes: ['Lunch']),
  const Meal(name: 'Chicken Noodle Soup', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Pasta Salad', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Fish Tacos', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Caprese Salad', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Club Sandwich', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Spaghetti Bolognese', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Grilled Salmon', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Chicken Alfredo', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Beef Tacos', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Vegetable Stir Fry', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'BBQ Ribs', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Stuffed Peppers', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Shrimp Scampi', mealTypes: ['Lunch', 'Dinner']),
];

final List<Meal> dinnerMeals = [
  const Meal(name: 'Spaghetti Bolognese', mealTypes: ['Dinner']),
  const Meal(name: 'Grilled Salmon', mealTypes: ['Dinner']),
  const Meal(name: 'Chicken Alfredo', mealTypes: ['Dinner']),
  const Meal(name: 'Beef Tacos', mealTypes: ['Dinner']),
  const Meal(name: 'Vegetable Stir Fry', mealTypes: ['Dinner']),
  const Meal(name: 'Lamb Chops', mealTypes: ['Dinner']),
  const Meal(name: 'Stuffed Peppers', mealTypes: ['Dinner']),
  const Meal(name: 'Shrimp Scampi', mealTypes: ['Dinner']),
  const Meal(name: 'Steak and Potatoes', mealTypes: ['Dinner']),
  const Meal(name: 'Chicken Noodle Soup', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Pasta Salad', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Fish Tacos', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Caprese Salad', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Club Sandwich', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Spaghetti Bolognese', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Grilled Salmon', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Chicken Alfredo', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Beef Tacos', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Vegetable Stir Fry', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'BBQ Ribs', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Stuffed Peppers', mealTypes: ['Lunch', 'Dinner']),
  const Meal(name: 'Shrimp Scampi', mealTypes: ['Lunch', 'Dinner']),
];

// Function to generate a random meal plan
MealPlan generateRandomMealPlan() {
  final random = Random();
  final breakfast = breakfastMeals[random.nextInt(breakfastMeals.length)];
  final lunch = lunchMeals[random.nextInt(lunchMeals.length)];
  final dinner = dinnerMeals[random.nextInt(dinnerMeals.length)];

  return MealPlan(
    breakfast: breakfast,
    lunch: lunch,
    dinner: dinner,
  );
}

