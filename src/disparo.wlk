import wollok.game.*
import barcos.*
import impacto.*
import nivel.*
import AI.*
import mouse.*

object disparo {
		const secuenciaAgua = ["agua2.png","agua3.png","agua4.png","agua5.png","agua6.png","agua7.png","agua8.png","agua9.png","agua10.png","agua11.png","agua12.png","agua13.png","agua14.png","agua15.png","agua16.png"]
		const secuenciaFuego = ["fuego2.png","fuego3.png","fuego4.png","fuego5.png"]
		var misilAgua = new Impacto(image = "")
		var misilFuego = new Impacto(image = "")
		
		method disparoJugador(){
			if(self.hayBarco()){
				self.fuego(mouse.position())
			}else{
				self.agua(mouse.position())
				game.schedule(800,{self.disparoIA()})
			}
			
		}
		
		method disparoIA(){
			
			if(game.getObjectsIn(self.posRandomIA()).size() == 2){
				game.schedule(500,{self.fuego(self.posRandomIA())})
				self.disparoIA()
			}else{
				game.schedule(500,{self.agua(self.posRandomIA())})
			}
			
		}
		
		
		method fuego(posicion){
			
			var i = 0
			misilFuego = new Impacto(position = posicion, image = "fuego1.png")
			game.addVisual(misilFuego)
			game.onTick(80,"fuego",{misilFuego.image(secuenciaFuego.get(i)) i=i+1 if(i == 3){game.removeTickEvent("fuego")}})
			
		}
		
		method agua(posicion){
			var i = 0
			misilAgua = new Impacto(position = posicion, image = "agua1.png")
			game.addVisual(misilAgua)
			game.onTick(80,"agua",{misilAgua.image(secuenciaAgua.get(i)) i=i+1 if(i == 14){game.removeTickEvent("agua")}})
			
		}
		
		method misilAgua() = misilAgua
		
		method misilFuego() = misilFuego

		
		method posRandomIA(){
			const num = ai.aux()
			return game.at(ai.soloLaParteEntera(num),ai.soloLaParteDecimal(num))
		}
		
		method hayBarco(){
			return nivel.barcosEnemigos().any({a=> game.getObjectsIn(mouse.position()).contains(a)})
		}

}