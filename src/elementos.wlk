import wollok.game.*
import personajes.*
import utilidades.*

object tierra{
	const ancho = 5
	const alto = 4
	const property position = game.at(1.randomUpTo(game.width()-ancho-1).truncate(0), 1.randomUpTo(game.height()-alto-2).truncate(0))
	const property image = "tierra.png"
	
	method chocarConPersonaje(){}
}

class Flor {

  var property position
  const property image = "flor_4.png"
  method chocarConPersonaje(){}

// agregar comportamiento	
}

class AgujeroNegro{
	const property position
	
	method chocarConPersonaje(){
		game.say(personajeSimple,"Maldito agujero negro!")
		personajeSimple.position(utilidadesParaJuego.posicionArbitraria())
		
	}
	
}

class Elemento{
	var property position 
	method cantidadQueOtorga()
	method chocarConPersonaje()
	method image()
}

class Hamburguesa inherits Elemento{
	override method cantidadQueOtorga() = 15

	
	override method chocarConPersonaje(){
		personajeSimple.aumentarEnergia(self.cantidadQueOtorga())
		game.removeVisual(self)
	}
	
	override method image() = "burger.png"
}


class Gaseosa inherits Hamburguesa{
		
	override method cantidadQueOtorga() = 10
	override method image() = "soda.png"
}


class Curita inherits Elemento{
	
	override method chocarConPersonaje(){
		personajeNivel2.aumentarSalud(self.cantidadQueOtorga())
		game.removeVisual(self)
	}
	
	override method cantidadQueOtorga() = 30
	
	override method image() = "bandage.png"
}

class Maletin inherits Curita{
	
	override method image() = "medicine.png"
	override method cantidadQueOtorga() = 20
}


class Moneda inherits Elemento{
	
	override method chocarConPersonaje(){
		personajeNivel2.aumentarDinero(self.cantidadQueOtorga())
		game.removeVisual(self)
	}
	override method image()= "coin.png"
	override method cantidadQueOtorga () = 50
}

class Billete inherits Moneda{
	
	override method image()= "dolar.png"
	override method cantidadQueOtorga () = 100
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

class DigitoIndicadorCentena inherits DigitoIndicador{
  	//const property position = game.at(1, game.width()-1)
  	//var property image 

 	override method actualizarValor(dato){
  		const digito = (dato/100).truncate(0)
		image = "digito" + digito +".png"
  	}
}

class DigitoIndicadorDecena inherits DigitoIndicador {
  //const property position = game.at(2, game.width()-1)
  //var property image 

  
	override method actualizarValor(dato){
  	const digito = ((dato%100)/10).truncate(0)
	image = "digito" + digito +".png"
  }
}

class DigitoIndicadorUnidad inherits DigitoIndicador {
  //const property position = game.at(3, game.width()-1)
  //var property image 
  
  
	override method actualizarValor(dato){
  	const digito = (dato%100)%10
	image = "digito" + digito +".png"

  }
}

object indicadorEnergia{
	const property imagen = new ImagenIndicador(position = game.at(0, game.width()-1),image = "energia.png")
	var property centena = new DigitoIndicadorCentena(position = game.at(1, game.width()-1))
	var property decena = new DigitoIndicadorDecena(position = game.at(2, game.width()-1))
	var property unidad = new DigitoIndicadorUnidad(position = game.at(3, game.width()-1))
	
	method actualizarValor(dato){
		centena.actualizarValor(dato)
		decena.actualizarValor(dato)
		unidad.actualizarValor(dato)
	}
}


object indicadorDinero{
	const property imagen = new ImagenIndicador(position = game.at(0, game.width()-1),image = "dinero.png")
	var property centena = new DigitoIndicadorCentena(position = game.at(1, game.width()-1))
	var property decena = new DigitoIndicadorDecena(position = game.at(2, game.width()-1))
	var property unidad = new DigitoIndicadorUnidad(position = game.at(3, game.width()-1))
	
	method actualizarValor(dato){
		centena.actualizarValor(dato)
		decena.actualizarValor(dato)
		unidad.actualizarValor(dato)
	}
}


object indicadorSalud{
	const property imagen = new ImagenIndicador(position = game.at(5, game.width()-1),image = "salud.png")
	var property centena = new DigitoIndicadorCentena(position = game.at(6, game.width()-1))
	var property decena = new DigitoIndicadorDecena(position = game.at(7, game.width()-1))
	var property unidad = new DigitoIndicadorUnidad(position = game.at(8, game.width()-1))
	
	method actualizarValor(dato){
		centena.actualizarValor(dato)
		decena.actualizarValor(dato)
		unidad.actualizarValor(dato)
	}
}


class Posicion{
	var property position
}


