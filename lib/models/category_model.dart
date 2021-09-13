import '../models/expense_model.dart';

class CategoryModel {
  final String name;
  final double maxAmount;
  final List<ExpenseModel> expenses;

  CategoryModel(
      {required this.name, required this.maxAmount, required this.expenses});
}
