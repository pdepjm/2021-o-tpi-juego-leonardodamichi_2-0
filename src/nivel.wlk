import wollok.game.*
import barcos.*
import disparo.*
import impacto.*
import mouse.*
import jugadores.*
import partida.*


object nivel {
	const partida = new Partida()
	
	method configuracionInicial(){
		game.title("Batalla Naval")
		game.width(32)
	  	game.height(18)
	  	game.cellSize(40)
		game.boardGround("fondoNavalDefinitivo.png")
		partida.ubicarBarcos()
		game.addVisualCharacter(mouse)
		partida.posicionarBarcos()
		
	}
	
	method chequearBarcosPosicionados(){
		if(self.aliado().posicionesValidas()){ 
			partida.comenzar()			
		}else{
			game.say(mouse, "Primero debe posicionar todos los barcos")	
		}
	}
	
	method partida() = partida
	
	method aliado() = partida.aliado()
	
	method enemigo() = partida.enemigo()
	
	
}
