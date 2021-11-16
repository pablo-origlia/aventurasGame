import wollok.game.*
import fondo.*
import willy.*
import elementos.*
import utilidades.*
import nivel1.*
import nivel3.*

object nivelDinero {

  var property platita	

  method configurate() {
      // Fondo
    game.addVisual(new Fondo(image = "fondoNivel2.png"))
      // Indicador de Dinero
    game.addVisual(indicadorDinero.imagen())
    game.addVisual(indicadorDinero.centena())
    game.addVisual(indicadorDinero.decena())
    game.addVisual(indicadorDinero.unidad())
    indicadorDinero.actualizarValor(willy2.dinero())
      // Indicador de Salud
    game.addVisual(indicadorSalud.imagen())
    game.addVisual(indicadorSalud.centena())
    game.addVisual(indicadorSalud.decena())
    game.addVisual(indicadorSalud.unidad())
    indicadorSalud.actualizarValor(willy2.salud())
      // Elementos que otorgan Salud
    game.addVisual(new Curita(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Curita(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Maletin(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Maletin(position = utilidadesParaJuego.posicionArbitraria()))
      // Elementos que otorgan Dinero
    platita = 	[new Moneda(position = utilidadesParaJuego.posicionArbitraria()),
    			new Moneda(position = utilidadesParaJuego.posicionArbitraria()),
    			new Moneda(position = utilidadesParaJuego.posicionArbitraria()),
    			new Billete(position = utilidadesParaJuego.posicionArbitraria()),
    			new Billete(position = utilidadesParaJuego.posicionArbitraria()),
    			new Billete(position = utilidadesParaJuego.posicionArbitraria())		
    			]
    platita.forEach({ p => game.addVisual(p)})
      // Willy
    game.addVisual(willy2)
    game.say(willy2, "Juntemos toda la platita!")
      // Colisiones
    game.onCollideDo(willy2, { e => willy2.manipular(e)})
      // Teclado
    keyboard.s().onPressDo({ self.salir()})
    keyboard.up().onPressDo{ willy2.irArriba()}
    keyboard.down().onPressDo{ willy2.irAbajo()}
    keyboard.left().onPressDo{ willy2.irIzquierda()}
    keyboard.right().onPressDo{ willy2.irDerecha()}
	  // Para agilizar el avance en los niveles
    keyboard.g().onPressDo({ self.ganar()})
    keyboard.p().onPressDo({ self.perder()})
      // Para volver al nivel 1 DEBUGGING
    keyboard.v().onPressDo({ game.clear()
      nivelFlores.configurate()
    })

  }

  method salir() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
    game.schedule(500, { game.clear()
      game.addVisual(new Fondo(image = "fondoSalirNivel2.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method ganar() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
    game.schedule(500, { game.clear()
      game.addVisual(new Fondo(image = "FondoGanarNivel2.png"))
      game.schedule(1500, { 
        game.clear()
        nivelBichos.configurate()
      })
    })
  }

  method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoPerderNivel2.png"))
      game.schedule(2000, { game.stop()})
    })
  }
  
}

