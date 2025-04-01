
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final fetch=FutureProvider.autoDispose<String>((ref)=>fetchdata());

Future<String> fetchdata() async{
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
var data=await jsonDecode(response.body);
print(data[0]["body"]);
return data[0]["body"];
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
