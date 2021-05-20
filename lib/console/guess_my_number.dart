import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guess_my_number/utils/utils.dart';

import '../utils/utils.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// _number --> saves the input
  String? _number = "";
  /// _todo --> message related to how is the input compared to the number that should be guessed
  String? _todo;
  /// _textButton --> It changes from Guess to Reset
  String? _textButton = "Guess";
  /// _controller --> controller for the TextField
  TextEditingController? _controller = new TextEditingController();
  /// _random --> number to be guessed
  int? _random = getRandom();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Guess my number'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "I'm thinking of a number between 1 and 100.",
                textScaleFactor: 3,
                textAlign: TextAlign.center,
              ),
              Text(
                "It's your turn to guess my number!",
                textScaleFactor: 1.6,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Material(
                  type: MaterialType.card,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Try a number!",
                          textScaleFactor: 2,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.3)),
                          textAlign: TextAlign.center,
                        ),
                        if (_todo != null)
                          Text(
                            _todo!,
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        TextField(
                          controller: _controller,
                          decoration: new InputDecoration(labelText: ""),
                          onChanged: (String value) {
                            _number = value;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            /// check if it is at the end of the game or in the middle of the game
                            if (_textButton == "Reset") {
                              setState(() {
                                _textButton = "Guess";
                              });
                              _random = getRandom();
                            } else {
                              setState(() {
                                _todo = checkNumber(
                                    _random!, int.tryParse(_number!)!);
                              });
                              /// number was guessed
                              if (_todo == "Well done") {
                                _textButton = "Reset";
                              }
                            }
                            setState(() {
                              _controller!.clear();
                            });
                          },
                          child: Text(
                            _textButton!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
