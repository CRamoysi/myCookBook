import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const UIColor = Colors.deepPurple;
final appFont = GoogleFonts.glegoo(fontSize: 18, fontWeight: FontWeight.w800);

/// The homepage
class MyRecipePage extends StatelessWidget {
  const MyRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> recipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: new AppBar(
          title: Text(recipe["title"]),
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
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                //La photo
                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage('rss/noPhoto.png'), fit: BoxFit.cover),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: Text(
                  "Ingredients:",
                  textAlign: TextAlign.left,
                  style: appFont,
                ),
              ),
              Container(
                child: ListOfIngredient(recipe["ingredient"]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: Text(
                  "Taches:",
                  textAlign: TextAlign.left,
                  style: appFont,
                ),
              ),
              Container(
                child: ListOfTask(recipe["task"]),
              ),
            ],
          ), //
        ));
  }
}

class ListOfIngredient extends StatelessWidget {
  final List<Map<String, String>> recipeIngredients;

  const ListOfIngredient(recipeIngredients)
      : this.recipeIngredients = recipeIngredients;

  @override
  Widget build(BuildContext context) {
    //print(recipeIngredients);
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipeIngredients.length,
      itemBuilder: (BuildContext context, int index) {
        //@TODO cette liste devra etre peuplé avec une requette firebase
        return Text(" - " +
            recipeIngredients[index]["name"]! +
            ": " +
            recipeIngredients[index]["quantity"]!);
      },
    );
  }
}

class ListOfTask extends StatelessWidget {
  final List<String> recipeTasks;

  const ListOfTask(recipeTasks) : this.recipeTasks = recipeTasks;

  @override
  Widget build(BuildContext context) {
    //print(recipeIngredients);
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipeTasks.length,
      itemBuilder: (BuildContext context, int index) {
        //@TODO cette liste devra etre peuplé avec une requette firebase

        return Text(" o " + recipeTasks[index]);
      },
    );
  }
}
