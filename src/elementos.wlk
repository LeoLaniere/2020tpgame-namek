import factories.*
import visuales.*
import nivel.*
import wollok.game.*


class Enemigo inherits Visual{
	
	var property esferasEnemigo = []
	    
	method colisionadoPor(personaje) {
		if (personaje.tieneEnergia()){ 
			//personaje.esferas() += self.esferasEnemigo()
			self.esferasEnemigo().forEach{esferaEnemiga => personaje.esferas().add(esferaEnemiga)}
			self.esferasEnemigo().clear()
		 	game.removeVisual(self)		 	
	   }	 
	   else{
	      	personaje.esferas().forEach{esfera => self.esferasEnemigo().add(esfera)}
	      	personaje.esferas().clear()
	      	nivel.ubicarAleatoriamente(self)
	   }	
	}	
}

class Esfera inherits Visual{
//	var property esferasEnemigo = []
	
	method colisionadoPor(personaje){
		personaje.esferas().add(self)
		game.removeVisual(self)	
	}	
}

object dende inherits Visual(image= "dende5075.png", position = new Position(x=8,y=8)) {

	method colisionadoPor(personaje) {
		personaje.tieneEnergia(true)
		game.say(goku, "Recupere mi energia!!")
		game.removeVisual(self)
		
	}
}
object zaabon inherits Visual ( image = "zaabon.png", position = new Position(x=9,y=3)){
	
	var property esferasEnemigo = []
	    
	method colisionadoPor(personaje) {
		if (personaje.tieneEnergia()){ 
			//personaje.esferas() += self.esferasEnemigo()
			self.esferasEnemigo().forEach{esferaEnemiga => personaje.esferas().add(esferaEnemiga)}
			self.esferasEnemigo().clear()
		 	game.removeVisual(self)		 	
	   }	 
	   else{
	      	personaje.esferas().forEach{esfera => self.esferasEnemigo().add(esfera)}
	      	personaje.esferas().clear()
	      	nivel.ubicarAleatoriamente(self)
	   }	
	}
	
	}
object dodoria inherits Visual ( image = "dodoria.png", position = new Position(x=10,y=3)){
	
	var property esferasEnemigo = []
	    
	method colisionadoPor(personaje) {
		if (personaje.tieneEnergia()){ 
			//personaje.esferas() += self.esferasEnemigo()
			self.esferasEnemigo().forEach{esferaEnemiga => personaje.esferas().add(esferaEnemiga)}
			self.esferasEnemigo().clear()
		 	game.removeVisual(self)		 	
	   }	 
	   else{
	      	personaje.esferas().forEach{esfera => self.esferasEnemigo().add(esfera)}
	      	personaje.esferas().clear()
	      	nivel.ubicarAleatoriamente(self)
	   }	
	}
	}
object freezer inherits Visual ( image = "freezer5069.png", position = new Position(x=11,y=4)){
	
	var property esferasEnemigo = []
	    
	method colisionadoPor(personaje) {
		if (personaje.tieneEnergia()){ 
			//personaje.esferas() += self.esferasEnemigo()
			self.esferasEnemigo().forEach{esferaEnemiga => personaje.esferas().add(esferaEnemiga)}
			self.esferasEnemigo().clear()
		 	game.removeVisual(self)		 	
	   }	 
	   else{
	      	personaje.esferas().forEach{esfera => self.esferasEnemigo().add(esfera)}
	      	personaje.esferas().clear()
	      	nivel.ubicarAleatoriamente(self)
	   }	
	}
	}
