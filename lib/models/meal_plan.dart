import 'package:equatable/equatable.dart';
import 'meal.dart';

/// Represents a meal plan with selected meals for breakfast, lunch, and dinner.
/// Used to store and update the current meal plan in the application.
class MealPlan extends Equatable {
  final Meal? breakfast;
  final Meal? lunch;
  final Meal? dinner;

  const MealPlan({
    this.breakfast,
    this.lunch,
    this.dinner,
  });

  MealPlan copyWith({
    Meal? breakfast,
    Meal? lunch,
    Meal? dinner,
  }) {
    return MealPlan(
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
    );
  }

  @override
  List<Object?> get props => [breakfast, lunch, dinner];
}
