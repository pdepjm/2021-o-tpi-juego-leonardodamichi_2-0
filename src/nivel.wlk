import wollok.game.*
import barcos.*
import disparo.*
import impacto.*
import direcciones.*
import mouse.*
import jugadores.*


object nivel {
	
	method configuracionInicial(){
		game.title("Batalla Naval")
		game.width(32)
	  	game.height(18)
	  	game.cellSize(40)
		game.boardGround("fondoNavalDefinitivo.png")
		
		partida.metodosPartida()
	}
	
	
}

object partida{
	var property aliado = new Aliado()
	var property enemigo = new Enemigo()
	
	method metodosPartida(){
		posicionamiento.posicionarBarcos(aliado)
		posicionamiento.posicionarBarcos(enemigo)
		game.addVisualCharacter(mouse)
		self.setearUbicacionesIniciales(aliado)
		self.ubicarBarcos()		
		keyboard.s().onPressDo({self.chequearBarcosPosicionados()})
	}	
	
	method setearUbicacionesIniciales(jugador){
		jugador.barcos().forEach({a => a.moverBarcoA(a.position())})
	}

	method ubicarBarcos(){
		var barcoAUbicar
		
		keyboard.space().onPressDo({barcoAUbicar = self.obtenerBarco(mouse.position())})
		keyboard.enter().onPressDo({barcoAUbicar.moverBarcoA(mouse.position())}) 
		keyboard.r().onPressDo({barcoAUbicar.rotar()})
	}
	
	method chequearBarcosPosicionados(){
		
		if(posicionamiento.barcosListos(aliado)){ 
			game.say(mouse, "Desea finalizar el posicionamiento? Y/N")
			keyboard.y().onPressDo({self.comenzarJuego() })
			
		}else{
			game.say(mouse, "Primero debe posicionar todos los barcos")	
		}
	}
	
	method obtenerBarco(pos) = aliado.barcos().find({a => a.posiciones().contains(pos)})		

	method comenzarJuego(){
		keyboard.x().onPressDo({self.realizarDisparo(mouse.position())})
	}
	
	method realizarDisparo(pos){
		if(self.esPosicionValida(pos)){
			if(self.yaSeDisparo(pos)){
				game.say(mouse,"Ya has disparado en esa coordenada")
			}else{
				disparo.disparoJugador(pos) 
			}
		}else{
			game.say(mouse,"Posicion no valida para disparar")
		}
	}
	
	method esPosicionValida(pos) = pos.x() >= 18 and pos.x() <= 27 and pos.y() >= 4 and pos.y() <= 13
	
	method yaSeDisparo(pos){
		return misilAgua.misiles().contains(pos) or misilFuego.misiles().contains(pos)
	}
	
}


object posicionamiento{
	
	method barcosListos(jugador) = jugador.barcos().all({a => self.posicionValida(a.position())})

	method posicionValida(pos) = pos.x() >= 4 and pos.x() <= 13 and pos.y() >= 4 and pos.y() <= 13
	
	method posicionarBarcos(jugador){
		jugador.barcos().forEach({a => game.addVisual(a)}) 
	}
}

