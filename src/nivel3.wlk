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
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompletoNivel2.png"))
		// después de un ratito ...
		game.schedule(2500, {
		game.clear()
		// cambio de fondo
		game.addVisual(new Fondo(image="fondoGanarNivel2.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
 
 }