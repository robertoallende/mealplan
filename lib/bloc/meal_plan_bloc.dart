import 'package:bloc/bloc.dart';
import 'package:mealplan/repositories/repositories.dart';
import 'meal_plan_event.dart';
import 'meal_plan_state.dart';

/// Handles the business logic for loading and updating meal plans.
/// Uses the MealPlanRepository to fetch and store data.
/// Emits different states based on the actions and data fetched.
class MealPlanBloc extends Bloc<MealPlanEvent, MealPlanState> {
  final MealPlanRepository mealPlanRepository;

  MealPlanBloc({required this.mealPlanRepository}) : super(MealPlanInitial()) {
    on<LoadMealPlan>(_onLoadMealPlan);
    on<UpdateMealPlan>(_onUpdateMealPlan);
  }

  void _onLoadMealPlan(LoadMealPlan event, Emitter<MealPlanState> emit) async {
    emit(MealPlanLoading());
    try {
      final mealPlan = await mealPlanRepository.fetchMealPlan();
      final availableMeals = mealPlanRepository.getAvailableMeals();
      emit(MealPlanLoaded(mealPlan, availableMeals));
    } catch (_) {
      emit(MealPlanError());
    }
  }

  void _onUpdateMealPlan(UpdateMealPlan event, Emitter<MealPlanState> emit) async {
    emit(MealPlanLoading());
    try {
      await mealPlanRepository.updateMealPlan(event.mealPlan);
      final availableMeals = mealPlanRepository.getAvailableMeals();
      emit(MealPlanLoaded(event.mealPlan, availableMeals));
    } catch (_) {
      emit(MealPlanError());
    }
  }
}