import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cookbook/recipeDetails.dart';
import 'package:cookbook/recipeData.dart';

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
          ResearchRecipes(),
          SizedBox(height: 10),
          Expanded(
            child: ListOfRecipes(),
          )
        ]),
      ), //
    );
  }
}

/// Zone de recherche d'une recette
class ResearchRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(1, 3),
                    )
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Recherche',
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            )),
            SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: UIColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(1, 3),
                    )
                  ]),
              child: ElevatedButton(
                ///@TODO
                onPressed: null,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                ),
              ),
            )
          ],
        ));
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

///Une recette dans la liste sous forme de carte
class RecipeCard extends StatelessWidget {
  final Map recipeData;
  RecipeCard(this.recipeData);
  @override
  Widget build(BuildContext context) {
    final DecorationImage photo = DecorationImage(
        image: AssetImage('rss/noPhoto.png'), fit: BoxFit.cover);
    //@TODO a gerer avec firebase (NetworkImage)

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyRecipePage(); //@TODO transferer les infos pour savoir quelle recette afficher
            },
            settings: RouteSettings(
              arguments: recipeData,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(1, 3),
              )
            ]),
        child: Column(
          children: [
            Container(
              //La photo

              height: 80,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: photo,
              ),
            ),
            Container(
              child: Column(
                children: [
                  //le titre
                  Text(
                    recipeData['title'],
                    style: appFont,
                  ),
                  Text(
                    recipeData['description'],
                    style: appFont,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
