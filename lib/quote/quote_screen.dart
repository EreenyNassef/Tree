import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tree/quote/quote.dart';
import 'package:tree/quote/service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<List<Quote>> future;

  @override
  void initState() {
    future = fetchQuote();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/1.jpeg"),
              fit: BoxFit.cover,
            )),
            child: FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200,
                            ),
                            Text(snapshot.data![index].quote),
                            Text(snapshot.data![index].author),
                            Text(snapshot.data![index].category)
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Icon(
                      Icons.wifi_off_rounded,
                      color: Colors.green.shade100,
                      size: 200,
                    );
                  }

                  return Center(
                      child: SizedBox(
                          height: 100, child: CircularProgressIndicator()));
                })));
  }
}
