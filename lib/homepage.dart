import 'package:flutter/material.dart';
import 'package:spi/models/user_model.dart';
import 'package:spi/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// /**Riverpod */

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

class Homepage extends ConsumerWidget {
  @override
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(UserDataProvider);
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod'),
      ),
      body: data.when(
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();
            print(userList);
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Card(
                      color: Color.fromARGB(255, 16, 100, 169),
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].firstname,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  itemCount: userList.length,
                ))
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
