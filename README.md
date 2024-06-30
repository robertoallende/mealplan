Meal Plan - Bloc Reference Project
==================================

Overview
--------

The Meal Plan project is a Flutter application that serves as a reference for implementing the Bloc (Business Logic Component) pattern. This project demonstrates how to use Bloc to manage state in a Flutter application, including fetching and updating data, handling user interactions, and updating the UI based on state changes.

Features
--------

- **State Management with Bloc:** Demonstrates the use of Bloc for managing application state.
- **Meal Plan Management:** Allows users to select and update their meal plans for breakfast, lunch, and dinner.
- **Provider and Repository Pattern:** Separates data fetching and business logic using Provider and Repository patterns.
- **Dynamic UI Updates:** Uses BlocBuilder to update the UI based on the current state.

Project Structure
-----------------

The project is structured as follows:

- **bloc:** Contains the Bloc implementation, including events, states, and the Bloc itself.

    - `meal_plan_bloc.dart`: Handles the business logic for loading and updating meal plans.
    - `meal_plan_event.dart`: Represents the events that can trigger state changes.
    - `meal_plan_state.dart`: Represents the different states of the Bloc.

- **models:** Contains the data models used in the application.

    - `meal.dart`: Represents a meal with a name and types (e.g., breakfast, lunch, dinner).
    - `meal_plan.dart`: Represents a meal plan with selected meals for breakfast, lunch, and dinner.

- **providers:** Handles the interaction with the data source.

    - `meal_plan_provider.dart`: Manages data for available meals and handles get/set operations for meal plans.

- **repositories:** Acts as an intermediary between the provider and the Bloc.

    - `meal_repository.dart`: Fetches and updates meal plans using the provider.

- **pages:** Contains the UI components of the application.

    - `meal_page_plan.dart`: The main page displaying and updating the meal plan.
    - `meal_dropdown.dart`: A reusable widget for selecting meals.

- **main.dart:** The entry point of the application, setting up the theme, home page, and BlocProvider.

Getting Started
---------------

### Prerequisites

- Flutter SDK: `Install Flutter <https://flutter.dev/docs/get-started/install>`_

### Installation

1. **Clone the repository:**

   .. code-block:: shell

   git clone https://github.com/yourusername/meal_plan_bloc_reference.git
   cd meal_plan_bloc_reference

2. **Install dependencies:**

   .. code-block:: shell

   flutter pub get

3. **Run the application:**

   .. code-block:: shell

   flutter run

Usage
-----

1. **Launch the application:**

    - Open your preferred emulator or connect a physical device.
    - Run the application using `flutter run`.

2. **Select Meals:**

    - Use the dropdown menus to select meals for breakfast, lunch, and dinner.
    - The selected meal plan will be displayed and can be updated dynamically.

Project Structure Details
-------------------------

### Bloc

- **MealPlanBloc:** Handles the business logic for loading and updating meal plans. Uses events (`LoadMealPlan`, `UpdateMealPlan`) to trigger state changes and emits states (`MealPlanInitial`, `MealPlanLoading`, `MealPlanLoaded`, `MealPlanError`) to update the UI.

- **MealPlanEvent:** Defines the events that can be dispatched to the Bloc, such as loading and updating the meal plan.

- **MealPlanState:** Defines the possible states of the Bloc, including initial, loading, loaded, and error states.

### Models

- **Meal:** Represents a meal with a name and its types (breakfast, lunch, dinner).

- **MealPlan:** Represents a meal plan containing selected meals for breakfast, lunch, and dinner.

### Providers

- **MealPlanProvider:** Manages the interaction with the data source to retrieve and persist meal plans. Provides methods to get and set meal plans and available meals.

### Repositories

- **MealPlanRepository:** Acts as an intermediary between the provider and the Bloc, fetching and updating meal plans using the provider.

### UI

- **MealPlanPage:** The main page that displays the current meal plan and provides options to update it. Uses BlocBuilder to react to state changes from MealPlanBloc.

- **MealDropdown:** A reusable widget that displays a dropdown for selecting a meal.

Contributing
------------

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

License
-------

This project is licensed under the MIT License. See the `LICENSE` file for details.
