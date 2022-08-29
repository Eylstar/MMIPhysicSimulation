class Display{

  void affichMenu_avant(){                                                      //Fonction pour afficher la page de menu avant le choix du nbrballes
    background(bleuClair);
    tint(255,150);                                                              //Changement de la teinte, pour donner à l'image qui suit une opacité plus faible
    image(statue,100,50);                                                       //Affichage de l'image de la statue
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    fill(noir);
    textFont(Comfortaa,60);                                                     //Changement de la taille de la police
    text("MMI SIMULATION GAME",width/2,200);                                    //Affichage d'un texte, ici le titre
    textFont(Comfortaa,35);
    text("NOMBRE DE BALLES:",width/2,350);
    textFont(Comfortaa,16);
    text("(Entrez une valeur numérique à 4 chiffres)",width/2,385);
    text("Valeur recommandée = 4 0 0 0",width/2,405);
  }

  void affichMenu_apres(){                                                      //Fonction pour afficher la page de menu après le choix du nbrballes
    fill(blanc);
    rect(width/2,650,400,100,25);                                               //On crée le boutton "COMMENCER"
    rect(width/2,800,400,100,25);                                               //Boutton "COMMANDES"
    rect(850,50,250,40,15);                                                    //Boutton pour réinitialiser le nombre de balles
    rect(100,50,120,40,15);                                                     //Boutton "sortir"

    fill(noir);
    textFont(Comfortaa,30);
    text(somme[0]/1000,425,460);                                                //Affichage des valeurs rentrées, chacune divisée pour corespondre au chiffre
    text(somme[1]/100,475,460);
    text(somme[2]/10,525,460);
    text(somme[3],575,460);
    text("COMMENCER", width/2,650);                                             //Affichage du nom des bouttons par dessus leur rectangle
    text("COMMANDES", width/2, 800);
    textFont(Comfortaa,15);
    text("Reset du nombre de balles",850,50);
    text("Sortir",100,50);
  }

  void affichCommandes(){                                                       //Fonction pour afficher la page des commandes
    background(bleuClair);

    rectMode(CENTER);
    fill(blanc);
    rect(width/2,800,400,100,25);                                               //Affichage du boutton de retour au menu
    fill(noir);
    textAlign(CENTER,CENTER);
    textFont(Comfortaa,40);
    text("Mode par défaut", width/4,height/4-100);
    text("Modes spéciaux",width/2+width/4,height/4-100);
    textFont(Comfortaa,20);
    text("- Attraction normale: Par défaut", width/4, height/4+50);
    text("- Attraction niveau 2: touche Z", width/4, height/4+150);
    text("- Attraction niveau 3: touche E", width/4, height/4+250);
    text("- Changement en points: touche P", width/4, height/4+350);
    text("- Mode gravité réaliste: touche G", width/2+width/4, height/4+50);
    text("- Mode aucune attraction: touche H", width/2+width/4, height/4+150);
    text("- Mode magique (Mandala): touche M", width/2+width/4, height/4+250);
    text("- Mode OnFermeToutEtOnS'enVa: Echap", width/2+width/4, height/4+350);
    textFont(Comfortaa,30);
    text("RETOUR MENU", width/2,800);

  }

  void affichAnim(){                                                            //Fonction pour afficher le boutton de la page d'animation
    rectMode(CENTER);
    fill(blanc);
    stroke(noir);
    rect(900,950,150,50,15);                                                    //Création du bouton "retour menu"
    fill(noir);
    textFont(Comfortaa,15);
    text("Retour Menu",900,950);
  }

  void assignKey(int K){

    if (K == 'g' || K == 'G') {                                                 //Vérifie si la touche G à été appuyée
      subtitle = "gravité";                                                     //Le cas échéant, le sous titre de gravité sera affiché
    }
    else if (K =='h' || K =='H') {                                              //Idem pour la touche H
      subtitle = "libre";
    }
    else subtitle = "souris";                                                   //Par défaut, l'attraction est gouvernée par la souris

    switch(K){                                                                  //Vérifie ici quelle est la valeur de la magnitude en fonction de la touche appuyée
      case 'z' : magnitude = 2;
        break;
      case 'e' : magnitude = 3;
        break;
      default : magnitude = 1;
    }
  }

  void checkTitle(){                                                            //Fonction pour afficher le mode
    textFont(Comfortaa,30);
    switch(text){                                                               //Vérifie quel mode est entrain d'être executé
      case "mandala" : text("MODE: Mandala",width/2,100);
        break;
      case "point" : text("MODE: Nuage de points",width/2,100);
        break;
      default: text("MODE: Nuage d'ellipses",width/2,100);
    }
  }

  void checkSubtitle(){

    textFont(Comfortaa,15);

    switch (subtitle){                                                          //Vérifie quel est le mode d'attraction de la simulation et l'affiche
      case "gravité" : text("Gravité activée (G)",width/2,130);
        break;
      case "libre" : text("Gravité et attraction désactivés (H)",width/2,130);
        break;
      default : text("Attraction controlée par la souris",width/2,130);
      switch(magnitude){                                                        //Et dans le cas d'une attraction par la souris, quel est la magnitude
        case 1 : text("Magnitude de niveau 1",width/2,145);
          break;
        case 2 : text("Magnitude de niveau 2",width/2,145);
          break;
        case 3 : text("Magnitude de niveau 3",width/2,145);
      }
    }
  }



}
