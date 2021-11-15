import wollok.game.*
import fondo.*
//import personajes.*
import willy.*
import elementos.*
import utilidades.*
import nivel2.*

object nivelBichos {
	var property bichos = []

method configurate() {
	//Fondo
	// fondo - es importante que sea el primer visual que se agregue
	game.addVisual(new Fondo(image = "fondoNivel3.png"))

	//Indicador de Granadas
	game.addVisual(indicadorGranadas.imagen())
	game.addVisual(indicadorGranadas.centena())
	game.addVisual(indicadorGranadas.decena())
	game.addVisual(indicadorGranadas.unidad())
	indicadorGranadas.actualizarValor(willy3.cantidadDeGranadas())

	//Indicador de Salud
	game.addVisual(indicadorSalud.imagen())
	game.addVisual(indicadorSalud.centena())
	game.addVisual(indicadorSalud.decena())
	game.addVisual(indicadorSalud.unidad())
	indicadorSalud.actualizarValor(willy3.salud())
	
	//Bichos
	
	bichos = [	new Bicho (image = "bug_1.png", position = utilidadesParaJuego.posicionArbitraria()),
				new Bicho (image = "bug_2.png", position = utilidadesParaJuego.posicionArbitraria()),
				new Bicho (image = "bug_3.png", position = utilidadesParaJuego.posicionArbitraria()),
				new Bicho (image = "bug_4.png", position = utilidadesParaJuego.posicionArbitraria())
			] 
    
    bichos.forEach({ b => game.addVisual(b)})
	/*game.addVisual(new Bicho (image = "bug_1.png", position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Bicho (image = "bug_2.png", position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Bicho (image = "bug_3.png", position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Bicho (image = "bug_4.png", position = utilidadesParaJuego.posicionArbitraria()))*/
	
	//Granadas
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Granada(position = utilidadesParaJuego.posicionArbitraria()))
	
	//Personaje
	game.addVisual(willy3)
	
	  // Colisiones
    game.onCollideDo(willy3, { e => willy3.manipular(e)})
    
   	//Eventos Automáticos  
   	
   	game.onTick(4000, "movimiento", {bichos.forEach({ b => b.movete()})})

	// teclado

	keyboard.s().onPressDo({ self.salir()})
	//keyboard.l().onPressDo()

	keyboard.any().onPressDo{ self.comprobarSiGano()}
    keyboard.up().onPressDo{ willy3.irArriba()}
    keyboard.down().onPressDo{ willy3.irAbajo()}
    keyboard.left().onPressDo{ willy3.irIzquierda()}
    keyboard.right().onPressDo{ willy3.irDerecha()}



	// este es para probar, no es necesario dejarlo
	keyboard.g().onPressDo({ self.ganar() })
	keyboard.p().onPressDo({ self.perder() })
	
	keyboard.v().onPressDo({ game.clear()
      nivelDinero.configurate()
    })
	}
	

	method salir(){
		game.clear()
		game.addVisual(new Fondo(image="fondoCompletoNivel3.png"))
		game.addVisual(willy3)
		game.schedule(1000, {
			game.clear()
			game.addVisual(new Fondo(image="fondoSalirNivel3.png"))
			game.schedule(2000, {
			game.stop()
			})
		})
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido

		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompletoNivel3.png"))
		game.addVisual(willy3)
		// después de un ratito ...
		game.schedule(1000, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="fondoGanarNivel3.png"))
			// después de un ratito ...
			game.schedule(2000, {
			// fin del juego
			game.stop()
			})
		})
	}

	method perder(){
		game.clear()
		game.addVisual(new Fondo(image="fondoCompletoNivel3.png"))
		game.addVisual(willy3)
		game.schedule(1000, {
			game.clear()
			game.addVisual(new Fondo(image="fondoPerderNivel3.png"))
			game.schedule(2000, {
			game.stop()
			})
		})
	}
	
	method comprobarSiGano(){
		if (bichos.isEmpty() and willy3.salud() > 0){
			game.say(willy, "GANASTE!")
			self.ganar()
		}
	
	}
	
}