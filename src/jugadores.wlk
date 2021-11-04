import barcos.*
import wollok.game.*


class Aliado{	
	var barcos = [
		new BarcoAliado(position = game.at(4,3), tipoBarco = submarino, vida = 2),
		new BarcoAliado(position = game.at(6,3), tipoBarco = submarino, vida = 2),
		new BarcoAliado(position = game.at(8,3), tipoBarco = submarino, vida = 2),
		new BarcoAliado(position = game.at(10,3), tipoBarco = corbeta, vida = 3),
		new BarcoAliado(position = game.at(4,2), tipoBarco = corbeta, vida = 3),
		new BarcoAliado(position = game.at(7,2), tipoBarco = fragata, vida = 4),
		new BarcoAliado(position = game.at(4,1), tipoBarco = portaviones, vida = 5)
		]
	
	
	method barcos() = barcos
	
	method barcosHundidos() = self.barcos().all({a => a.barcoHundido()})
}

class Enemigo{
	var barcos = [
		new BarcoEnemigo(position = game.at(19,12), posiciones = [game.at(19,12),game.at(19,13)], tipoBarco = submarino, vida = 2),
		new BarcoEnemigo(position = game.at(20,8), posiciones = [game.at(20,8),game.at(21,8)], tipoBarco = submarino, vida = 2),
		new BarcoEnemigo(position = game.at(24,11), posiciones = [game.at(24,11),game.at(24,12)], tipoBarco = submarino, vida = 2),
		new BarcoEnemigo(position = game.at(18,4), posiciones = [game.at(18,4),game.at(18,5),game.at(18,6)], tipoBarco = corbeta, vida = 3),
		new BarcoEnemigo(position = game.at(22,6), posiciones = [game.at(22,6),game.at(23,6),game.at(24,6)], tipoBarco = corbeta, vida = 3),
		new BarcoEnemigo(position = game.at(27,8), posiciones = [game.at(27,8),game.at(27,9),game.at(27,10),game.at(27,11)], tipoBarco = fragata, vida = 4),
		new BarcoEnemigo(position = game.at(22,4), posiciones = [game.at(22,4),game.at(23,4),game.at(24,4),game.at(25,4),game.at(26,4)], tipoBarco = portaviones, vida = 5)
		]
		
	method barcos() = barcos
	
	method barcosHundidos() = self.barcos().all({a => a.barcoHundido()})

}


//const aliado = new Aliado()
//const enemigo = new Enemigo()






	
