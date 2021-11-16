import wollok.game.*
import fondo.*
import willy.*
import elementos.*
import utilidades.*
import nivel2.*

object nivelBichos {

  var property bichos = []
  var property granadas = []

  method configurate() {
    // Fondo
    game.addVisual(new Fondo(image = "fondoNivel3.png"))
      // Indicador de Granadas
    game.addVisual(indicadorGranadas.imagen())
    game.addVisual(indicadorGranadas.centena())
    game.addVisual(indicadorGranadas.decena())
    game.addVisual(indicadorGranadas.unidad())
    indicadorGranadas.actualizarValor(willy3.cantidadDeGranadas())
      // Indicador de Salud
    game.addVisual(indicadorSalud.imagen())
    game.addVisual(indicadorSalud.centena())
    game.addVisual(indicadorSalud.decena())
    game.addVisual(indicadorSalud.unidad())
    indicadorSalud.actualizarValor(willy3.salud())
      // Bichos
    bichos = [ new Bicho (image = "bug_1.png", position = utilidadesParaJuego.posicionArbitraria()), new Bicho (image = "bug_2.png", position = utilidadesParaJuego.posicionArbitraria()), new Bicho (image = "bug_3.png", position = utilidadesParaJuego.posicionArbitraria()), new Bicho (image = "bug_4.png", position = utilidadesParaJuego.posicionArbitraria()) ]
    bichos.forEach({ b => game.addVisual(b)})
      // Granadas
    granadas = [ new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()), new Granada(position = utilidadesParaJuego.posicionArbitraria()) ]
    granadas.forEach({ g => game.addVisual(g)})
      // Personaje
    game.addVisual(willy3)
    game.say(willy3, "¡Matemos a todos los bichos!")
      // Colisiones
    game.onCollideDo(willy3, { e => willy3.manipular(e)})
      // Eventos Automáticos  
    game.onTick(10000, "movimiento", { bichos.forEach({ b => b.movete()})})
      // Teclado
    keyboard.s().onPressDo({ self.salir()})
    keyboard.up().onPressDo{ willy3.irArriba()}
    keyboard.down().onPressDo{ willy3.irAbajo()}
    keyboard.left().onPressDo{ willy3.irIzquierda()}
    keyboard.right().onPressDo{ willy3.irDerecha()}
    keyboard.space().onPressDo{ willy3.lanzarGranada()}
      // Para agilizar el avance en los niveles
    keyboard.g().onPressDo({ self.ganar()})
    keyboard.p().onPressDo({ self.perder()})
      // Para volver al nivel 2 DEBUGGING
    keyboard.v().onPressDo({ game.clear()
      nivelDinero.configurate()
    })
  }

  method salir() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel3.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoSalirNivel3.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method ganar() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel3.png"))
    game.schedule(500, { game.clear()
      game.addVisual(new Fondo(image = "fondoGanarNivel3.png"))
      game.schedule(1500, { game.stop()})
    })
  }

  method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel3.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoPerderNivel3.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method perder2() {
    game.schedule(500, { game.clear()})
    game.addVisual(new Fondo(image = "fondoCompletoNivel3.png"))
    game.schedule(500, { game.clear()
      game.addVisual(new Fondo(image = "fondoPerderNivel3_2.png"))
      game.schedule(2000, { game.stop()})
    })
  }

}

