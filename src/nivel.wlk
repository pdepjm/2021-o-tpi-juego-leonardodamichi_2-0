import wollok.game.*
import barcos.*
import disparo.*
import impacto.*
import direcciones.*
import mouse.*

object nivel {
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
		self.ubicarBarcos()
		self.dispararAEnemigo()
	}	

	method ubicarBarcos(){
		var barcoAUbicar = new Barco()
		
		keyboard.space().onPressDo({barcoAUbicar = self.hayBarco()})
		keyboard.enter().onPressDo({barcoAUbicar.position(mouse.position())})
		keyboard.r().onPressDo({ barcoAUbicar.rotar() } )
	}
	
	method hayBarco(){
		if(s1.posiciones().contains(mouse.position())){
			return s1
		}
		if(s2.posiciones().contains(mouse.position())){
			return s2
		}
		if(s3.posiciones().contains(mouse.position())){
			return s3
		}
		if(c1.posiciones().contains(mouse.position())){
			return c1
		}
		if(c2.posiciones().contains(mouse.position())){
			return c2
		}
		if(f1.posiciones().contains(mouse.position())){
			return f1
		}
		if(p1.posiciones().contains(mouse.position())){
			return p1
		}
		return null
	}

	method dispararAEnemigo(){
		keyboard.x().onPressDo({self.esPosicionValida()})
	}
	
	method esPosicionValida(){
		if(mouse.position().x() >= 18 and mouse.position().x() <= 27 and mouse.position().y() >= 4 and mouse.position().y() <= 13){
			disparo.disparar() 
		}else if(game.getObjectsIn(mouse.position()).size() != 0){
			game.say(mouse,"Ya has disparado en esa coordenada")
		}else{
			game.say(mouse,"Posicion no valida para disparar")
		}
	}
}