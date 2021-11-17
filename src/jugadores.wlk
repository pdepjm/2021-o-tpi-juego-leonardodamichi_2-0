import barcos.*
import wollok.game.*


class Aliado{	
	var b1 = new BarcoAliado(position = game.at(4,3), tipo = new Tipo(nombre = "submarino", tamanio = 2, vida = 2))
	var b2 = new BarcoAliado(position = game.at(6,3), tipo = new Tipo(nombre = "submarino", tamanio = 2, vida = 2))
	var b3 = new BarcoAliado(position = game.at(8,3), tipo = new Tipo(nombre = "submarino", tamanio = 2, vida = 2))
	var b4 = new BarcoAliado(position = game.at(10,3), tipo = new Tipo(nombre = "corbeta", tamanio = 3, vida = 3))
	var b5 = new BarcoAliado(position = game.at(4,2), tipo = new Tipo(nombre = "corbeta", tamanio = 3, vida = 3))
	var b6 = new BarcoAliado(position = game.at(7,2), tipo = new Tipo(nombre = "fragata", tamanio = 4, vida = 4))
	var b7 = new BarcoAliado(position = game.at(4,1), tipo = new Tipo(nombre = "portaviones", tamanio = 5, vida = 5))
		
	const barcos = [b1,b2,b3,b4,b5,b6,b7]	
	
	method barcos() = barcos
	
	method ubicarBarcos(){
		barcos.forEach({barco => game.addVisual(barco)})	
	}
	
	method obtenerBarco(pos) = barcos.find({barco => barco.posiciones().contains(pos)})
	
	method hayBarco(pos) = barcos.any({barco => barco.posiciones().contains(pos)})
		
	method barcosHundidos() = barcos.all({barco => barco.hundido()})

	method posicionesValidas() = barcos.all({barco => barco.posiciones().all({pos => self.esPosicionValida(pos)})})
	
	method esPosicionValida(pos) = pos.x() >= 4 and pos.x() <= 13 and pos.y() >= 4 and pos.y() <= 13
}

class Enemigo{
	var b1 = new BarcoEnemigo(position = game.at(19,12), tipo = new Tipo(nombre = "submarino", tamanio = 2, vida = 2, orientacion = vertical))
	var b2 = new BarcoEnemigo(position = game.at(20,8), tipo = new Tipo(nombre = "submarino", tamanio = 2, vida = 2, orientacion = vertical))
	var b3 = new BarcoEnemigo(position = game.at(24,11), tipo = new Tipo(nombre = "submarino", tamanio = 2, vida = 2))
	var b4 = new BarcoEnemigo(position = game.at(18,4), tipo = new Tipo(nombre = "corbeta", tamanio = 3, vida = 3, orientacion = vertical))
	var b5 = new BarcoEnemigo(position = game.at(22,6), tipo = new Tipo(nombre = "corbeta", tamanio = 3, vida = 3))
	var b6 = new BarcoEnemigo(position = game.at(27,8), tipo = new Tipo(nombre = "fragata", tamanio = 4, vida = 4, orientacion = vertical))
	var b7 = new BarcoEnemigo(position = game.at(22,4), tipo = new Tipo(nombre = "portaviones", tamanio = 5, vida = 5))
	
	const barcosE = [b1,b2,b3,b4,b5,b6,b7]
		
	method barcos() = barcosE
	
	method ubicarBarcos(){
		barcosE.forEach({barco => game.addVisual(barco)})
	}
	
	method obtenerBarco(pos) = barcosE.find({barco => barco.posiciones().contains(pos)})
	
	
	method barcosHundidos() = barcosE.all({barco => barco.hundido()})

	method hayBarco(pos) = barcosE.any({barco => barco.posiciones().contains(pos)})
	
}







	
