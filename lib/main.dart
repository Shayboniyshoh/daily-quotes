import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './quotes.dart';

void main() {
  runApp(const QuotesLocal());
}

class QuotesLocal extends StatefulWidget {
  const QuotesLocal({
    Key? key,
  }) : super(key: key);

  @override
  State<QuotesLocal> createState() => _QuotesLocalState();
}

class _QuotesLocalState extends State<QuotesLocal> {
  var quote = "";
  var author = "";

  setQuote() {
    var randomNumber = Random().nextInt(quotes.length);
    setState(() {
      quote = quotes[randomNumber]["quote"]!;
      author = quotes[randomNumber]["author"]!;
    });
  }

  @override
  initState() {
    setQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Daily Quotes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade100,
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    quote,
                    style: GoogleFonts.alata(
                      color: Colors.grey.shade300,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    author,
                    style: GoogleFonts.lobster(
                      color: Colors.white70,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 4,
          color: Colors.blueGrey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 80,
              child: Column(
                children: [
                  Center(
                    child: TextButton(
                      child: Image.asset(
                        'assets/shuffle.png',
                        width: 80,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      onPressed: setQuote,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
