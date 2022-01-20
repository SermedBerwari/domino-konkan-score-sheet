import 'package:flutter/material.dart';

import 'widgets/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.red])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Create Score Sheet App',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      HomeWidgetMethods()
                          .showPlayersNameInsertDialog(context, 'domino');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Domino New Game',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      HomeWidgetMethods()
                          .showPlayersNameInsertDialog(context, 'konkan');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'KonKan 2P New Game',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      HomeWidgetMethods().showKonkanFourDialog(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'KonKan 4P New Game',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
