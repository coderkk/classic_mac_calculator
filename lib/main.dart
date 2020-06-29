import 'package:flutter/material.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  Calc calc = Calc();

  void userPressButton(String num) {
    setState(() {
      calc.compute(num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PressStart2P'),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.crop_square,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Calculator',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage("images/stock-vector-dot-pattern.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            calc.displayNumber,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                NumPadButton(
                                  caption: 'C',
                                  onPressed: () => userPressButton('C'),
                                ),
                                NumPadButton(
                                  caption: '=',
                                  onPressed: () => userPressButton('='),
                                ),
                                NumPadButton(
                                  caption: '/',
                                  onPressed: () => userPressButton('/'),
                                ),
                                NumPadButton(
                                  caption: '*',
                                  onPressed: () => userPressButton('*'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                NumPadButton(
                                  caption: '7',
                                  onPressed: () => userPressButton('7'),
                                ),
                                NumPadButton(
                                  caption: '8',
                                  onPressed: () => userPressButton('8'),
                                ),
                                NumPadButton(
                                  caption: '9',
                                  onPressed: () => userPressButton('9'),
                                ),
                                NumPadButton(
                                  caption: '-',
                                  onPressed: () => userPressButton('/'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                NumPadButton(
                                  caption: '4',
                                  onPressed: () => userPressButton('4'),
                                ),
                                NumPadButton(
                                  caption: '5',
                                  onPressed: () => userPressButton('5'),
                                ),
                                NumPadButton(
                                  caption: '6',
                                  onPressed: () => userPressButton('6'),
                                ),
                                NumPadButton(
                                  caption: '+',
                                  onPressed: () => userPressButton('+'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                NumPadButton(
                                  caption: '1',
                                  onPressed: () => userPressButton('1'),
                                ),
                                NumPadButton(
                                  caption: '2',
                                  onPressed: () => userPressButton('2'),
                                ),
                                NumPadButton(
                                  caption: '3',
                                  onPressed: () => userPressButton('3'),
                                ),
                                NumPadButton(
                                  caption: "=",
                                  onPressed: () => userPressButton('='),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                    flex: 2,
                                    child: NumPadButton(
                                      caption: '  0  ',
                                      onPressed: () => userPressButton('0'),
                                    )),
                                Flexible(
                                    flex: 1,
                                    child: NumPadButton(
                                      caption: '.',
                                      onPressed: () => userPressButton('.'),
                                    )),
                                Spacer(flex: 1),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Calc {
  String _operator = "";
  String displayNumber = "0";
  double memoryNumber = 0;
  double computeredNumber = 0;

  void numberInput(String num) {
    if (displayNumber.length < 10) {
      if (displayNumber == "0") {
        displayNumber = num;
      } else if (num == ".") {
        if (displayNumber.indexOf(".") == -1) {
          displayNumber = displayNumber + num;
        }
      } else {
        displayNumber = displayNumber + num;
      }
    }
  }

  String trimZero(String result) {
    print("trimZero: $result");
    double doubleResult = double.tryParse(result);
    int intResult = doubleResult.toInt();

    double different = doubleResult - intResult.toDouble();

    return (different == 0) ? intResult.toString() : doubleResult.toString();
  }

  void compute(String userInput) {
    if (userInput == "+" ||
        userInput == "-" ||
        userInput == "/" ||
        userInput == "*" ||
        userInput == "=") {
      double result = 0;
      switch (_operator) {
        case "+":
          {
            result = memoryNumber + double.tryParse(displayNumber);
            displayNumber = result.toString();
          }
          break;

        case "-":
          {
            result = memoryNumber - double.tryParse(displayNumber);
            displayNumber = result.toString();
          }
          break;

        case "*":
          {
            result = memoryNumber * double.tryParse(displayNumber);
            displayNumber = result.toString();
          }
          break;

        case "/":
          {
            result = memoryNumber / double.tryParse(displayNumber);
            displayNumber = result.toString();
          }
          break;

        default:
          {
            result = double.tryParse(displayNumber);
            displayNumber = "0";
          }
          break;
      }

      _operator = userInput;
      memoryNumber = result;
      displayNumber = trimZero(displayNumber);
    } else if (userInput == "C") {
      displayNumber = "0";
      _operator = "";
      memoryNumber = 0;
    } else {
      numberInput(userInput);
    }
  }
}

class NumPadButton extends StatefulWidget {
  final String caption;
  final Function onPressed;

  NumPadButton({this.caption, this.onPressed});

  @override
  _NumPadButtonState createState() => _NumPadButtonState();
}

class _NumPadButtonState extends State<NumPadButton> {
  bool _userPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (events) {
        setState(() {
          _userPressed = true;
        });
      },
      onTapUp: (events) {
        setState(() {
          _userPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _userPressed = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: (_userPressed) ? Colors.black : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Text(
          widget.caption,
          style: TextStyle(
            color: (_userPressed) ? Colors.white : Colors.black,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
