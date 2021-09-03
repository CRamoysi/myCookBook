import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const UIColor = Colors.deepPurple;
final appFont = GoogleFonts.glegoo(fontSize: 18, fontWeight: FontWeight.w800);

/// The homepage
class MyRecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Ma Recette"),
          centerTitle: true,
          backgroundColor: UIColor,
          leading: new IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: new Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Container(), //
        ));
  }
}
