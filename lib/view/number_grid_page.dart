import 'package:algorithm_task/provider/number_grid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberGridPage extends StatelessWidget {
  const NumberGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NumberGridModel>(context);
    final screenSize = MediaQuery.of(context).size;
    final gridItemSize = (screenSize.width - 32) / 6; 

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.purple.shade800],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Algorithm viewer',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Current Rule: ${model.currentRule}',
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    final number = index + 1;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: model.isHighlighted(number)
                            ? Colors.amber.withOpacity(0.7)
                            : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '$number',
                          style: TextStyle(
                            fontSize: gridItemSize * 0.4,
                            fontWeight: FontWeight.bold,
                            color: model.isHighlighted(number)
                                ? Colors.black87
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildRuleButton(context, 'Odd', model),
                    _buildRuleButton(context, 'Even', model),
                    _buildRuleButton(context, 'Prime', model),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: _buildRuleButton(context, 'Fibonacci', model),
                    ),
                    IconButton(onPressed: ()=>model.resetGrid(), icon: const Icon(Icons.refresh),color: Colors.yellow,iconSize: 30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleButton(BuildContext context, String rule, NumberGridModel model) {
    return ElevatedButton(
      onPressed: () => model.changeRule(rule),
      style: ElevatedButton.styleFrom(
        foregroundColor: model.currentRule == rule ? Colors.black87 : Colors.white, backgroundColor: model.currentRule == rule ? Colors.amber : Colors.white.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        rule,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}