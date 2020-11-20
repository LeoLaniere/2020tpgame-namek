import wollok.game.*
import visuales.*
import factories.*
import elementos.*
	
object nivel{

	const anchoTotal = 26
	const altoTotal = 13
	const anchoRecuadro = 24 
	const altoRecuadro = 12
	
	
	method inicio(){
		game.clear()
		game.title("Planet Namek")
		game.width(anchoTotal)
		game.height(altoTotal)
		game.ground("celda.png")
		game.addVisual(inicioDelJuego)
		keyboard.space().onPressDo{self.configurate()}
	}	
		
	method configurate() {
		game.clear()
		game.width(anchoRecuadro)
		game.height(altoRecuadro)
		game.addVisual(fondoDelJuego)
		game.ground("celda.png")
		
		
		game.addVisualCharacter(goku)
		
		//movimiento.configurarFlechas(goku)
			new MarcoSolido(
				verticeInicial= new Position(x=1,y=1),
				verticeFinal = new Position(x=anchoRecuadro, y=altoRecuadro),
				image = "celda.png").dibujar()
		
		//crear esferas y enemigos		
		const esfera01 = new Esfera( image = "esfera01.png",position = new Position(x=2,y=1))//nivel.ubicarAleatoriamente(esfera01))
		const esfera02 = new Esfera( image = "esfera02.png",position = new Position(x=3,y=1))//nivel.ubicarAleatoriamente(esfera02)) 
		const esfera03 = new Esfera( image = "esfera03.png",position = new Position(x=4,y=1))//nivel.ubicarAleatoriamente(esfera03))
		const esfera04 = new Esfera( image = "esfera04.png",position = new Position(x=5,y=1))//nivel.ubicarAleatoriamente(esfera04))
		const esfera05 = new Esfera( image = "05esfera.png",position = new Position(x=6,y=1))//nivel.ubicarAleatoriamente(esfera05))
		const esfera06 = new Esfera( image = "esfera06.png",position = new Position(x=7,y=1))//nivel.ubicarAleatoriamente(esfera06))
		const esfera07 = new Esfera( image = "07esfera.png",position = new Position(x=8,y=1))//nivel.ubicarAleatoriamente(esfera07))
//		const dodoria =  new Enemigo( image = "dodoria.png", position = new Position(x=10,y=3))//nivel.ubicarAleatoriamente(dodoria))
//		const zaabon  =  new Enemigo( image = "zaabon.png", position = new Position(x=9,y=3))//nivel.ubicarAleatoriamente(zaabon))
//		const freezer =  new Enemigo( image = "freezer5069.png", position = new Position(x=11,y=4))//nivel.ubicarAleatoriamente(freezer))
		
		[esfera01,esfera02,esfera03,esfera04,esfera05,esfera06,esfera07].forEach( { elemento =>  
			self.ubicarAleatoriamente(elemento) 
			game.addVisual(elemento)
		})
		[dodoria,zaabon,freezer].forEach( { elemento =>  
			self.ubicarAleatoriamente(elemento) 
			game.addVisual(elemento)
		})
		self.ubicarAleatoriamente(dende)
		game.addVisual(dende)
		
		//Colisiones
		game.whenCollideDo(goku, {elemento => elemento.colisionadoPor(goku) 
					win.actualizarTotalEsferas()
		})
		
		game.onTick(2000, "movimiento", { [dodoria,zaabon,freezer].forEach{enemigo => self.ubicarAleatoriamente(enemigo)} })
        game.onTick(3000, "movimiento", { [esfera01,esfera02,esfera03,esfera04,esfera05,esfera06,esfera07,dende].forEach{esfera => self.ubicarAleatoriamente(esfera)} })
        //game.onTick(2000, "movimiento", { enemigos.forEach{enemigo => self.ubicarAleatoriamente(enemigo)} })
        //game.onTick(3000, "movimiento", { esferas.forEach{esfera => self.ubicarAleatoriamente(esfera)} })
        
        		
		keyboard.e().onPressDo{goku.cuantasEsferas()}
		keyboard.s().onPressDo{win.actualizarTotalEsferas()}	
	}
	method roundUp(nro){
   	 return if (nro %1 == 0) nro.div(1) else nro.div(1)+1 
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

	method hasGanado(){
		game.clear()
		game.width(anchoRecuadro)
		game.height(altoRecuadro)
		game.addVisual(winVisual)
		

		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
	}
	
	method gameOver(){
		game.clear()
		game.title("Planet Namek") 
		game.width(anchoTotal)
		game.height(altoTotal)
        game.addVisual(gameOverVisual)
		keyboard.p().onPressDo{self.inicio()}
		keyboard.f().onPressDo{game.stop()}
		
	}
}

