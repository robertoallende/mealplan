import 'package:equatable/equatable.dart';

/// Represents a meal with a name and its types (e.g., breakfast, lunch, dinner).
/// Used to display meal options and manage meal plan selections.
class Meal extends Equatable {
  final String name;
  final List<String> mealTypes;

  const Meal({
    required this.name,
    required this.mealTypes,
  });

  @override
  List<Object> get props => [name, mealTypes];
}