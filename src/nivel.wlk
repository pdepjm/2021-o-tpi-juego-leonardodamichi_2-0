import wollok.game.*
import barcos.*

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
		
		self.seleccionarColumna()
		
	}
	
	method seleccionarColumna(){
		
		//keyboard.r().onPressDo({ barcos.get(indice).rotar() } )
		
		 
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
		
		keyboard.num0().onPressDo({})
		keyboard.num1().onPressDo({})
		keyboard.num2().onPressDo({})
		keyboard.num3().onPressDo({})
		keyboard.num4().onPressDo({})
		keyboard.num5().onPressDo({})
		keyboard.num6().onPressDo({})
		keyboard.num7().onPressDo({})
		keyboard.num8().onPressDo({})
		keyboard.num9().onPressDo({})
	}
	
}