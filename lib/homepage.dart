import 'package:flutter/material.dart';
import 'package:spi/provider/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderAPI'),
      ),
      body: Consumer<TodoProvider>(builder: ((context, value, child) {
        return ListView.builder(itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(todo.id.toString()),
            ),
            title: Text(todo.title),
          );
        });
      })),
    );
  }
}

/**Riverpod */
// final Provider = StateProvider<int>((ref) {
//   return 0;
// });

// class Homepage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var value = ref.watch(Provider);
//     // TODO: implement build
//     return Scaffold(
//       body: Center(
//           child: Text(
//         'value:$value',
//         style: Theme.of(context).textTheme.headlineLarge,
//       )),
//       floatingActionButton: Padding(
//           padding: EdgeInsets.only(left: 5),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               FloatingActionButton(
//                 onPressed: () => ref.read(Provider.state).state++,
//                 child: Icon(Icons.add),
//               ),
//               Expanded(child: Container()),
//               FloatingActionButton(
//                 onPressed: () => ref.read(Provider.state).state--,
//                 child: Icon(Icons.remove),
//               )
//             ],
//           )),
//     );
//   }
// }
