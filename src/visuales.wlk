import factories.*
import nivel.*

import wollok.game.*
import elementos.*
import score.*

object goku inherits Visual(image = "goku1.png",position = game.center()){

	var property esferas = [] 
	var property tieneEnergia = false

	method sumaEsferas(esferaNum) { 
		esferas.add(esferaNum)
	}

	//method restaMonedas(cantidad) {
	//		if (cantidad > monedas)
	//			throw new Exception(message = "No tengo suficiente monedas para eso")
	//		monedas -= cantidad
	//}
	
	//method agarrarIngrediente(ingrediente){
	//	self.sumaMonedas(ingrediente.monedas())
	//}

	//method canta() {
	//	game.say(self, "Vivo en una piña debajo del mar")
	//}
	
	method cuantasEsferas(){
		game.say(self, "Tengo " + self.esferas().size() + " esferas!!")
	}

}
//Fondos del juego de las distintas pantallas

object fondoDelJuego inherits Visual(
	image = "fondoNamek1.PNG",
	position = new Position(x=1,y=1)
){
	method colisionadoPor(visual){}
}
const inicioDelJuego = new Visual(
	image =  "namekIntro.png",
	position = game.at(1,1)
)

const winVisual = new Visual(
	image = "porunga.gif",
	position = game.origin()
)

const gameOver = new Visual(
	image = "freezerGameOver.gif", 
	position = game.at(1,1)
)

class Visual {
	var property image
	var property position = game.origin()
}


object win{
	
	method actualizarTotalEsferas(){
		if ([dodoria,freezer,zaabon].anyOne{enemigo => enemigo.esferasEnemigo().size() == 7})
			nivel.gameOver()
		else{ 
			if(goku.esferas().size() == 7)
				nivel.hasGanado()
			else 
				goku.cuantasEsferas()
		}
	}
}