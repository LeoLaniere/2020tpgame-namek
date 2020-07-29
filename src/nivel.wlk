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
			
			//console.println("hola")
			self.ubicarAleatoriamente(elemento) 
			game.addVisual(elemento)
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
		//console.println(posicion)
		//posicion= .round(posicion)
		if(game.getObjectsIn(posicionRandom).isEmpty())
			{visual.position(posicionRandom)}
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
