import wollok.game.*

class UbicacionRandom {
	
	var ubicacionesEnX
	
	method generarUbicacion () = game.at(ubicacionesEnX.anyOne() , ubicacionesEnX.anyOne())
}
class UbicacionRandom2 inherits UbicacionRandom{
	var ubicacionesEnY
	
	override
	method generarUbicacion () = game.at(ubicacionesEnX.anyOne() , ubicacionesEnY.anyOne())
}