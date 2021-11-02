import wollok.game.*
import barcos.*
import disparo.*
import impacto.*
import direcciones.*
import mouse.*

object nivel {
	
	const distribucion = [distribucion1].anyOne()
	
	method configuracionInicial(){
		game.title("Batalla Naval")
		game.width(32)
	  	game.height(18)
	  	game.cellSize(40)
		game.boardGround("fondoNavalDefinitivo.png")
		
		game.addVisual(s1)
		game.addVisual(s2)
		game.addVisual(s3)
		game.addVisual(c1)
		game.addVisual(c2)
		game.addVisual(f1)
		game.addVisual(p1)
		
		
		
		game.addVisualCharacter(mouse)
		self.metodos()
	}
	
	method metodos(){
		self.ubicarBarcos([s1,s2,s3,c1,c2,f1,p1])
		self.distribuirBarcosEnemigos()
		self.dispararAEnemigo()
	}	
	
	method distribuirBarcosEnemigos(){
		
		distribucion.barcosEnemigos().forEach({a => game.addVisual(a)})
	}
	
	method barcosEnemigos() = distribucion.barcosEnemigos()

	method ubicarBarcos(barcos){
		var barcoAUbicar = new Barco()
		
		keyboard.space().onPressDo({barcoAUbicar = self.obtenerBarco(barcos)})
		keyboard.enter().onPressDo({barcoAUbicar.position(mouse.position()) barcoAUbicar.actualizarPosiciones(mouse.position())})
		keyboard.r().onPressDo({ barcoAUbicar.rotar() barcoAUbicar.actualizarPosiciones(mouse.position())} )
	}
	
	method obtenerBarco(barcos){
		return barcos.find({b => b.posiciones().contains(mouse.position())})
		
	}

	method dispararAEnemigo(){
		keyboard.x().onPressDo({self.esPosicionValida()})
	}
	
	method esPosicionValida(){
		if(mouse.position().x() >= 18 and mouse.position().x() <= 27 and mouse.position().y() >= 4 and mouse.position().y() <= 13){
			if(self.yaSeDisparo()){
				game.say(mouse,"Ya has disparado en esa coordenada")
			}else{
				disparo.disparoJugador() 
			}
		}else{
			game.say(mouse,"Posicion no valida para disparar")
		}
	}
	
	method yaSeDisparo(){
		return disparo.misilesAgua().contains(mouse.position()) or disparo.misilesFuego().contains(mouse.position())
	}
}