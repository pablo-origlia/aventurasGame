import wollok.game.*
import fondo.*
import elementos.*
import nivel2.*
import utilidades.*
import willy.*

object nivelFlores {

  var property flores

  method configurate() {
    // Fondo
    game.addVisual(new Fondo(image = "fondoNivel1.png"))
      // Indicador de Energía
    game.addVisual(indicadorEnergia.imagen())
    game.addVisual(indicadorEnergia.centena())
    game.addVisual(indicadorEnergia.decena())
    game.addVisual(indicadorEnergia.unidad())
    indicadorEnergia.actualizarValor(willy.energia())
      // Indicador de Salud
    game.addVisual(indicadorSalud.imagen())
    game.addVisual(indicadorSalud.centena())
    game.addVisual(indicadorSalud.decena())
    game.addVisual(indicadorSalud.unidad())
    indicadorSalud.actualizarValor(willy.salud())
      // Area de plantado
    game.addVisual(tierra)
      // Elementos que otorgan Energia
    game.addVisual(new Hamburguesa(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Hamburguesa(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Hamburguesa(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Gaseosa(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Gaseosa(position = utilidadesParaJuego.posicionArbitraria()))
    game.addVisual(new Gaseosa(position = utilidadesParaJuego.posicionArbitraria()))
      // Flores - lista de flores agregadas al nivel
    flores = [ new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_1.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_2.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_3.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_4.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_5.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_6.png") ]
    flores.forEach({ f => game.addVisual(f)})
      // Elementos sorpresa
    game.addVisual(quitaEnergia)
    game.addVisual(bonusEnergia)
    game.addVisual(elementoSorpresa)
    game.addVisual(agujeroNegro)
      // Willy
    game.addVisual(willy)
    game.say(willy, "Plantemos todas las plantas!")
      // Colisiones
    game.onCollideDo(willy, { e => willy.manipular(e)})
      // Teclado
    keyboard.s().onPressDo{ self.salir()}
    keyboard.up().onPressDo{ willy.irArriba()}
    keyboard.down().onPressDo{ willy.irAbajo()}
    keyboard.left().onPressDo{ willy.irIzquierda()}
    keyboard.right().onPressDo{ willy.irDerecha()}
      // para agilizar el avance en los niveles
    keyboard.g().onPressDo({ self.ganar()})
    keyboard.p().onPressDo({ self.perder()})
  }

  method salir() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel1.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoSalirNivel1.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method ganar() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel1.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "FondoGanarNivel1.png"))
      game.schedule(2000, { game.clear()
        nivelDinero.configurate()
      })
    })
  }

  method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel1.png"))
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoPerderNivel1.png"))
      game.schedule(2000, { game.stop()})
    })
  }

}

