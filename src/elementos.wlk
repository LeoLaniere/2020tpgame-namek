import factories.*
import visuales.*
import nivel.*
import wollok.game.*


class Enemigo inherits Visual{
	//var property score = 0
	var property esferasEnemigo = []
	    
	method colisionadoPor(personaje) {
		if (personaje.tieneEnergia()){ 
			//personaje.esferas() += self.esferasEnemigo()
			self.esferasEnemigo().forEach{esferaEnemiga => personaje.esferas().add(esferaEnemiga)}
			self.esferasEnemigo().clear()
		 	game.removeVisual(self)
		 	//score += 1
		 	//personaje.cuantasMonedas()
	   }
	 
	   else{
	      	personaje.esferas().forEach{esfera => self.esferasEnemigo().add(esfera)}
	      	personaje.esferas().clear()
	      	nivel.ubicarAleatoriamente(self)
	   }
 	
	}

	
}
const dodoria =  new Enemigo (image="dodoria.png", position = nivel.ubicarAleatoriamente(dodoria))
const zaabon =  new Enemigo (image="zaabon.png", position = nivel.ubicarAleatoriamente(zaabon))
const freezer =  new Enemigo (image="freezer5069.png", position = nivel.ubicarAleatoriamente(freezer))

class Esfera inherits Visual{
	
	method colisionadoPor(personaje){
		personaje.esferas().add(self)
		game.removeVisual(self)
		
	}
	
}
const esfera01 = new Esfera( image = "esfera01.png",position = nivel.ubicarAleatoriamente(esfera01))
const esfera02 = new Esfera( image = "esfera02.png",position = nivel.ubicarAleatoriamente(esfera02)) 
const esfera03 = new Esfera( image = "esfera03.png",position = nivel.ubicarAleatoriamente(esfera03))
const esfera04 = new Esfera( image = "esfera04.png",position = nivel.ubicarAleatoriamente(esfera04))
const esfera05 = new Esfera( image = "esfera05.png",position = nivel.ubicarAleatoriamente(esfera05))
const esfera06 = new Esfera( image = "esfera06.png",position = nivel.ubicarAleatoriamente(esfera06))
const esfera07 = new Esfera( image = "esfera07.png",position = nivel.ubicarAleatoriamente(esfera07))


//object plankton inherits Visual(position = new Position(x=10,y=3), image = "plankton.png"){
//	var formulaKangreBurger = 0
//	method colisionadoPor(personaje) {
//		if (kangreburger.score() > 0){
//	 		kangreburger.restarScore(1)
//	 		formulaKangreBurger += 1
//	    	game.say(self, "He atrapado la fórmula! Muajaja")							 	
//	 	}
//	 	else{
//			game.say(self, "No tenés hamburguesas hechas, esta vez safaste!")
// 		}
//	nivel.ubicarAleatoriamente(self)		
//	}
//
//	method score() = formulaKangreBurger
//	         
//}

//object kangreburger inherits Visual(image = "kangreburger.png"){
//	var property ingredientes = [tomate, pan, lechuga, paty, condimentos]
//	method score(){
//		return ingredientes.min{ing => ing.score()}.score()
//	}
//	method restarScore(cant){
//		ingredientes.forEach{ing => ing.restarScore(cant)}
//	}
//}

object dende inherits Visual(image= "dende5075.png", position = nivel.ubicarAleatoriamente(self)) {

	method colisionadoPor(personaje) {
		(personaje.tieneEnergia()) == true
		game.say(goku, "Recupere mi energia!!")
		game.removeVisual(self)
		
		//personaje.tieneEspatula(true) 
		//game.say(goku, "Recupere mi energia!!")
		//game.removeVisual(self)
	}
}