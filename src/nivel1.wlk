import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*

object nivelBloques {

  method configurate() {
    // fondo - es importante que sea el primer visual que se agregue
    game.addVisual(new Fondo(image = "fondoCompleto.png"))
      // otros visuals, p.ej. bloques o llaves
    game.addVisual(new Bloque(position = game.at(3, 12)))
      // prueba de posicionar aleatoreamente bichos
    bicho1.position(utilidadesParaJuego.posicionArbitraria())
    bicho2.position(utilidadesParaJuego.posicionArbitraria())
    bicho3.position(utilidadesParaJuego.posicionArbitraria())
    bicho4.position(utilidadesParaJuego.posicionArbitraria())
    game.addVisual(bicho1)
    game.addVisual(bicho2)
    game.addVisual(bicho3)
    game.addVisual(bicho4)
      // personaje, es importante que sea el último visual que se agregue
    game.addVisual(personajeSimple)
      // teclado
      // este es para probar, no es necesario dejarlo
    keyboard.t().onPressDo({ self.terminar()})
    keyboard.right().onPressDo{ personajeSimple.moverDerecha()}
    keyboard.left().onPressDo{ personajeSimple.moverIzquierda()}
    keyboard.up().onPressDo{ personajeSimple.moverArriba()}
    keyboard.down().onPressDo{ personajeSimple.moverAbajo()}
  // en este no hacen falta colisiones
  }

  method terminar() {
    // game.clear() limpia visuals, teclado, colisiones y acciones
    game.clear()
      // después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
    game.addVisual(new Fondo(image = "fondoCompleto.png"))
    game.addVisual(personajeSimple)
      // después de un ratito ...
    game.schedule(2500, { game.clear()
        // cambio de fondo
      game.addVisual(new Fondo(image = "finNivel1.png"))
        // después de un ratito ...
      game.schedule(3000, { // ... limpio todo de nuevo
        game.clear()
          // y arranco el siguiente nivel
        nivelLlaves.configurate()
      })
    })
  }

}

