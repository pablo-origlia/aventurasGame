import wollok.game.*
import elementos.*

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
  const property image = "player.png"
  var property energia = 30
  var property salud = 100
  var property cantidadDeGranadas = 0
  
  

  method cambiarPosicion(pos) {
    self.position(pos)
  }

  method consumirEnergia(){
  	energia = 0.max(energia -1)
	digitoIndicador2.actualizarValor(energia)
	digitoIndicador1.actualizarValor(energia)
	digitoIndicador0.actualizarValor(energia)
  	if (energia == 0){
  		//TERMINAR EL JUEGO
  	}
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
    self.consumirEnergia()
  }

  method avanzarALaIzquierda() {
    self.cambiarPosicion(self.position().left(1))
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

// Esto de prueba nada mas por ahora.
class Bicho {

  var property position
  const property image

}
/* 
var bicho1 = new Bicho(position = game.at(1, 4), image = "bug_1.png")

var bicho2 = new Bicho(position = game.at(1, 5), image = "bug_2.png")

var bicho3 = new Bicho(position = game.at(1, 6), image = "bug_3.png")

var bicho4 = new Bicho(position = game.at(1, 7), image = "bug_4.png")
*/