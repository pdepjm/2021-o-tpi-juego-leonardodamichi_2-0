import wollok.game.*

class Barco{
	var property position
	var vida
	var posiciones = []
	var tipoBarco
	
	method posiciones() = posiciones
	
	method vida() = vida
	
	method quitarVida() {
		vida = vida - 1
	}
	
	method barcoHundido() = vida == 0
}

class BarcoAliado inherits Barco{	
	var image = tipoBarco.imagenSeleccionada()
		
	method image() = image
		
	method rotar(){
		tipoBarco.rotar()
		image = tipoBarco.imagenSeleccionada()
		self.moverBarcoA(self.position())
	}
	
	method moverBarcoA(pos){
		self.position(pos)
		posiciones = tipoBarco.posiciones(pos)
	}
	
}


class BarcoEnemigo inherits Barco{	
	
}

class TipoBarco{
	const property nombre
	const orientacion = vertical
	
	method imagenSelecionada(nombre) = orientacion.imagen(nombre)
	
	var tamanio
	
}

object vertical{
	method imagen(nombre){
		return nombre + "_v.png"	
	}
}

object horizontal{
	method imagen(nombre){
		return nombre + "_h.png"	
	}
}

object submarino {
	const imagenHorizontal = "submarino_h.png"
	
	const imagenVertical = "submarino_v.png"
	
	var imagenSeleccionada = imagenHorizontal
		
	method imagenSeleccionada() = imagenSeleccionada
	
	method estaHorizontal(){
		return imagenSeleccionada == imagenHorizontal
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagenSeleccionada = imagenVertical
		}else{
			imagenSeleccionada = imagenHorizontal
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
	
	
}

object corbeta {
	const imagenHorizontal = "corbeta_h.png"
	
	const imagenVertical = "corbeta_v.png"
	
	var imagenSeleccionada = imagenHorizontal
		
	method imagenSeleccionada() = imagenSeleccionada
	
	method estaHorizontal(){
		return imagenSeleccionada == imagenHorizontal
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagenSeleccionada = imagenVertical
		}else{
			imagenSeleccionada = imagenHorizontal
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
	
	
}

object fragata {
	const imagenHorizontal = "fragata_h.png"
	
	const imagenVertical = "fragata_v.png"
	
	var imagenSeleccionada = imagenHorizontal
		
	method imagenSeleccionada() = imagenSeleccionada
	
	method estaHorizontal(){
		return imagenSeleccionada == imagenHorizontal
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagenSeleccionada = imagenVertical
		}else{
			imagenSeleccionada = imagenHorizontal
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
	 	
}

object portaviones {
	const imagenHorizontal = "porta_h.png"
	
	const imagenVertical = "porta_v.png"
	
	var imagenSeleccionada = imagenHorizontal
		
	method imagenSeleccionada() = imagenSeleccionada
	
	method estaHorizontal(){
		return imagenSeleccionada == imagenHorizontal
	}
	
	method rotar(){
		if(self.estaHorizontal()){
			imagenSeleccionada = imagenVertical
		}else{
			imagenSeleccionada = imagenHorizontal
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
	 	
}


/*
-------------------------------------

class Barco{
	var property position = game.at(0,0)
	const tipoBarco = submarino
	var image = tipoBarco.image()
	var posiciones = tipoBarco.posiciones(self.position())
	
	method tipoBarco() = tipoBarco
	
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


*/