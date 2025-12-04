import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import '../widgets/calculator_button.dart';
import '../utils/app_colors.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buttons = [
      'AC',
      'DEL',
      ':',
      'x',
      '7',
      '8',
      '9',
      '-',
      '4',
      '5',
      '6',
      '+',
      '1',
      '2',
      '3',
      '=',
      '.',
      '0',
      '00',
      '',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Consumer<CalculatorProvider>(
                builder: (context, provider, child) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          provider.displayText,
                          style: const TextStyle(
                            fontSize: 32,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),

                        Text(
                          provider.result.isEmpty
                              ? provider.displayText
                              : provider.result,
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    final text = buttons[index];

                    if (text.isEmpty) return const SizedBox();

                    bool isAccented = [
                      '=',
                      '/',
                      'x',
                      '-',
                      '+',
                      ':',
                    ].contains(text);
                    bool isDanger = ['AC', 'DEL'].contains(text);

                    if (text == '=') isAccented = true;

                    return CalculatorButton(
                      label: text,
                      isAccented: isAccented,
                      isDanger: isDanger,
                      onTap: () {
                        context.read<CalculatorProvider>().onButtonPress(text);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
