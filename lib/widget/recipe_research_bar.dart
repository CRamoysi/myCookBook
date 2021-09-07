import 'package:flutter/material.dart';

const UIColor = Colors.deepPurple;

/// Barre de recherche de recette situé sur la page principale

class RecipeResearchBar extends StatelessWidget {
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
