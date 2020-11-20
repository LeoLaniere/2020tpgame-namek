import factories.*
import nivel.*

import wollok.game.*
import elementos.*


object goku inherits Visual(image = "goku1.png",position = game.center()){

	var property esferas = [] 
	var property tieneEnergia = false

	method sumaEsferas(esferaNum) { 
		esferas.add(esferaNum)
	}

	method cuantasEsferas(){
		if (self.esferas().size()==0){
			game.say(self,"Debo darme prisa!!")
		}
		else {game.say(self, "Tengo " + self.esferas() + " esferas!!")}
	}

}
//Fondos del juego de las distintas pantallas

object fondoDelJuego inherits Visual(
	image = "fondoNamek1.jpg",
	position = new Position(x=1,y=1)
){
	method colisionadoPor(visual){}
}
const inicioDelJuego = new Visual(
	image =  "namekIntro.jpg",
	position = game.at(1,1)
)

const winVisual = new Visual(
	image = "porunga1.png",
	position = game.origin()
)

const gameOverVisual = new Visual(
	image = "freezerGameOver.gif", 
	position = game.at(1,1)
)

class Visual {
	var property image
	var property position = new Position(x=10,y=10)
	
	method position(_position){
		position=_position
	}
}


object win{
	
	method actualizarTotalEsferas(){
		
		if ((freezer.esferasEnemigo().size()) == 7)
			nivel.gameOver()
		else{ 
			if((goku.esferas().size()) == 7)
				nivel.hasGanado()
			else 
				goku.cuantasEsferas()
		}
	}
	}
	
