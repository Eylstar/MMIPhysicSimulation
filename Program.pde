
/*<----------------------------------------------------------------DECLARATION DES VARIABLES---------------------------------------------------------------->*/

int nbreBalle;                                                                  //Création de la variable qui détermine le nombre d'ellipses affichées
int[] somme = new int[]{-1,-1,-1,-1};                                           //Création d'un tableau de 4 cases, pour le choix du nombre d'ellipses
int compteur = 0;                                                               //Variable compteur, qui sert à incrémenter le tableau de 4 valeurs
boolean check = false;                                                          //Variable qui sert à savoir si le nombre d'ellipses à été determiné ou non

Ellipse[] circle = new Ellipse[9999];                                           //Création de la classe Ellipse qui calcule les vecteurs et affiche les ellipses
Point[] points = new Point[9999];                                               //Classe Point, polymorphise de Ellipse en points
Mandala rotate = new Mandala();                                                 //Création de la classe Mandala, héritage de Ellipse
Display draw = new Display();                                                   //Création de la classe Display, servant à affficher rectangles/textes et à vérifier leur valeur
Souris mouse = new Souris();                                                    //Création de la classe Souris, qui vérifie le clic de l'utilisateur pour la page à afficher

boolean checkX, checkY;                                                         //Deux variable booléennes servant à vérifier si le clic à été fait sur un des bouttons des menus

String menu = "home";                                                           //Variable qui détermine quelle page afficher
String text = "";                                                               //et quel mode afficher
String subtitle = "";                                                           //...et quelle type d'atraction
int magnitude = 1;                                                              //... et quelle magnitude

