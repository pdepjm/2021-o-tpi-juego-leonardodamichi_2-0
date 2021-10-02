import wollok.game.*

class Barco{
	var property position = game.at(0,0)
	var imagen = ""
	var vida = 0

	method image() = imagen
	
	method setImage(nuevaImagen){
		imagen = nuevaImagen
	}
	
	method reducirVida(){
		vida--
	}
	
	method vida() = vida

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
}

const s1 = new Barco(position = game.at(4,3), imagen = "submarino_h.png", vida = 2)
const s2 = new Barco(position = game.at(6,3), imagen = "submarino_h.png", vida = 2)
const s3 = new Barco(position = game.at(8,3), imagen = "submarino_h.png", vida = 2)

const c1 = new Barco(position = game.at(10,3), imagen = "corbeta_h.png", vida = 3)
const c2 = new Barco(position = game.at(4,2), imagen = "corbeta_h.png", vida = 3)

const f1 = new Barco(position = game.at(7,2), imagen = "fragata_h.png", vida = 4)

const p1 = new Barco(position = game.at(4,1), imagen = "porta_h.png", vida = 5)