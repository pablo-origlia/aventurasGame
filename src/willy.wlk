import wollok.game.*
import direcciones.*
import elementos.*
import nivel1.*

object willy {

  var property position = game.at(0, 13)
  var direccion = arriba
  var property energia = 30
  var property salud = 100
  var property dinero = 150
  var property cantidadDeGranadas = 0
  var property image = "playerRight.png"

  method cambiarPosicion(pos) {
    self.position(pos)
  }

  method consumirEnergia(cantidadDeEnergia) {
    energia = 0.max(energia - cantidadDeEnergia)
    indicadorEnergia.actualizarValor(energia)
    if (energia == 0) {
      nivelFlores.perder()
    }
  }

  method aumentarEnergia(cantidadDeEnergia) {
    energia = 999.min(energia + cantidadDeEnergia)
    indicadorEnergia.actualizarValor(energia)
  }

  method retrocede() {
    position = direccion.opuesto().siguiente(position)
  }

  method retrocedeCon(caja) {
    self.retrocede()
    caja.movete(direccion.opuesto())
  }

  method irArriba() {
    direccion = arriba
    self.avanzar()
  }

  method irAbajo() {
    direccion = abajo
    self.avanzar()
  }

  method irIzquierda() {
    direccion = izquierda
    self.avanzar()
    self.image("playerLeft.png")
  }

  method irDerecha() {
    direccion = derecha
    self.avanzar()
    self.image("playerRight.png")
  }

  method avanzar() {
    position = direccion.siguiente(position)
    self.consumirEnergia(1)
  }

  method setDireccion(unaDireccion) {
    direccion = unaDireccion
  }

  method manipular(unElemento) {
    try
      unElemento.reaccionar(direccion)
    catch e {
      console.println("Aca pasa algo.")
        // console.println(e)
      self.retrocede()
    }
  }

  method aumentarSalud(cantidad) {
    salud = 999.min(salud + cantidad)
    indicadorSalud.actualizarValor(salud)
  }

  method aumentarDinero(cantidad) {
    dinero = 999.min(dinero + cantidad)
    indicadorDinero.actualizarValor(dinero)
  }

}

/**************************************/
object willy2 {

  method aumentarDinero(cantidad) {
  }

}

