import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: screenSize.height * 0.2,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Продукты',
                  style: textTheme.displayMedium,
                ),
              ),
            );
          } else {
            return Container(
              height: screenSize.height * 0.2,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Заказы',
                  style: textTheme.displayMedium,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
