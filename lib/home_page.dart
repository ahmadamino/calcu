
import 'package:calcul/buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final myTextStyle = TextStyle(fontSize: 30, color: Colors.red);

  final List<String> buttons = [
    'c',
    '()',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '+/-',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                        // alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                        )),
                    Container(
                        // alignment: Alignment.centerRight,
                        child: Text(userAnswer)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.grey[900], thickness: 2),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, i) {
                    if (i == 0) {
                      return MyButton(
                        color: Colors.grey[900],
                        textColor: Colors.red,
                        buttonText: buttons[i],
                        buttonTapeed: () {
                          setState(() {
                            userQuestion ='';
                          });
                        },
                      );
                    } else if (i == 19) {
                      return MyButton(
                        color: Colors.grey,
                        textColor: Colors.black,
                        buttonText: buttons[i],
                      );
                    } else {
                      return MyButton(
                        color: isOperater(buttons[i])
                            ? Colors.green
                            : Colors.grey[900],
                        textColor:
                        isOperater(buttons[i]) ? Colors.black : Colors.grey,
                        buttonText: buttons[i],
                        buttonTapeed: () {
                          setState(() {
                            userQuestion += buttons[i];
                          });
                        },

                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperater(String x) {
    if (x == '%' || x == '/' || x == '-' || x == '+' || x == '=' || x == '*') {
      return true;
    }
    return false;
  }
}