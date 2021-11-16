import wollok.game.*
import elementos.*
import nivel1.*
import nivel2.*

class Direccion {
	const property siguiente
	const property opuesto
	const property minimo
	const property maximo
}



// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object personajeSimple {

	var property position = game.at(2, 8)
 	var property image = "playerRight.png"
	var property energia = 30
  	var property salud = 100
  	var property dinero = 150
  	var property cantidadDeGranadas = 0

	method cambiarPosicion(pos) {
		self.position(pos)
	}

	method consumirEnergia(){
		energia = 0.max(energia -1)
		indicadorEnergia.actualizarValor(energia)
	
		if (energia == 0){
			nivelFlores.perder()
		}
	}

	method aumentarEnergia(cantidad){
		energia = 999.min(energia + cantidad)
		indicadorEnergia.actualizarValor(energia)
	}
  
	method estaEnBordeIzquierdo() = self.position().x() == 0

	method estaEnBordeDerecho() = self.position().x() == game.width() - 1

	method estaEnBordeInferior() = self.position().y() == 0

	method estaEnBordeSuperior() = self.position().y() == game.height() - 2

	method irAlBordeIzquierdo() {
		self.cambiarPosicion(self.position().left(game.width() - 1))
		self.consumirEnergia()
	}

	method irAlBordeDerecho() {
		self.cambiarPosicion(self.position().right(game.width() - 1))
		self.consumirEnergia()
	}

	method irAlBordeInferior() {
		self.cambiarPosicion(self.position().down(game.height() - 2))
		self.consumirEnergia()
	}

	method irAlBordeSuperior() {
		self.cambiarPosicion(self.position().up(game.height() - 2))
		self.consumirEnergia()
	}

	method avanzarALaDerecha() {
		self.cambiarPosicion(self.position().right(1))
		self.image("playerRight.png")
		self.consumirEnergia()
	}

	method avanzarALaIzquierda() {
		self.cambiarPosicion(self.position().left(1))
		self.image("playerLeft.png")
		self.consumirEnergia()
 	}

	method avanzarArriba() {
		self.cambiarPosicion(self.position().up(1))
		self.consumirEnergia()
	}

	method avanzarAbajo() {
		self.cambiarPosicion(self.position().down(1))
		self.consumirEnergia()
	}

	method moverDerecha() {
		if (self.estaEnBordeDerecho()) {
			self.irAlBordeIzquierdo()
		} else {
			self.avanzarALaDerecha()
		}
	}

	method moverIzquierda() {
		if (self.estaEnBordeIzquierdo()) {
			self.irAlBordeDerecho()
		} else {
			self.avanzarALaIzquierda()
		}
	}

	method moverArriba() {
		if (self.estaEnBordeSuperior()) {
			self.irAlBordeInferior()
		} else {
			self.avanzarArriba()
		}
	}

	method moverAbajo() {
		if (self.estaEnBordeInferior()) {
			self.irAlBordeSuperior()
		} else {
      		self.avanzarAbajo()
		}
	}

}

/**************************************************************************************************/

object personajeNivel2 {

	var property position = game.at(2, 8)
	var property image = "playerRight.png"
	var property energia = 30
  	var property salud = 100
	var property dinero = 150
	var property cantidadDeGranadas = 0
  
  

	method cambiarPosicion(pos) {
    	self.position(pos)
	}

	method aumentarSalud(cantidad){
		salud = 999.min(salud + cantidad)
		indicadorSalud.actualizarValor(salud)
	}
  
	method aumentarDinero(cantidad){
		dinero = 999.min(dinero + cantidad)
		indicadorDinero.actualizarValor(dinero)
	}
  
  
	method estaEnBordeIzquierdo() = self.position().x() == 0

	method estaEnBordeDerecho() = self.position().x() == game.width() - 1

	method estaEnBordeInferior() = self.position().y() == 0

	method estaEnBordeSuperior() = self.position().y() == game.height() - 2

	method irAlBordeIzquierdo() {
		self.cambiarPosicion(self.position().left(game.width() - 1))
	}

	method irAlBordeDerecho() {
		self.cambiarPosicion(self.position().right(game.width() - 1))
	}

	method irAlBordeInferior() {
		self.cambiarPosicion(self.position().down(game.height() - 2))
	}

