class Ellipse{
  PVector position;                                                             //Création du vecteur de position
  PVector vitesse;                                                              //Création du vecteur vitesse
  PVector acceleration;                                                         //Création du vecteur accélération
  PVector souris;                                                               //Création du vecteur souris, qui va déterminer l'attraction des ellipses
  float vitesseMax;                                                             //Création de la variable vitesseMax, qui limitera la vitesse
  color col1, col2;                                                             //Création de deux variables couleurs pour les ellipses


  Ellipse(){                                                                    //Constructeur des ellipses
    position = new PVector(random(0, 1000), random(0, 1000));                   //On définit au vecteur position une position x et y aléatoire sur la page d'animation
    vitesse = new PVector(0,0);                                                 //On crée le vecteur vitesse, qui vaut 0,0 au début
    vitesseMax = 7.5 ;                                                          //Et on limite la vitesse à 7.5
    col1 = color(#0000FF);
    col2 = color(#FF0000);

  }

  void calculer(){                                                              //Fonction de calcul des vecteurs

    if (key == 'g' || key == 'G') {                                             //On vérifie si l'utilisateur appuie sur la touche G
      if (vitesseMax != 7.5) {                                                  //Et qui si la vitessMax à étée changée on réinitialise sa valeur
        vitesseMax = 7.5;
      }

      souris = new PVector(position.x, 1000);                                   //Dans le cas de "g", la gravité est au sol, le vecteur "souris" se trouve en bas le long de la page
      acceleration = PVector.sub(souris, position);                             //Le vecteur acceleration qui vaut la diférnce de la souris avec la position
      acceleration.setMag(0.2);                                                 //On définit la magnitude du vecteur à 0.2

      if (position.x >= width || position.x <=0) {                              //Si l'ellipse touche un des deux côtés de la fenêtre, elle rebondit
        vitesse.x = vitesse.x *-1;
      }

      if (position.y >= height) {                                               //Si l'ellipse touche le bas de l'écran
        vitesse.y = vitesse.y * -0.6;                                           //elle rebondit mais perd progressivement de la vitesse
        vitesse.x = 0.2;                                                        //De même pour la vitesse horizontale
      }
    }

    else if (key == 'h' || key == 'H') {                                        //Si l'utilisateur à appuyé sur H
      if (vitesseMax == 52.5) {                                                 //On définit vitesseMax sur 20.5 uniquement si elle valait 52.5 avant
        vitesseMax = 20.5;
      }

      souris = new PVector(position.x, position.y);                             //Ici le vecteur souris est la position de l'objet lui même, aucun centre d'attraction
      acceleration = PVector.sub(souris, position);
      acceleration.setMag(0.2);

      if (position.x >= width || position.x <=0) {                              //Idem ici, on fait rebondir la balle si elle touche un des bords
        vitesse.x = vitesse.x * -1;
      }

      if (position.y >= height || position.y <= 0) {                            //Mais pour les bords bas et hauts, on ne diminue pas sa vitesse, mouvement pérpetuel
        vitesse.y = vitesse.y * -1;
      }
    }

    else{                                                                       //Sinon, le cas par défaut
      souris = new PVector(mouseX, mouseY);                                     //Le vecteur souris vaut la position de la souris, le point d'attraction donc

      if (key == 'z') {                                                         //Si la touche est Z, alors
        acceleration = PVector.sub(souris, position);
        acceleration.setMag(20);                                                //On définit une magnitude
        vitesseMax = 52.5;                                                      //et une vitesseMax différente
      }

      else if (key == 'e') {                                                    //Idem pour e
        acceleration = PVector.sub(souris, position);
        acceleration.setMag(40);
        vitesseMax = 20.5;
      }

      else{                                                                     //Et ces valeurs sont les cas par défaut
        acceleration = PVector.sub(souris, position);
        acceleration.setMag(0.2);
        vitesseMax = 7.5;
      }
    }

    vitesse.add(acceleration);                                                  //On ajoute les vecteurs acceleration et vitesse, pour le mouvement
    vitesse.limit(vitesseMax);                                                  //On limite la vitesse par vitesseMax
    position.add(vitesse);                                                      //Et on ajoute la vitesse calculée à la position, le mouvement est crée
  }

  void afficher() {                                                             //Fonction d'affichage des ellipses
    noStroke();                                                                 //On veut les ellipses sans contours

    if (switchCouleur==1) {                                                     //Une balle sur deux sera rouge, l'autre moitié sera bleue
      fill(col1);
      switchCouleur = 2;
    }
    else{
      fill(col2);
      switchCouleur = 1;
    }
    ellipse(position.x, position.y, 3, 3);                                      //Et on affiche l'ellipse à ses coordonnées x et y
  }
}
