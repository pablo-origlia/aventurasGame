import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*
import willy.*

object nivelFlores {

  var property flores

  method configurate() {
    // Fondo
    game.addVisual(new Fondo(image = "fondoNivel1.png"))
      // otros visuals, p.ej. bloques o llaves
      // game.addVisual(new Bloque(position = game.at(3, 12)))
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
    flores = [ new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_1.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_2.png"), new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_3.png") // new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_4.png"), 
//      new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_5.png"), 
//      new Flor(position = utilidadesParaJuego.posicionArbitraria(),image = "flor_6.png")
    ]
    flores.forEach({ f => game.addVisual(f)})
      /*game.addVisual(new Flor(position = utilidadesParaJuego.posicionArbitraria()))
       * game.addVisual(new Flor(position = utilidadesParaJuego.posicionArbitraria()))
       * game.addVisual(new Flor(position = utilidadesParaJuego.posicionArbitraria()))
       * game.addVisual(new Flor(position = utilidadesParaJuego.posicionArbitraria()))
       * game.addVisual(new Flor(position = utilidadesParaJuego.posicionArbitraria()))
       game.addVisual(new Flor(position = utilidadesParaJuego.posicionArbitraria()))*/
      /*const flores = [new Posicion(position = utilidadesParaJuego.posicionArbitraria()),new Posicion(position = utilidadesParaJuego.posicionArbitraria()),
       * 	new Posicion(position = utilidadesParaJuego.posicionArbitraria()),new Posicion(position = utilidadesParaJuego.posicionArbitraria()),
       * 	new Posicion(position = utilidadesParaJuego.posicionArbitraria()),new Posicion(position = utilidadesParaJuego.posicionArbitraria())]
       .map{ p => self.dibujar(new Flor(position = p)) }*/
      /*, llegadas = llegadas*/
      // Elementos sorpresa
    game.addVisual(quitaEnergia)
    game.addVisual(bonusEnergia)
    game.addVisual(elementoSorpresa)
    game.addVisual(agujeroNegro)
      // game.addVisual(new AgujeroNegro(position = utilidadesParaJuego.posicionArbitraria()))
      // Willy
    game.addVisual(willy)
    game.say(willy, "¡Ayudame a sembrar todas las plantas!")
      // Colisiones
    game.onCollideDo(willy, { e => willy.manipular(e)})
      // TECLADO
    keyboard.any().onPressDo{ self.comprobarSiGano()}
    keyboard.up().onPressDo{ willy.irArriba()}
    keyboard.down().onPressDo{ willy.irAbajo()}
    keyboard.left().onPressDo{ willy.irIzquierda()}
    keyboard.right().onPressDo{ willy.irDerecha()}
      /*
       * 	//Personaje
       *     //Es importante que sea el último visual que se agregue
       * 	game.addVisual(personajeSimple)
       * 	game.showAttributes(personajeSimple)
       * 	game.say(personajeSimple, "¡Ayudame a plantar todas las plantas!")

       *     //Colisiones
       * 	game.onCollideDo(personajeSimple, {e=> e.chocarConPersonaje()})
       *       // Teclado
       *     keyboard.s().onPressDo({ self.salir()})
       *     keyboard.right().onPressDo{ personajeSimple.moverDerecha()}
       *     keyboard.left().onPressDo{ personajeSimple.moverIzquierda()}
       *     keyboard.up().onPressDo{ personajeSimple.moverArriba()}
       *     keyboard.down().onPressDo{ personajeSimple.moverAbajo()}
       */
      // Estos son para probar, no es necesario dejarlo
    keyboard.g().onPressDo({ self.ganar()})
    keyboard.p().onPressDo({ self.perder()})
  // game.addVisual(new Bloque(position = game.at(3, 12)))
  // en este no hacen falta colisiones
  }

  method salir() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel1.png"))
    game.addVisual(personajeNivel3)
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoSalirNivel1.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method ganar() {
    // game.clear() limpia visuals, teclado, colisiones y acciones
    game.clear()
      // después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
    game.addVisual(new Fondo(image = "fondoCompletoNivel1.png"))
    game.addVisual(personajeSimple)
      // después de un ratito ...
    game.schedule(1000, { game.clear()
        // cambio de fondo
      game.addVisual(new Fondo(image = "FondoGanarNivel1.png"))
        // después de un ratito ...
      game.schedule(2000, { // ... limpio todo de nuevo
        game.clear()
          // y arranco el siguiente nivel
        nivelDinero.configurate()
      })
    })
  }

  method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel1.png"))
    game.addVisual(personajeNivel3)
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoPerderNivel1.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method comprobarSiGano() {
    if (flores.all{ f => f.estaBienPosicionada() }) {
      game.say(willy, "GANASTE!")
      self.ganar()
    }
  }

  method dibujar(dibujo) {
    game.addVisual(dibujo)
    return dibujo
  }

}

