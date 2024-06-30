import 'package:equatable/equatable.dart';
import 'package:mealplan/models/models.dart';

/// Represents the different states of the MealPlanBloc.
/// Includes initial, loading, loaded, and error states to manage UI updates.
abstract class MealPlanState extends Equatable {
  const MealPlanState();

  @override
  List<Object?> get props => [];
}

class MealPlanInitial extends MealPlanState {}

class MealPlanLoading extends MealPlanState {}

class MealPlanLoaded extends MealPlanState {
  final MealPlan mealPlan;
  final Map<String, List<Meal>> availableMeals;

  const MealPlanLoaded(this.mealPlan, this.availableMeals);

  @override
  List<Object?> get props => [mealPlan, availableMeals];
}

class MealPlanError extends MealPlanState {}
