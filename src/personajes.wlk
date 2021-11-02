import wollok.game.*

class Direccion {
  const property siguiente
  const property opuesto
  const property minimo
  const property maximo
}

const norte = new Direccion(oeste, sur)
const oeste = new Direccion(sur, este)
const sur = new Direccion(este, norte)
const este = new Direccion(norte, oeste)

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object personajeSimple {

  var property position = game.at(10, 8)
  const property image = "player.png"
  var property energia = 100
  var property salud = 100
  var property cantidadDeGranadas = 0

  method cambiarPosicion(pos) {
    self.position(pos)
  }

  method estaEnBorde(direccion) {
    if (direccion == norte) {
      return (self.position().y() == game.height() - 1)
    }

    if (direccion == sur) {
      return (self.position().y() == 0)
    }

    if (direccion == este) {
      return (self.position().x() == game.width() - 1)
    }

    if (direccion == oeste) {
      return (self.position().x() == 0)
    }    
  }
/*
  method estaEnBordeIzquierdo() = self.position().x() == 0

  method estaEnBordeDerecho() = self.position().x() == game.width() - 1

  method estaEnBordeInferior() = self.position().y() == 0

  method estaEnBordeSuperior() = self.position().y() == game.height() - 1
*/
  method irAlBorde(direccion) {
    if (direccion == norte) {
      self.cambiarPosicion(
        self.position().up(
          (game.height() - 1) - self.position().y()
        )
      )
    }

    if (direccion == sur) {
      self.cambiarPosicion(
        self.position().down(
          self.position().y()
        )
      )
    }

    if (direccion == este) {
      self.cambiarPosicion(
        self.position().right(
          (game.width() - 1) - self.position().x()
        )
      )
    }

    if (direccion == oeste) {
      self.cambiarPosicion(
        self.position().left(
          self.position().y()
        )
      )
    }
  }

/*
  method irAlBordeIzquierdo() {
    self.cambiarPosicion(self.position().left(game.width() - 1))
  }

  method irAlBordeDerecho() {
    self.cambiarPosicion(self.position().right(game.width() - 1))
  }

  method irAlBordeInferior() {
    self.cambiarPosicion(self.position().down(game.height() - 1))
  }

  method irAlBordeSuperior() {
    self.cambiarPosicion(self.position().up(game.height() - 1))
  }
*/
  method avanzarALaDerecha() {
    self.cambiarPosicion(self.position().right(1))
  }

  method avanzarALaIzquierda() {
    self.cambiarPosicion(self.position().left(1))
  }

  method avanzarArriba() {
    self.cambiarPosicion(self.position().up(1))
  }

  method avanzarAbajo() {
    self.cambiarPosicion(self.position().down(1))
  }

  method moverDerecha() {
    if (self.estaEnBorde(este)) {
      self.irAlBorde(oeste)
    } else {
      self.avanzarALaDerecha()
    }
  }

  method moverIzquierda() {
    if (self.estaEnBorde(oeste)) {
      self.irAlBorde(este)
    } else {
      self.avanzarALaIzquierda()
    }
  }

  method moverArriba() {
    if (self.estaEnBorde(norte)) {
      self.irAlBorde(sur)
    } else {
      self.avanzarArriba()
    }
  }

  method moverAbajo() {
    if (self.estaEnBorde(sur)) {
      self.irAlBorde(norte)
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

var bicho1 = new Bicho(position = game.at(1, 4), image = "bug_1.png")

var bicho2 = new Bicho(position = game.at(1, 5), image = "bug_2.png")

var bicho3 = new Bicho(position = game.at(1, 6), image = "bug_3.png")

var bicho4 = new Bicho(position = game.at(1, 7), image = "bug_4.png")