	method irAlBordeSuperior() {
		self.cambiarPosicion(self.position().up(game.height() - 2))
	}

	method avanzarALaDerecha() {
		self.cambiarPosicion(self.position().right(1))
		self.image("playerRight.png")
	}

	method avanzarALaIzquierda() {
		self.cambiarPosicion(self.position().left(1))
		self.image("playerLeft.png")
	}

	method avanzarArriba() {
		self.cambiarPosicion(self.position().up(1))
	}

	method avanzarAbajo() {
		self.cambiarPosicion(self.position().down(1))
	}

	method moverDerecha() {
		if (self.estaEnBordeDerecho()) {
			self.irAlBordeIzquierdo()
		} else {
			self.avanzarALaDerecha()
		}
	}

	method moverIzquierda() {
		if (self.estaEnBordeIzquierdo()) {
			self.irAlBordeDerecho()
		} else {
			self.avanzarALaIzquierda()
		}
	}

	method moverArriba() {
		if (self.estaEnBordeSuperior()) {
			self.irAlBordeInferior()
		} else {
			self.avanzarArriba()
		}
	}

	method moverAbajo() {
		if (self.estaEnBordeInferior()) {
			self.irAlBordeSuperior()
		} else {
			self.avanzarAbajo()
			}
		}

	}

/**************************************************************************************************/

object personajeNivel3 {

	var property position = game.at(2, 8)
	var property image = "playerRight.png"
	var property energia = 30
	var property salud = 100
	var property dinero = 150
	var property cantidadDeGranadas = 0
  
	method cambiarPosicion(pos) {
		self.position(pos)
	}
  
	method aumentarGranadas(){
		cantidadDeGranadas = 999.min(cantidadDeGranadas + 1)
		indicadorGranadas.actualizarValor(cantidadDeGranadas)
	}
  
  
	method estaEnBordeIzquierdo() = self.position().x() == 0

	method estaEnBordeDerecho() = self.position().x() == game.width() - 1

	method estaEnBordeInferior() = self.position().y() == 0

	method estaEnBordeSuperior() = self.position().y() == game.height() - 2

  	method irAlBordeIzquierdo() {
		self.cambiarPosicion(self.position().left(game.width() - 1))
	}

	method irAlBordeDerecho() {
   		self.cambiarPosicion(self.position().right(game.width() - 1))
	}

	method irAlBordeInferior() {
		self.cambiarPosicion(self.position().down(game.height() - 2))
	}

	method irAlBordeSuperior() {
		self.cambiarPosicion(self.position().up(game.height() - 2))
	}

	method avanzarALaDerecha() {
		self.cambiarPosicion(self.position().right(1))
		self.image("playerRight.png")
	}

	method avanzarALaIzquierda() {
		self.cambiarPosicion(self.position().left(1))
		self.image("playerLeft.png")
	}

	method avanzarArriba() {
		self.cambiarPosicion(self.position().up(1))
	}

	method avanzarAbajo() {
		self.cambiarPosicion(self.position().down(1))
	}

	method moverDerecha() {
		if (self.estaEnBordeDerecho()) {
			self.irAlBordeIzquierdo()
		} else {
			self.avanzarALaDerecha()
		}
	}

	method moverIzquierda() {
		if (self.estaEnBordeIzquierdo()) {
			self.irAlBordeDerecho()
		} else {
			self.avanzarALaIzquierda()
		}
	}

	method moverArriba() {
		if (self.estaEnBordeSuperior()) {
			self.irAlBordeInferior()
		} else {
			self.avanzarArriba()
		}
	}

	method moverAbajo() {
		if (self.estaEnBordeInferior()) {
			self.irAlBordeSuperior()
		} else {
			self.avanzarAbajo()
		}
	}

}





























// Esto de prueba nada mas por ahora.
/*class Bicho {

  var property position
  const property image

}*/
/* 
var bicho1 = new Bicho(position = game.at(1, 4), image = "bug_1.png")

var bicho2 = new Bicho(position = game.at(1, 5), image = "bug_2.png")

var bicho3 = new Bicho(position = game.at(1, 6), image = "bug_3.png")

var bicho4 = new Bicho(position = game.at(1, 7), image = "bug_4.png")
*/