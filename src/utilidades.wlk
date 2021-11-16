import wollok.game.*


object utilidadesParaJuego {
	
	method posicionArbitraria() {
		const posicion = game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()-1).truncate(0))
		if(game.getObjectsIn(posicion).isEmpty())
			return posicion
		else
			self.posicionArbitraria()
	}	
	
	method posicionArbitraria2() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()-1).truncate(0)
		)
	}
	
}

/*object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()-1).truncate(0)
		)
	}
}*/
