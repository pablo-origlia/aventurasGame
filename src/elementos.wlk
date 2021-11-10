import wollok.game.*

class Bloque {

  var property position
  const property image = "market.png"

// agregar comportamiento	
}

class ImagenIndicador {

  const property position = game.at(0, game.width()-1)
  const property image = "energia.png"

// No hace nada, es una imagen estática
}

object digitoIndicador2{
  	const property position = game.at(1, game.width()-1)
  	var property image 

  
  method actualizarValor(dato){
  	const digito = (dato/100).truncate(0)
	image = "numero" + digito +".png"
  }
}

object digitoIndicador1 {
  const property position = game.at(2, game.width()-1)
  var property image 

  
	method actualizarValor(dato){
  	const digito = ((dato%100)/10).truncate(0)
	image = "numero" + digito +".png"
  }
}

object digitoIndicador0 {
  const property position = game.at(3, game.width()-1)
  var property image 
  
  
	method actualizarValor(dato){
  	const digito = (dato%100)%10
	image = "numero" + digito +".png"

  }
}


