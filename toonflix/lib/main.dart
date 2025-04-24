import 'package:flutter/material.dart';
import 'package:toonflix/Widgets/button.dart';
import 'package:toonflix/Widgets/currency_card.dart';
//"dart.previewFlutterUiGuides": true, -> settin.json에 복붙

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      backgroundColor: Color(0xFF181818), 
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 40,
          ), 
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('Welcome back',
                       style: TextStyle(
                          color: Colors.white.withAlpha((0.8 * 255).round()),
                          fontSize: 15,
                         ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white.withAlpha((0.8 * 255).round()),
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$5 194 382',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    text: 'Transfer', 
                    bgColor: Color(0xFFF1B33B), 
                    txColor: Colors.black,
                    ),
                  Button(text: 'Request', 
                  bgColor: Color(0xFF1F2123), 
                  txColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white.withAlpha((0.8 * 255).round()),
                      fontSize: 15,
                    ),
                    ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CurrencyCard(
              name: 'Euro',
              code: 'EUR', 
              amount: '6 248', 
              icon: Icons.euro_rounded,
              isInverted: false,
              order: 0,
              ),
              
              CurrencyCard(
              name: 'Bitcoin',
              code: 'BCT', 
              amount: '6 248', 
              icon: Icons.currency_bitcoin,
              isInverted: true,
              order: -3,
              ),
              CurrencyCard(
              name: 'Dollar',
              code: 'USD', 
              amount: '6 248', 
              icon: Icons.attach_money_outlined,
              isInverted: false,
              order: -6,
              ),
            ],
          ),
        ),
      ), 
      ),
    );
  }
}
