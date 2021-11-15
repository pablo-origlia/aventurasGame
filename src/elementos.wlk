import wollok.game.*
import willy.*
import utilidades.*
import nivel1.*

object tierra {

  const property ancho = 5
  const property alto = 4
  const property position = game.at(1.randomUpTo(game.width() - ancho - 1).truncate(0), 1.randomUpTo(game.height() - alto - 2).truncate(0))
  const property image = "tierra.png"

  method reaccionar(direccion) {
  }

  method puedePisarte(_) = true

}

class Flor {

  var property position
  const property image = "flor_4.png"

  method reaccionar(direccion) {
    if (self.validarLugarLibre(direccion)) {
      position = direccion.siguiente(position)
    }
  }

  method validarLugarLibre(direccion) {
    const posAlLado = direccion.siguiente(position)
    return game.getObjectsIn(posAlLado).all({ obj => obj.puedePisarte(self) })
  }

  method puedePisarte(_) = false

  method estaBienPosicionada() = self.position().x().between(tierra.position().x(), tierra.position().x() + tierra.ancho()) and self.position().y().between(tierra.position().y(), tierra.position().y() + tierra.alto())

}

class Elemento {

  var property position

  method image()

  method cantidadQueOtorga()

  method reaccionar(direccion)

  method puedePisarte(_) = false

}

class Hamburguesa inherits Elemento {

  override method image() = "burger.png"

  override method cantidadQueOtorga() = 15

  override method reaccionar(direccion) {
    willy.aumentarEnergia(self.cantidadQueOtorga())
    game.removeVisual(self)
  }

}

class Gaseosa inherits Hamburguesa {

  override method image() = "soda.png"

  override method cantidadQueOtorga() = 10

}

class Curita inherits Elemento {

  override method image() = "bandage.png"

  override method cantidadQueOtorga() = 30

  override method reaccionar(direccion) {
    willy.aumentarSalud(self.cantidadQueOtorga())
    game.removeVisual(self)
  }

}

class Maletin inherits Curita {

  override method image() = "medicine.png"

  override method cantidadQueOtorga() = 20

}

class Moneda inherits Elemento {

  override method image() = "coin.png"

  override method cantidadQueOtorga() = 50

  override method reaccionar(direccion) {
    willy.aumentarDinero(self.cantidadQueOtorga())
    game.removeVisual(self)
  }

}

class Billete inherits Moneda {

  override method image() = "dolar.png"

  override method cantidadQueOtorga() = 100

}

// Celdas sorpresa
object quitaEnergia {

  const property position = utilidadesParaJuego.posicionArbitraria()
  const property image = "question_block.png"

  method reaccionar(direccion) {
    game.removeVisual(self)
    willy.consumirEnergia(15)
  }

  method puedePisarte(_) = false

}

object bonusEnergia {

  const property position = utilidadesParaJuego.posicionArbitraria()
  const property image = "question_block.png"

  method reaccionar(direccion) {
    game.removeVisual(self)
    willy.aumentarEnergia(30)
  }

  method puedePisarte(_) = false

}

object elementoSorpresa {

  const property position = utilidadesParaJuego.posicionArbitraria()
  const property image = "question_block.png"

  method reaccionar(direccion) {
    game.removeVisual(self)
    const flor = new Flor(position = utilidadesParaJuego.posicionArbitraria())
    game.addVisual(flor)
    nivelFlores.flores().add(flor)
  }

  method puedePisarte(_) = false

}

object agujeroNegro {

  const property position = utilidadesParaJuego.posicionArbitraria()
  const property image = "question_block.png"

  method reaccionar(direccion) {
    game.removeVisual(self)
    game.say(willy, "Maldito agujero negro!")
    willy.position(utilidadesParaJuego.posicionArbitraria())
  }

  method puedePisarte(_) = false

}

class ImagenIndicador {

  const property position
  const property image

// No hace nada, es una imagen estática
}

class DigitoIndicador {

  var property position
  var property image = "sinnumero.png"

  method actualizarValor(dato)

}

class DigitoIndicadorCentena inherits DigitoIndicador {

  override method actualizarValor(dato) {
    const digito = (dato / 100).truncate(0)
    image = "digito" + digito + "_.png"
  }

}

class DigitoIndicadorDecena inherits DigitoIndicador {

  override method actualizarValor(dato) {
    const digito = ((dato % 100) / 10).truncate(0)
    image = "digito" + digito + "_.png"
  }

}

class DigitoIndicadorUnidad inherits DigitoIndicador {

  override method actualizarValor(dato) {
    const digito = (dato % 100) % 10
    image = "digito" + digito + "_.png"
  }

}

object indicadorEnergia {

  const property imagen = new ImagenIndicador(position = game.at(0, game.width() - 1), image = "energia.png")
  var property centena = new DigitoIndicadorCentena(position = game.at(1, game.width() - 1))
  var property decena = new DigitoIndicadorDecena(position = game.at(2, game.width() - 1))
  var property unidad = new DigitoIndicadorUnidad(position = game.at(3, game.width() - 1))

  method actualizarValor(dato) {
    centena.actualizarValor(dato)
    decena.actualizarValor(dato)
    unidad.actualizarValor(dato)
  }

}

object indicadorDinero {

  const property imagen = new ImagenIndicador(position = game.at(0, game.width() - 1), image = "dinero.png")
  var property centena = new DigitoIndicadorCentena(position = game.at(1, game.width() - 1))
  var property decena = new DigitoIndicadorDecena(position = game.at(2, game.width() - 1))
  var property unidad = new DigitoIndicadorUnidad(position = game.at(3, game.width() - 1))

  method actualizarValor(dato) {
    centena.actualizarValor(dato)
    decena.actualizarValor(dato)
    unidad.actualizarValor(dato)
  }

}

object indicadorSalud {

  const property imagen = new ImagenIndicador(position = game.at(5, game.width() - 1), image = "salud.png")
  var property centena = new DigitoIndicadorCentena(position = game.at(6, game.width() - 1))
  var property decena = new DigitoIndicadorDecena(position = game.at(7, game.width() - 1))
  var property unidad = new DigitoIndicadorUnidad(position = game.at(8, game.width() - 1))

  method actualizarValor(dato) {
    centena.actualizarValor(dato)
    decena.actualizarValor(dato)
    unidad.actualizarValor(dato)
  }

}

object indicadorGranadas {

  const property imagen = new ImagenIndicador(position = game.at(0, game.width() - 1), image = "granada.png")
  var property centena = new DigitoIndicadorCentena(position = game.at(1, game.width() - 1))
  var property decena = new DigitoIndicadorDecena(position = game.at(2, game.width() - 1))
  var property unidad = new DigitoIndicadorUnidad(position = game.at(3, game.width() - 1))

  method actualizarValor(dato) {
    centena.actualizarValor(dato)
    decena.actualizarValor(dato)
    unidad.actualizarValor(dato)
  }

}

class Bichos {

  const property image
  var property position

}

class Posicion {

  var property position

}

