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
		self.seleccionarColumna()
	}	

	method ubicarBarcos(){
		var barcoAUbicar = []
		keyboard.space().onPressDo({barcoAUbicar = game.getObjectsIn(mouse.position())})
		keyboard.enter().onPressDo({barcoAUbicar.head().position(mouse.position())})
		keyboard.r().onPressDo({ barcoAUbicar.head().rotar() } )
	}

	method seleccionarColumna(){
				 
		keyboard.a().onPressDo({self.seleccionarFila(18)})
		keyboard.b().onPressDo({self.seleccionarFila(19)})
		keyboard.c().onPressDo({self.seleccionarFila(20)})
		keyboard.d().onPressDo({self.seleccionarFila(21)})
		keyboard.e().onPressDo({self.seleccionarFila(22)})
		keyboard.f().onPressDo({self.seleccionarFila(23)})
		keyboard.g().onPressDo({self.seleccionarFila(24)})
		keyboard.h().onPressDo({self.seleccionarFila(25)})
		keyboard.i().onPressDo({self.seleccionarFila(26)})
		keyboard.j().onPressDo({self.seleccionarFila(27)})
		 	
	}
	
	method seleccionarFila(columna){
		
		keyboard.num0().onPressDo({misil.disparar(columna,13)})
		keyboard.num1().onPressDo({misil.disparar(columna,12)})
		keyboard.num2().onPressDo({misil.disparar(columna,11)})
		keyboard.num3().onPressDo({misil.disparar(columna,10)})
		keyboard.num4().onPressDo({misil.disparar(columna,9)})
		keyboard.num5().onPressDo({misil.disparar(columna,8)})
		keyboard.num6().onPressDo({misil.disparar(columna,7)})
		keyboard.num7().onPressDo({misil.disparar(columna,6)})
		keyboard.num8().onPressDo({misil.disparar(columna,5)})
		keyboard.num9().onPressDo({misil.disparar(columna,4)})
	}
	
}