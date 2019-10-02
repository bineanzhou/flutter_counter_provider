import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';
import 'second_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final _counter = Provider.of<CounterModel>(context);
//    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('First Page')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
          ),
        ],
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, _) {
          return Center(
            child: Text(
              'Value: ${counter.value}',
              style: TextStyle(
                fontSize: textSize.toDouble(),
              ),
            ),
          );
        },
      ),

      /*  body: Center(
        child: Text(
          'Value: ${_counter.value}',
          style: TextStyle(fontSize: textSize),
        ),
      ),*/

      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
              onPressed: () => counter.increment(),
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
