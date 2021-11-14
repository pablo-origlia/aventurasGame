import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import utilidades.*
import nivel3.*

object nivelDinero {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoNivel2.png"))
		 
		// otros visuals, p.ej. bloques o llaves

		//Indicador de Dinero
		game.addVisual(indicadorDinero.imagen())
		game.addVisual(indicadorDinero.centena())
		game.addVisual(indicadorDinero.decena())
		game.addVisual(indicadorDinero.unidad())
		indicadorDinero.actualizarValor(personajeNivel2.dinero())


		//Indicador de Salud
		game.addVisual(indicadorSalud.imagen())
		game.addVisual(indicadorSalud.centena())
		game.addVisual(indicadorSalud.decena())
		game.addVisual(indicadorSalud.unidad())
		indicadorSalud.actualizarValor(personajeNivel2.salud())

		//Elementos que otorgan Salud
		game.addVisual(new Curita(position = utilidadesParaJuego.posicionArbitraria()))
		game.addVisual(new Maletin(position = utilidadesParaJuego.posicionArbitraria()))

		//Elementos que otorgan Dinero
		game.addVisual(new Moneda(position = utilidadesParaJuego.posicionArbitraria()))
		game.addVisual(new Billete(position = utilidadesParaJuego.posicionArbitraria()))

		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(personajeNivel2)

		// teclado

		keyboard.s().onPressDo({ self.salir()})

		keyboard.right().onPressDo{ personajeNivel2.moverDerecha()}
		keyboard.left().onPressDo{ personajeNivel2.moverIzquierda()}
		keyboard.up().onPressDo{ personajeNivel2.moverArriba()}
		keyboard.down().onPressDo{ personajeNivel2.moverAbajo()}

		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })
		keyboard.p().onPressDo({ self.perder() })

		// colisiones, acá sí hacen falta
		game.onCollideDo(personajeNivel2, {e=> e.chocarConPersonaje()})


		// prueba de posicionar aleatoriamente bichos
		/*bicho1.position(utilidadesParaJuego.posicionArbitraria())
		bicho2.position(utilidadesParaJuego.posicionArbitraria())
		bicho3.position(utilidadesParaJuego.posicionArbitraria())
		bicho4.position(utilidadesParaJuego.posicionArbitraria())
		game.addVisual(bicho1)
		game.addVisual(bicho2)
		game.addVisual(bicho3)
		game.addVisual(bicho4)*/
	}

		method salir(){
			game.clear()
			game.addVisual(new Fondo(image="fondoCompletoNivel2.png"))
			game.addVisual(personajeNivel2)
			game.schedule(1000, {
				game.clear()
				game.addVisual(new Fondo(image="fondoSalirNivel2.png"))
				game.schedule(2000, {
				game.stop()
				})
			})
	}
 	
	method ganar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
		game.addVisual(personajeNivel2)
		// después de un ratito ...
    	game.schedule(1000, { game.clear()
		// cambio de fondo
			game.addVisual(new Fondo(image = "FondoGanarNivel2.png"))
			// después de un ratito ...
			game.schedule(2000, { // ... limpio todo de nuevo
			game.clear()
			// y arranco el siguiente nivel
			nivelBichos.configurate()
			})
		})
	}
	
	method perder(){
		game.clear()
		game.addVisual(new Fondo(image="fondoCompletoNivel2.png"))
		game.addVisual(personajeNivel2)
		game.schedule(1000, {
			game.clear()
			game.addVisual(new Fondo(image="fondoPerderNivel2.png"))
			game.schedule(2000, {
				game.stop()
			})
		})
	}
  
}
