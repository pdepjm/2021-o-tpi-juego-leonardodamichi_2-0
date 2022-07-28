import jugadores.*
import wollok.game.*
import mouse.*
import nivel.*
import disparo.*
import barcos.*

class Partida{
	const aliado = new Aliado()
	const enemigo = new Enemigo()
	
	method aliado() = aliado
	method enemigo() = enemigo
	
	method ubicarBarcos(){
		aliado.ubicarBarcos()
		enemigo.ubicarBarcos()
	}
	
	method posicionarBarcos(){
		var barcoAUbicar
		
		keyboard.space().onPressDo({
			if(self.hayBarco(aliado, mouse.position())){
				barcoAUbicar = self.obtenerBarco(aliado,mouse.position())
				game.say(mouse,"Barco Elegido")
			}else{
				game.say(mouse, "No hay barco en esta posicion")
			}	
				})
		keyboard.enter().onPressDo({barcoAUbicar.position(mouse.position())}) 
		keyboard.r().onPressDo({barcoAUbicar.rotar()})
		keyboard.s().onPressDo({nivel.chequearBarcosPosicionados()})
	}
	
	method hayBarco(jugador, pos) = jugador.hayBarco(pos)
	
	method obtenerBarco(jugador, pos) = jugador.obtenerBarco(pos)
	
	method comenzar(){
		keyboard.x().onPressDo({self.realizarDisparo(mouse.position())})
	}
	
	method realizarDisparo(pos){
		if(self.esPosicionValida(pos)){
			if(disparo.yaSeDisparo(pos)){
				game.say(mouse,"Ya has disparado en esa coordenada")
			}else{
				disparo.disparoJugador(pos) 
			}
		}else{
			game.say(mouse,"Posicion no valida para disparar")
		}
	}
	
	method esPosicionValida(pos) = pos.x() >= 18 and pos.x() <= 27 and pos.y() >= 4 and pos.y() <= 13
	
	
	
}