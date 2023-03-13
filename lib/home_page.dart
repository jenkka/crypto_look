import 'dart:convert';

import 'package:crypto_look/data/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

//Es importante usar un listview y dentro crear listTile
class _HomePageState extends State<HomePage> {
  var exchanges = jsonDecode(CRYPTO_EXCHANGES);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto Scam")),
      drawer: const Drawer(),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: ConstrainedBox(
                // ignore: prefer_const_constructors
                constraints: BoxConstraints(
                  maxWidth: 50,
                  maxHeight: 50,
                ),
                child:
                    Image.network(exchanges[index]["image"], fit: BoxFit.cover),
              ),
              title: Text("${exchanges[index]["name"]}"),
              subtitle: Text(
                  "${exchanges[index]["country"]} \n${exchanges[index]["year_established"]}"),
              trailing: Stack(
                alignment: Alignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  Icon(
                    Icons.circle,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    "${exchanges[index]["trust_score"]}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
