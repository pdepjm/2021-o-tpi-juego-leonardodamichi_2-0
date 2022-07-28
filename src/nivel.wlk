import wollok.game.*
import barcos.*
import disparo.*
import impacto.*
import mouse.*
import jugadores.*
import partida.*
import soundProducer.*

object inicio{
	const property position = game.at(0,0)
	const property image = "inicioPosta.jpg"
}

object controles{
	const property position = game.at(5,1)
	const property image = "controles.png"
}

object menu{
	
	method inicio(){
		game.title("Batalla Naval")
		game.width(32)
	  	game.height(18)
	  	game.cellSize(40)
	  	game.boardGround("fondoNavalDefinitivo.png")
		game.addVisual(inicio)
		
		self.sonido()
		var j = true
		keyboard.c().onPressDo({
			if(j){
				game.addVisual(controles)
				j = false
			}else{
				game.removeVisual(controles)
				j = true
			}
		})
		var i = true
		keyboard.m().onPressDo({
			if(i){
				sonido.pause()
				i = false
			}else{
				sonido.resume()
				i = true
			}
		})
		
		keyboard.p().onPressDo({game.removeVisual(inicio) nivel.configuracionNivel()})
	}
	
	method sonido(){
		sonido.loop()
		sonido.volume()
		game.schedule(1000, { sonido.play()} )
	}
}

object nivel {
	const partida = new Partida()
	
	method configuracionNivel(){
		partida.ubicarBarcos()
		game.addVisualCharacter(mouse)
		partida.posicionarBarcos()
	}
	
	method chequearBarcosPosicionados(){
		if(self.aliado().posicionesValidas()){ 
			game.say(mouse, "Ya puede disparar")
			partida.comenzar()			
		}else{
			game.say(mouse, "Primero debe posicionar todos los barcos")	
		}
	}
	
	method partida() = partida
	
	method aliado() = partida.aliado()
	
	method enemigo() = partida.enemigo()
	
	
}

object sonido{
	
	const melodia = game.sound("melodia.mp3")
	
	method loop(){melodia.shouldLoop(true)}
	
	method volume(){melodia.volume(0.1)}
	
	method play(){melodia.play()}
	
	method pause(){melodia.pause()}
	
	method resume(){melodia.resume()}
		
	
}
