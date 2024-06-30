import 'package:equatable/equatable.dart';
import 'package:mealplan/models/models.dart';

/// Represents the various events that can trigger state changes in MealPlanBloc.
/// Includes events for loading and updating the meal plan.
abstract class MealPlanEvent extends Equatable {
  const MealPlanEvent();

  @override
  List<Object?> get props => [];
}

class LoadMealPlan extends MealPlanEvent {}

class UpdateMealPlan extends MealPlanEvent {
  final MealPlan mealPlan;

  const UpdateMealPlan(this.mealPlan);

  @override
  List<Object?> get props => [mealPlan];
}
