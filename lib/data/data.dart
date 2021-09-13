import 'dart:math';

import '../models/category_model.dart';
import '../models/expense_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<ExpenseModel> expenses = [
    ExpenseModel(name: 'Item 0', cost: rand.nextDouble() * 90),
    ExpenseModel(name: 'Item 1', cost: rand.nextDouble() * 90),
    ExpenseModel(name: 'Item 2', cost: rand.nextDouble() * 90),
    ExpenseModel(name: 'Item 3', cost: rand.nextDouble() * 90),
    ExpenseModel(name: 'Item 4', cost: rand.nextDouble() * 90),
    ExpenseModel(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];
  return expenses;
}

List<CategoryModel> categories = [
  CategoryModel(name: 'Food', maxAmount: 450, expenses: _generateExpenses()),
  CategoryModel(
      name: 'Clothing', maxAmount: 500, expenses: _generateExpenses()),
  CategoryModel(
      name: 'Utilities', maxAmount: 600, expenses: _generateExpenses()),
  CategoryModel(
      name: 'Entertainment', maxAmount: 330, expenses: _generateExpenses()),
  CategoryModel(
      name: 'Transportation', maxAmount: 500, expenses: _generateExpenses()),
  CategoryModel(
      name: 'Housing', maxAmount: 1000, expenses: _generateExpenses()),
];
