import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cookbook/recipeDetails.dart';

void main() => runApp(MyApp());

const UIColor = Colors.deepPurple;
final appFont = GoogleFonts.glegoo(fontSize: 18, fontWeight: FontWeight.w800);

final List recipeList = [
  {
    'title': 'Pancake',
    'description': 'Pancake facile et rapide à faire.',
    'photo': '',
    'ingredient': {
      {'name': 'farine', 'quantity': '250 grammes'},
      {'name': 'Sucre', 'quantity': '30 grammes'},
      {'name': 'oeufs', 'quantity': '2'},
      {'name': 'levure', 'quantity': '1 sachet'},
      {'name': 'beurre', 'quantity': '65 grammes'},
      {'name': 'Sel', 'quantity': '1 pincée'},
      {'name': 'lait', 'quantity': '30 centilitre'}
    },
    'task': {
      'Melanger farine, sucre et levure',
      'Ajouter les oeufs',
      'Melanger avec le beurre fondu',
      'Delayer avec le lait',
      'Laisser reposer 1 heure au frigo',
      'Cuire dans une poele'
    }
  },
  {
    'title': 'Tiramisu',
    'description': 'Le super tiramisu',
    'photo': '',
    'ingredient': {
      {'name': 'oeuf', 'quantity': '3'},
      {'name': 'sucre roux', 'quantity': '100 grammes'},
      {'name': 'sucre vanillé', 'quantity': '1 sachet'},
      {'name': 'mascarpone', 'quantity': '250 grammes'},
      {'name': 'biscuits cuillere', 'quantity': '24'},
      {'name': 'café noir', 'quantity': '1 demi litre'},
      {'name': 'rhum', 'quantity': '1 demi verre'},
      {'name': 'cacao amer', 'quantity': '30 grammes'},
    },
    'task': {
      'Separer les oeufs',
      'Melanger les jaunes avec les sucres',
      'Ajouter le mascarpone',
      'Monter les blancs',
      'Incorporer les blancs dans le melange à base de mascarpone',
      'Preparer café + rhum et y tremper les biscuits',
      'Poser en couche alterner les biscuits et le melange',
      'Laisser reposez 4 heures au frigo'
    }
  }
];

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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            new ResearchRecipes(),
            SizedBox(height: 10),
            new ListOfRecipes()
          ]), //
        ));
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
    return Container(
        padding: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Column(
          children: recipeList.map((recipe) {
            //@TODO cette liste devra etre peuplé avec une requette firebase
            return RecipeCard(recipe);
          }).toList(),
        ));
  }
}

///Une recette dans la liste sous forme de carte
class RecipeCard extends StatelessWidget {
  final Map recipeData;
  RecipeCard(this.recipeData);
  @override
  Widget build(BuildContext context) {
    final DecorationImage photo = recipeData['photo'] == ''
        ? DecorationImage(
            image: AssetImage('rss/noPhoto.png'), fit: BoxFit.cover)
        : null; //@TODO a gerer avec firebase (NetworkImage)

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new MyRecipePage(); //@TODO transferer les infos pour savoir quelle recette afficher
            },
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
        //child: Text(recipeData['title']),
        //child: Image.asset(photoURI)
      ),
    );
  }
}
