import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/data.dart';
import '../widgets/bar_chart_widget.dart';
import '../models/category_model.dart';
import '../screens/category_screen.dart';
import '../helpers/color_help.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _buildCategory(CategoryModel category, double totalAmountSpent) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryScreen(
                      category: category,
                    )));
      },
      child: Card(
        shadowColor: Colors.black,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                      "\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)}/\$${category.maxAmount}",
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double maxBarWidth = constraints.maxWidth;

                final double percent = (category.maxAmount - totalAmountSpent) /
                    category.maxAmount;

                double barWitdh = percent * maxBarWidth;

                if (barWitdh < 0) {
                  barWitdh = 0;
                }

                return Stack(
                  children: [
                    Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    Container(
                      height: 20.0,
                      width: barWitdh,
                      decoration: BoxDecoration(
                          color: getColor(context, percent),
                          borderRadius: BorderRadius.circular(15.0)),
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0,
            floating: true,
            forceElevated: true,
            pinned: true,
            leading:
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Budget App"),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 0) {
              return Card(
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: BarChartWidget(
                    expenses: weeklySpending,
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0));
            } else {
              CategoryModel category = categories[index - 1];

              double totalAmountSpent = 0.0;

              for (var item in category.expenses) {
                totalAmountSpent += item.cost;
              }

              return _buildCategory(category, totalAmountSpent);
            }
          }, childCount: 1 + categories.length))
        ],
      ),
    );
  }
}
