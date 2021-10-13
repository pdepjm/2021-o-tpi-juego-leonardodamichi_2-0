import wollok.game.*

class Barco{
	var property position = game.at(0,0)
	var imagen = ""
	const posiciones = []

	method image() = imagen
	
	method setImage(nuevaImagen){
		imagen = nuevaImagen
	}
	
	method moverPara(direccion) {
		position = direccion.proximaPosicion(position) 
	}
	
	method rotar(){
		if (self.image().contains("h")){
			self.setImage(self.image().take(self.image().size()-5) + "v.png")
		}else{
			self.setImage(self.image().take(self.image().size()-5) + "h.png")
		}
	}
	
	method posiciones(){
		posiciones.add(self.position())
		if (self.image().contains("h")){
			posiciones.add(game.at(self.position().x()+1,self.position().y()))
			
			if(self.image().contains("corbeta")){
				posiciones.add(game.at(self.position().x()+2,self.position().y()))
			}
			
			if(self.image().contains("fragata")){
				posiciones.add(game.at(self.position().x()+2,self.position().y()))
				posiciones.add(game.at(self.position().x()+3,self.position().y()))
			}
			
			if(self.image().contains("porta")){
				posiciones.add(game.at(self.position().x()+2,self.position().y()))
				posiciones.add(game.at(self.position().x()+3,self.position().y()))
				posiciones.add(game.at(self.position().x()+4,self.position().y()))
			}
		
		}else{
			posiciones.add(game.at(self.position().x(),self.position().y()+1))
			
			if(self.image().contains("corbeta")){
				posiciones.add(game.at(self.position().x(),self.position().y()+2))
			}
			
			if(self.image().contains("fragata")){
				posiciones.add(game.at(self.position().x(),self.position().y()+2))
				posiciones.add(game.at(self.position().x(),self.position().y()+3))
			}
			
			if(self.image().contains("porta")){
				posiciones.add(game.at(self.position().x(),self.position().y()+2))
				posiciones.add(game.at(self.position().x(),self.position().y()+3))
				posiciones.add(game.at(self.position().x(),self.position().y()+4))
			}
		}
		return posiciones
			
	}
	
}

const s1 = new Barco(position = game.at(4,3), imagen = "submarino_h.png")
const s2 = new Barco(position = game.at(6,3), imagen = "submarino_h.png")
const s3 = new Barco(position = game.at(8,3), imagen = "submarino_h.png")

const c1 = new Barco(position = game.at(10,3), imagen = "corbeta_h.png")
const c2 = new Barco(position = game.at(4,2), imagen = "corbeta_h.png")

const f1 = new Barco(position = game.at(7,2), imagen = "fragata_h.png")

const p1 = new Barco(position = game.at(4,1), imagen = "porta_h.png")