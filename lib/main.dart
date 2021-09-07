import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cookbook/recipe_data.dart';

import 'package:cookbook/widget/recipe_research_bar.dart';
import 'package:cookbook/widget/recipe_card.dart';

void main() => runApp(MyApp());

const UIColor = Colors.deepPurple;
final appFont = GoogleFonts.glegoo(fontSize: 18, fontWeight: FontWeight.w800);

/// Application constructor
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Mes recettes", home: MyHomePage());
  }
}

/// The homepage
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Mes Recettes"),
        centerTitle: true,
        backgroundColor: UIColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          RecipeResearchBar(),
          SizedBox(height: 10),
          Expanded(
            child: ListOfRecipes(),
          )
        ]),
      ), //
    );
  }
}

///Zone d'affichage de la liste de recette
class ListOfRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipeList.length,
      itemBuilder: (BuildContext context, int index) {
        //@TODO cette liste devra etre peuplé avec une requette firebase
        return RecipeCard(recipeList[index]);
      },
    );
  }
}
