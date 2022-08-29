class Souris{

  void clickX(int x1, int x2){                                                  //Récupère les deux valeurs rentrées dans clickX
    if (mouseX>x1 && mouseX<x2){
      checkX = true;                                                            //Si la coordonnée X se trouvait bien entre ces deux valeurs, le booléen prend la valeur vrai
    }
    else checkX = false;                                                        //Sinon il vaut faux
  }

  void clickY(int y1, int y2){
    if (mouseY>y1 && mouseY<y2) {                                               //Idem ici mais pour la coordonnée Y
      checkY = true;
    }
    else checkY = false;
  }

}
