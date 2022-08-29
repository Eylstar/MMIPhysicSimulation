class Point extends Ellipse {

  Point(){
    super();                                                                    //On récupère les valeurs de position, vitesseMax et vitesse de Ellipse
  }

  void afficher() {                                                             //Ici c'est la fonction d'affichage qui va changer en partie
    if (switchCouleur==1) {
      stroke(col1);
      switchCouleur = 2;
    }
    else{
      stroke(col2);
      switchCouleur = 1;
    }
    point(position.x, position.y);                                              //Au lieu d'afficher des ellipses, on affichera des points
  }
}