int switchCouleur = 1;                                                          //Variable qui va permettre aux balles de changer de couleur
color noir=(#000000),blanc=(#FFFFFF);                                           //Déclaration en amont de toutes les couleurs (ici les couleurs des balles et noir/blanc)
color bleuClair=(#ADEAFF);                                                      //Couleur du backGround

PFont Comfortaa;                                                                //Appel de la Police
PImage statue;                                                                  //Importation de l'image de la statue pour le background du menu


/*<------------------------------------------------------------------FONCTION DE SETUP---------------------------------------------------------------->*/

void setup() {
  frameRate(60);                                                                //Définition de 60 frames par seconde max
  size(1000, 1000);                                                             //Taille de la fenêtre
  Comfortaa = loadFont("Comfortaa.vlw");                                        //Chargement de la police Comfortaa
  statue = loadImage("statue.png");                                             //Chargement de l'image statue.png
  for(int i=0; i<nbreBalle; i++){
    circle[i] = new Ellipse();                                                  //Pour nbrballes fois, on affecte une nouvelle ellipse dans la case
    points[i] = new Point();                                                    //Pour nbrballes fois, on affecte une nouveau point dans la case
  }
}


/*<----------------------------------------------------------------CHOIX DU NOMBRE DE BALLES---------------------------------------------------------------->*/

void draw() {

  if (menu == "home") {                                                         //Vérification si la page sur laquelle on est est bien le menu

    draw.affichMenu_avant();                                                    //On affiches la page de menu "avant" le choix du nombre de balles

    if (compteur != 4) {
      if (keyPressed) {                                                         //Vérification qu'une des touches des claviers à été pressée
        if ((int(key)-48)<10 && (int(key)-48)>=0) {                             //Et que ce soit bien une touche du pavé numérique
          somme[compteur] = (int(key)-48);                                      //Affectation de la touche pressée dans une case du tableau pas encore remplie
          compteur++;                                                           //Incrémentation du compteur, et donc de la case à remplir
          keyPressed = false;                                                   //On réinitialise la vérification de touche
        }
      }

      textFont(Comfortaa,30);

      if (somme[0] == -1) {text("_",425,460);}                                  //Si la case n'est pas remplie (=-1), alors on affiche un tiret
      else{text(somme[0],425,460);}                                             //Sinon on affiche sa valeur

      if (somme[1] == -1) {text("_",475,460);}
      else{text(somme[1],475,460);}

      if (somme[2] == -1) {text("_",525,460);}
      else{text(somme[2],525,460);}

      if (somme[3] == -1) {text("_",575,460);}
      else{text(somme[3],575,460);}
    }

    else if (compteur == 4 && check == false) {                                 //Dès que le compteur vaut 4, donc que toutes les cases sont remplies
      somme[0] = somme[0] * 1000;                                               //On fait en sorte que le premier chiffre rentré soit bien sous forme de milliers
      somme[1] = somme[1] * 100;                                                //En centaines pour le deuxième
      somme[2] = somme[2] * 10;                                                 //Et en dizaines pour le troisième
      for (int i=0;i<4 ;i++ ) {
        nbreBalle = nbreBalle + somme[i];                                       //Puis on adittione tout pour retrouver la valeur rentrée
      }
      check = true;                                                             //Et donc, le vérificateur devient vrai
      setup();                                                                  //On relance donc le setup pour créer des tableaux d'ellipses de la bonne taille
    }


/*<----------------------------------------------------------------AFFICHAGE DE LA PAGE MENU---------------------------------------------------------------->*/

    else if (check == true) {                                                   //On vérifie donc que nbreBalle est défini
      draw.affichMenu_apres();                                                  //On affiches la page de menu "après" le choix du nombre de balles
    }
  }


/*<----------------------------------------------------------------PAGE DES COMMANDES---------------------------------------------------------------->*/

  else if (menu == "commandes") {                                               //Vérifie si l'utilisateur a cliqué sur le boutton pour le menu commandes
    draw.affichCommandes();                                                     //On affiche la page des commandes
  }


/*<----------------------------------------------------------------PAGE D'ANIMATION---------------------------------------------------------------->*/

  else if (menu == "animation") {                                               //Vérifie si l'utilisateur a cliqué sur le boutton pour la page d'animation
    background(blanc);

    draw.checkTitle();                                                          //Vérifie quelle est le Mode en cours et l'affiche
    draw.checkSubtitle();                                                       //Vérifie quel est le mode d'attraction de la simulation et l'affiche


/*<----------------------------------------------------------------APPEL DES CLASSES ET ANIMATION---------------------------------------------------------------->*/

    for(int i=0; i<nbreBalle; i++){                                             //Création de la boucle FOR qui va gérer l'appel et l'affichage des classes

      if(key == 'p' || key == 'P'){                                             //Vérifie si la touche 'P' à été pressée
        points[i].calculer();                                                   //Appel de la fonction de calcul avec les paramètres de la classe point
        points[i].afficher();                                                   //Appel de la fonction d'affchage avec les paramètres de la classe point
        text = "point";                                                         //La variable text vaut point, cela affichera donc le Mode "point"
        magnitude = 1;                                                          //La magnitude vaut 1 par défaut pour les points
        subtitle = "souris";                                                    //Et l'attraction est gérée par la souris
      }

      else if(key =='m' || key == 'M'){                                         //Vérifie si la touche M à été pressée
        rotate.calculer();                                                      //Appel de la fonction calculer 4000 fois (nbreBalle) une fois par frame
        rotate.afficher();                                                       //Appel de la fonction d'affichage 4000 fois une fois par frame
        text = "mandala";                                                       //(En fait c'est une seule ellipse avec les mêmes coordonnées qui est affichée,
        magnitude = 1;                                                          //mais son mouvement est calculé, puis ensuite la même ellipse est affichée mais
        subtitle = "souris";                                                    //aux coordonnées initiales, pendant que la première à bougé, et cela 4000 fois, d'ou le mandala)
      }

      else{                                                                     //Si aucune touche n'a été pressée (par défaut) ou une touche différente des deux autres
        circle[i].calculer();                                                   //Appel de la fonction de calcul pour chaque case du tableau une par une à chaque frame
        circle[i].afficher();                                                   //Appel de la fonction d'affichage pour chaque case du tableau une par une à chaque frame
        text = "ellipse";

        draw.assignKey(key);                                                    //On appelle la fonction assignKey qui va vérifier quel mode/attraction est en cours et l'afficher
      }
    }
    draw.affichAnim();                                                          //Affichage du boutton de retour au menu
  }
  if (key == ESC) {                                                             //Si la touche est 'échap'
    exit();                                                                     //Le prgramme se ferme (woaw :D)
  }
}


/*<----------------------------------------------------------------NAVIGATION ENTRE LES PAGES---------------------------------------------------------------->*/

void mousePressed() {

  if (menu == "animation") {                                                    //Vérifie que si l'utilisateur se trouve sur la page d'animation lors d'un clic
    textFont(Comfortaa,70);
    text("PAUSE",width/2,height/2);                                             //Dans ce cas "Pause" est affiché
    noLoop();                                                                   //et l'animation s'arrête
  }

  if (check == true) {                                                          //Vérifie que le nombre de balles à déjà été choisi par l'utilisateur

    mouse.clickX(300,700);                                                      //Envoie 300 et 700 à la fonction clickX (vérifie que la coordonnée X est comprise entre)
      mouse.clickY(600,700);                                                    //Envoie 600 et 700 à la fonction clickY (vérifie que la coordonnée Y est comprise entre)
      if(checkX == true && checkY == true){                                     //Si toutes les conditions de clik sont validées alors...
        if(menu == "home"){
          menu = "animation";                                                   //La variable de menu change de valeur, donc on change de page
        }
      }

      mouse.clickY(750,850);
      if(checkX == true && checkY == true){
        if (menu == "home") {
          menu = "commandes";
        }
        else if(menu == "commandes"){
          menu = "home";
        }
      }

    mouse.clickX(825,975);
      mouse.clickY(925,975);
      if(checkX == true && checkY == true){
        if(menu == "animation"){
          menu = "home";
          mouseX = mouseY = 0;                                                  //Ici on réinitialise les valeurs de click à 0, pour éviter un "double clik" sur le bouton réinitialisation
        }
      }

    if (menu == "home") {
      mouse.clickY(30,70);

        mouse.clickX(40,160);
        if(checkX == true && checkY == true){
           exit();                                                              //Si la vérification duclic est faite, exit() ferme le programme
        }

        mouse.clickX(725,975);
        if(checkX == true && checkY == true){
          nbreBalle = compteur = 0;                                             //On réinitialise les valeurs de nombre de balles et du compteur de cases occupées du tableau
          check = false;                                                        //On remet le booléen qui vérifie si la valeur à été choisie sur faux
          for (int i=0;i<4;i++) {
            somme[i] = -1;                                                      //Et on remet chaque case du valeu à sa valeur initiale, -1
          }
          draw();
        }
    }
  }

  if (mouseButton == RIGHT) {
    setup();                                                                    //Reset de la fonction setup si le clic droit est detecté
    draw();                                                                     //Idem pour draw (une nouvelle simulation est créée)
  }
}

void mouseReleased() {
  loop();                                                                       //Dès que le clic est relaché, l'animation reprend
}
