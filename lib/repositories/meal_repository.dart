import 'package:mealplan/models/models.dart';
import 'package:mealplan/providers/providers.dart';

/// Interacts with MealPlanProvider to fetch and update meal plans.
/// Provides available meals data to the MealPlanBloc.
/// Abstracts the data source from the business logic layer.
class MealPlanRepository {
  final MealPlanProvider mealPlanProvider;

  MealPlanRepository({required this.mealPlanProvider});

  Future<MealPlan> fetchMealPlan() async {
    return await mealPlanProvider.getMealPlan();
  }

  Future<void> updateMealPlan(MealPlan mealPlan) async {
    await mealPlanProvider.setMealPlan(mealPlan);
  }

  Map<String, List<Meal>> getAvailableMeals() {
    return mealPlanProvider.getAvailableMeals();
  }
}