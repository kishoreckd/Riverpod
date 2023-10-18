import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider = StateProvider<int>((ref) {
  return 0;
});

class Homepage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(Provider);
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: Text(
        'value:$value',
        style: Theme.of(context).textTheme.headlineLarge,
      )),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => ref.read(Provider.state).state++,
                child: Icon(Icons.add),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                onPressed: () => ref.read(Provider.state).state--,
                child: Icon(Icons.remove),
              )
            ],
          )),
    );
  }
}
