import 'package:flutter/material.dart';

import 'package:cookbook/recipe_details.dart';

const UIColor = Colors.deepPurple;

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
              return MyRecipePage();
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
