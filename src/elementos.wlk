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
//const dodoria =  new Enemigo (image="dodoria.png", position = new Position(x=10,y=3))//nivel.ubicarAleatoriamente(dodoria))
//const zaabon =  new Enemigo (image="zaabon.png", position = new Position(x=9,y=3))//nivel.ubicarAleatoriamente(zaabon))
//const freezer =  new Enemigo (image="freezer5069.png", position = new Position(x=11,y=4))//nivel.ubicarAleatoriamente(freezer))

class Esfera inherits Visual{
	
	method colisionadoPor(personaje){
		personaje.esferas().add(self)
		game.removeVisual(self)	
	}	
}

object crear {
	
	
		const esfera01 = new Esfera( image = "esfera01.png",position = new Position(x=2,y=1))//nivel.ubicarAleatoriamente(esfera01))
		const esfera02 = new Esfera( image = "esfera02.png",position = new Position(x=3,y=1))//nivel.ubicarAleatoriamente(esfera02)) 
		const esfera03 = new Esfera( image = "esfera03.png",position = new Position(x=4,y=1))//nivel.ubicarAleatoriamente(esfera03))
		const esfera04 = new Esfera( image = "esfera04.png",position = new Position(x=5,y=1))//nivel.ubicarAleatoriamente(esfera04))
		const esfera05 = new Esfera( image = "esfera05.png",position = new Position(x=6,y=1))//nivel.ubicarAleatoriamente(esfera05))
		const esfera06 = new Esfera( image = "esfera06.png",position = new Position(x=7,y=1))//nivel.ubicarAleatoriamente(esfera06))
		const esfera07 = new Esfera( image = "esfera07.png",position = new Position(x=8,y=1))//nivel.ubicarAleatoriamente(esfera07))
		const dodoria =  new Enemigo( image = "dodoria.png", position = new Position(x=10,y=3))//nivel.ubicarAleatoriamente(dodoria))
		const zaabon  =  new Enemigo( image = "zaabon.png", position = new Position(x=9,y=3))//nivel.ubicarAleatoriamente(zaabon))
		const freezer =  new Enemigo( image = "freezer5069.png", position = new Position(x=11,y=4))//nivel.ubicarAleatoriamente(freezer))
	
	var personajes = [esfera01,esfera02,esfera03,
						esfera04,esfera05,esfera06,esfera07,dodoria,zaabon,freezer
	]
	
	method iniciarPersonajes(){
		personajes.forEach( { elemento =>  
			
			//console.println("hola")
			self.ubicarAleatoriamente(elemento) 
			game.addVisual(elemento)
		})
		
		}
	method ubicarAleatoriamente(visual){
		//const x = 1.randomUpTo(game.width(anchoRecuadro)).truncate(0)
		//const y = 1.randomUpTo(game.height(altoRecuadro)).truncate(0)
		//otra forma de generar números aleatorios
		//const x = (0.. game.width()-1).anyOne() 
		//const y = (0.. game.height()-1).anyOne() 
		//var posicionRandom = game.at(x,y)
		
		var posicionRandom = new Position (x=1.randomUpTo(anchoRecuadro).roundUp(),y=1.randomUpTo(altoRecuadro).roundUp())
		
		if(game.getObjectsIn(posicionRandom).isEmpty())
			{visual.position(posicionRandom)}
		else
			{self.ubicarAleatoriamente(visual)}	
	}
}

object dende inherits Visual(image= "dende5075.png", position = nivel.ubicarAleatoriamente(self)) {

	method colisionadoPor(personaje) {
		personaje.tieneEnergia(true)
		game.say(goku, "Recupere mi energia!!")
		game.removeVisual(self)
		
	}
}