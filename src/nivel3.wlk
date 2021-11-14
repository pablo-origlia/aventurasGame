import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import utilidades.*

object nivelBichos {

method configurate() {
	//Fondo
	// fondo - es importante que sea el primer visual que se agregue
	game.addVisual(new Fondo(image = "fondoNivel3.png"))

	//Indicador de Granadas
	game.addVisual(indicadorGranadas.imagen())
	game.addVisual(indicadorGranadas.centena())
	game.addVisual(indicadorGranadas.decena())
	game.addVisual(indicadorGranadas.unidad())
	indicadorGranadas.actualizarValor(personajeNivel3.cantidadDeGranadas())

	//Indicador de Salud
	game.addVisual(indicadorSalud.imagen())
	game.addVisual(indicadorSalud.centena())
	game.addVisual(indicadorSalud.decena())
	game.addVisual(indicadorSalud.unidad())
	indicadorSalud.actualizarValor(personajeNivel3.salud())
	
	//Bichos
	game.addVisual(new Bicho (image = "bug_1.png", position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Bicho (image = "bug_2.png", position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Bicho (image = "bug_3.png", position = utilidadesParaJuego.posicionArbitraria()))
	game.addVisual(new Bicho (image = "bug_4.png", position = utilidadesParaJuego.posicionArbitraria()))
	
	//Personaje
	game.addVisual(personajeNivel3)

	// teclado

	keyboard.s().onPressDo({ self.salir()})

	keyboard.right().onPressDo{ personajeNivel2.moverDerecha()}
	keyboard.left().onPressDo{ personajeNivel2.moverIzquierda()}
	keyboard.up().onPressDo{ personajeNivel2.moverArriba()}
	keyboard.down().onPressDo{ personajeNivel2.moverAbajo()}



	// este es para probar, no es necesario dejarlo
	keyboard.g().onPressDo({ self.ganar() })
	keyboard.p().onPressDo({ self.perder() })
	}

	method salir(){
		game.clear()
		game.addVisual(new Fondo(image="fondoCompletoNivel3.png"))
		game.addVisual(personajeNivel3)
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
		game.addVisual(personajeNivel3)
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
		game.addVisual(personajeNivel3)
		game.schedule(1000, {
			game.clear()
			game.addVisual(new Fondo(image="fondoPerderNivel3.png"))
			game.schedule(2000, {
			game.stop()
			})
		})
	}
	
}