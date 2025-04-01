
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetch=FutureProvider<String>((ref)=>fetchdata());

Future<String> fetchdata() async{
await Future.delayed(Duration(seconds: 3));
return "hamo";
}
class Second extends ConsumerWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetch);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child:data.when(
            data :(String value)=>Text(value),
            loading:()=>CircularProgressIndicator(),
            error:(error,stack)=>Text("error"),

          ) ,
        ),
      ),
    ) ;
  }
}
