import wollok.game.*

class Impacto {
	var position = game.at(0,0)
	var image = "agua.png"
	
	method position(){
		return position
	}
	
	method position(newPosition){
		position = newPosition
	}
	
	method image(){
		return image
	}
	
	method image(newImage){
		image = newImage
	}
		
}




