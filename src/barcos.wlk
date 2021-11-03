import wollok.game.*

class Barco{
	var property position = game.at(0,0)
	const tipoBarco = submarino
	var image = tipoBarco.image()
	var posiciones = tipoBarco.posiciones(self.position())
	
	method image() = image
		
	method rotar(){
		tipoBarco.rotar()
		image = tipoBarco.image()
		posiciones = tipoBarco.posiciones(self.position())
	}
		
	method posiciones() = posiciones
	
	method actualizarPosiciones(pos){
		posiciones = tipoBarco.posiciones(pos)
	}
	
}
/*class Barco1{
	var imagenHorizontal
	var imagenVertical
	var sentidoHorizontal = true
	var tamanio
	var posiciones
	var imagenAMostrar
	
	method rotar(){
		if(sentidoHorizontal)
		{
			imagenAMostrar = imagenVertical
			sentidoHorizontal = false
		} 
		else
		{
			imagenAMostrar = imagenHorizontal
			sentidoHorizontal = true
		}
	}
	method eliminarPosicion(ubicacion) {
		posiciones.remove(ubicacion)
	}
	method barcoUndido() = posiciones.size() == 0
}*/



object submarino {
	var imagen = "submarino_h.png"
	
	method image() = imagen
	
	method estaHorizontal(){
		return imagen.contains("h")
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagen = "submarino_v.png"
		}else{
			imagen = "submarino_h.png"
		}
	}
	
	method posiciones(posActual){
		const posiciones = []
		
		if(self.estaHorizontal()){
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x()+1,posActual.y()))
		
		}else{
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x(),posActual.y()+1))
		}
		
		return posiciones
		
	}
	
	method imagenBarcoEnemigo(bool){
		if(bool){
			return "submarino_h.png"
		}else{
			return "submarino_v.png"
		}
	}
	
	
}

object corbeta {
	var imagen = "corbeta_h.png"
	
	method image() = imagen
	
	method estaHorizontal(){
		return imagen.contains("h")
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagen = "corbeta_v.png"
		}else{
			imagen = "corbeta_h.png"
		}
	}
	
	method posiciones(posActual){
		const posiciones = []
		if(self.estaHorizontal()){
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x()+1,posActual.y()))
			posiciones.add(game.at(posActual.x()+2,posActual.y()))
		
		}else{
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x(),posActual.y()+1))
			posiciones.add(game.at(posActual.x(),posActual.y()+2))
		}
		return posiciones
	}
	
	
	method imagenBarcoEnemigo(bool){
		if(bool){
			return "corbeta_h.png"
		}else{
			return "corbeta_v.png"
		}
	}
	
}

object fragata {
	var imagen = "fragata_h.png"
	
	method image() = imagen
	
	method estaHorizontal(){
		return imagen.contains("h")
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagen = "fragata_v.png"
		}else{
			imagen = "fragata_h.png"
		}
	}
	
	method posiciones(posActual){
		const posiciones = []
		if(self.estaHorizontal()){
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x()+1,posActual.y()))
			posiciones.add(game.at(posActual.x()+2,posActual.y()))
			posiciones.add(game.at(posActual.x()+3,posActual.y()))
		
		}else{
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x(),posActual.y()+1))
			posiciones.add(game.at(posActual.x(),posActual.y()+2))
			posiciones.add(game.at(posActual.x(),posActual.y()+3))
		}
		return posiciones
	}
	
	method imagenBarcoEnemigo(bool){
		if(bool){
			return "fragata_h.png"
		}else{
			return "fragata_v.png"
		}
	}
}

object porta {
	var imagen = "porta_h.png"
	
	method image() = imagen
	
	method estaHorizontal(){
		return imagen.contains("h")
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagen = "porta_v.png"
		}else{
			imagen = "porta_h.png"
		}
	}
	
	method posiciones(posActual){
		const posiciones = []
		if(self.estaHorizontal()){
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x()+1,posActual.y()))
			posiciones.add(game.at(posActual.x()+2,posActual.y()))
			posiciones.add(game.at(posActual.x()+3,posActual.y()))
			posiciones.add(game.at(posActual.x()+4,posActual.y()))
		
		}else{
			posiciones.add(posActual)
			posiciones.add(game.at(posActual.x(),posActual.y()+1))
			posiciones.add(game.at(posActual.x(),posActual.y()+2))
			posiciones.add(game.at(posActual.x(),posActual.y()+3))
			posiciones.add(game.at(posActual.x(),posActual.y()+4))
		}
		return posiciones
	}
	
	method imagenBarcoEnemigo(bool){
		if(bool){
			return "porta_h.png"
		}else{
			return "porta_v.png"
		}
	}
	
}

class BarcoEnemigo {
	var property position = game.at(0,0)
	const tipoBarco = submarino
	const horizontal = true
	const posiciones = []
	
	method posiciones() = posiciones
	
}

class Destruido inherits BarcoEnemigo{
	method image() = tipoBarco.imagenBarcoEnemigo(horizontal)
}

object distribucion1{
	const s1e = new BarcoEnemigo(position = game.at(19,12), posiciones = [game.at(19,12),game.at(19,13)], horizontal = false)
	const s2e = new BarcoEnemigo(position = game.at(20,8), posiciones = [game.at(20,8),game.at(21,8)])
	const s3e = new BarcoEnemigo(position = game.at(24,11), posiciones = [game.at(24,11),game.at(24,12)], horizontal = false)
	const c1e = new BarcoEnemigo(position = game.at(18,4), posiciones = [game.at(18,4),game.at(18,5),game.at(18,6)], horizontal = false)
	const c2e = new BarcoEnemigo(position = game.at(22,6), posiciones = [game.at(22,6),game.at(23,6),game.at(24,6)])
	const f1e = new BarcoEnemigo(position = game.at(27,8), posiciones = [game.at(27,8),game.at(27,9),game.at(27,10),game.at(27,11)], horizontal = false)
	const p1e = new BarcoEnemigo(position = game.at(22,4), posiciones = [game.at(22,4),game.at(23,4),game.at(24,4),game.at(25,4),game.at(26,4)])
	
	method barcosEnemigos() = [s1e,s2e,s3e,c1e,c2e,f1e,p1e]
	
}


object barcosAliados{
	method barcos() = [s1,s2,s3,c1,c2,f1,p1]
}

const s1 = new Barco(position = game.at(4,3), tipoBarco = submarino)
const s2 = new Barco(position = game.at(6,3), tipoBarco = submarino)
const s3 = new Barco(position = game.at(8,3), tipoBarco = submarino)

const c1 = new Barco(position = game.at(10,3), tipoBarco = corbeta)
const c2 = new Barco(position = game.at(4,2), tipoBarco = corbeta)

const f1 = new Barco(position = game.at(7,2), tipoBarco = fragata)

const p1 = new Barco(position = game.at(4,1), tipoBarco = porta)



