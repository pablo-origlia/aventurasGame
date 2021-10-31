import wollok.game.*

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

  method estaEnBordeIzquierdo() = self.position().x() == 0

  method estaEnBordeDerecho() = self.position().x() == game.width() - 1

  method estaEnBordeInferior() = self.position().y() == 0

  method estaEnBordeSuperior() = self.position().y() == game.height() - 1

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

var bicho1 = new Bicho(position = game.at(1, 4), image = "bug_1.png")

var bicho2 = new Bicho(position = game.at(1, 5), image = "bug_2.png")

var bicho3 = new Bicho(position = game.at(1, 6), image = "bug_3.png")

var bicho4 = new Bicho(position = game.at(1, 7), image = "bug_4.png")

