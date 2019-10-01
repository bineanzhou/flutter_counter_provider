import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';
import 'second_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('first screen rebuild');
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('FirstPage')),
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, _) {
          return Center(
            child: Text(
              'Value: ${_counter.value}',
              style: TextStyle(fontSize: textSize.toDouble()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
