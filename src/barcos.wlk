import wollok.game.*

class Barco{
	var property position
	const tipo
	
	method reducirVida(){
		tipo.reducirVida()
	} 
	
	method x() = position.x()
	
	method y() = position.y()
	
	method posiciones() = tipo.posiciones(self.x(), self.y())
		
	method hundido() = tipo.hundido()
	
	method vida() = tipo.vida()
}

class BarcoAliado inherits Barco{	
			
	method image() = tipo.imagenSeleccionada()
		
	method rotar(){
		tipo.rotar()
	}	
}


class BarcoEnemigo inherits Barco{	
	
}



class Tipo{
	const property nombre
	const tamanio
	var vida
	var orientacion = horizontal //aprovecha el polimorfismo
	
	method vida() = vida
	
	method reducirVida(){
		vida = vida - 1
	}
	
	method imagenSeleccionada() = orientacion.imagen(nombre)
	
	method rotar(){
		orientacion = orientacion.rotar()
	}
	
	method posiciones(x, y) = self.completarPosiciones(x, y)
	
	method completarPosiciones(x, y){
		const posiciones = []
		tamanio.times({i => posiciones.add(orientacion.agregarPosicion(x,y,i-1))})
		return posiciones
	}
	
	method hundido() = vida == 0
}

//objeto polimorfico
object vertical{
	method imagen(nombre){
		return nombre + "_v.png"	
	}
	
	method rotar() = horizontal
	
	
	method agregarPosicion(x,y,i) = game.at(x,y+i)
	
}
//objeto polimorfico
object horizontal{
	method imagen(nombre){
		return nombre + "_h.png"	
	}
	
	method rotar() = vertical
	
	method agregarPosicion(x,y,i) = game.at(x+i,y)
}
