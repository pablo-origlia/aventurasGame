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
    // fondo - es importante que sea el primer visual que se agregue
    game.addVisual(new Fondo(image = "fondoNivel2.png"))
      // otros visuals, p.ej. bloques o llaves
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
    game.addVisual(new Maletin(position = utilidadesParaJuego.posicionArbitraria()))
      // Elementos que otorgan Dinero
      
    platita = 	[new Moneda(position = utilidadesParaJuego.posicionArbitraria()),
    			new Moneda(position = utilidadesParaJuego.posicionArbitraria()),
    			new Billete(position = utilidadesParaJuego.posicionArbitraria()),
    			new Billete(position = utilidadesParaJuego.posicionArbitraria())		
    			]
    platita.forEach({ p => game.addVisual(p)})
    
      // Puerta de salida
    //game.addVisual(new Puerta(position = utilidadesParaJuego.posicionArbitraria()))
      // personaje, es importante que sea el último visual que se agregue
      // Willy
    game.addVisual(willy2)
    game.say(willy2, "¡Ayudame a juntar plata y medicina!")
      // Colisiones
    game.onCollideDo(willy2, { e => willy2.manipular(e)})
      // TECLADO
    // keyboard.any().onPressDo{ self.comprobarSiGano()}
    keyboard.up().onPressDo{ willy2.irArriba()}
    keyboard.down().onPressDo{ willy2.irAbajo()}
    keyboard.left().onPressDo{ willy2.irIzquierda()}
    keyboard.right().onPressDo{ willy2.irDerecha()}
      // este es para probar, no es necesario dejarlo
    keyboard.g().onPressDo({ self.ganar()})
    keyboard.p().onPressDo({ self.perder()})
      // para volver al nivel 1 DEBUGGING
    keyboard.v().onPressDo({ game.clear()
      nivelFlores.configurate()
    })

  // prueba de posicionar aleatoriamente bichos
  /*bicho1.position(utilidadesParaJuego.posicionArbitraria())
   * bicho2.position(utilidadesParaJuego.posicionArbitraria())
   * bicho3.position(utilidadesParaJuego.posicionArbitraria())
   * bicho4.position(utilidadesParaJuego.posicionArbitraria())
   * game.addVisual(bicho1)
   * game.addVisual(bicho2)
   * game.addVisual(bicho3)
   game.addVisual(bicho4)*/
  }

  method salir() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
    game.addVisual(willy2)
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoSalirNivel2.png"))
      game.schedule(2000, { game.stop()})
    })
  }

  method ganar() {
    // game.clear() limpia visuals, teclado, colisiones y acciones
    game.clear()
      // después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
    game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
    game.addVisual(willy2)
      // después de un ratito ...
    game.schedule(1000, { game.clear()
        // cambio de fondo
      game.addVisual(new Fondo(image = "FondoGanarNivel2.png"))
        // después de un ratito ...
      game.schedule(2000, { // ... limpio todo de nuevo
        game.clear()
          // y arranco el siguiente nivel
        nivelBichos.configurate()
      })
    })
  }

  method perder() {
    game.clear()
    game.addVisual(new Fondo(image = "fondoCompletoNivel2.png"))
    game.addVisual(willy2)
    game.schedule(1000, { game.clear()
      game.addVisual(new Fondo(image = "fondoPerderNivel2.png"))
      game.schedule(2000, { game.stop()})
    })
  }
  
  	/*method comprobarSiGano(){
		if (platita.isEmpty() and willy2.salud() > 0){
			game.say(willy2, "GANASTE!")
			self.ganar()
		}
	
	}*/

}

