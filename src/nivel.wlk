import wollok.game.*
import visuales.*
import factories.*
import elementos.*


object nivel{
	
	const anchoTotal = 26
	const altoTotal = 13
	const anchoRecuadro = 25 
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
	//	CONFIGURACI�N DEL JUEGO
		game.clear()
		game.width(anchoTotal)
		game.height(altoTotal)
		game.addVisual(fondoDelJuego)
		game.ground("celda.png")
		
		//Visuales	
		game.addVisual(goku)
		movimiento.configurarFlechas(goku)
			new MarcoSolido(
				verticeInicial= new Position(x=0,y=0),
				verticeFinal = new Position(x=anchoTotal, y=altoTotal),
				image = "celda.png").dibujar()

		[dodoria,zaabon,freezer,esfera01,esfera02,esfera03,esfera04,esfera05,esfera06,esfera07,dende].forEach { elemento =>  
			game.addVisual(elemento)
			self.ubicarAleatoriamente(elemento) 
		}
		//Colisiones
		
		game.whenCollideDo(goku, {elemento => elemento.colisionadoPor(goku) 
					win.actualizarTotalEsferas()
		})
		
		game.onTick(2000, "movimiento", { [dodoria,zaabon,freezer].forEach{enemigo => self.ubicarAleatoriamente(enemigo)} })
		
        game.onTick(3000, "movimiento", { [esfera01,esfera02,esfera03,esfera04,esfera05,esfera06,esfera07].forEach{esfera => self.ubicarAleatoriamente(esfera)} })
        //Teclado	
			
		keyboard.e().onPressDo{goku.cuantasEsferas()}

		keyboard.s().onPressDo{win.actualizarTotalEsferas()}
			
			
	}
	
	method ubicarAleatoriamente(visual){
		var posicion = new Position (x=1.randomUpTo(anchoRecuadro),y=1.randomUpTo(altoRecuadro))
		if(game.getObjectsIn(posicion).isEmpty())
			{visual.position(posicion)}
		else
			{self.ubicarAleatoriamente(visual)}			
		
	}
	method hasGanado(){
		game.clear()
		game.width(anchoTotal)
		game.height(altoTotal)
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
