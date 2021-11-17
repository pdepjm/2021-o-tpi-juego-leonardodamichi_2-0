import wollok.game.*
import barcos.*
import impacto.*
import nivel.*
import AI.*
import mouse.*
import jugadores.*
import soundProducer.*
import partida.*

const secuenciaAgua = ["agua2.png","agua3.png","agua4.png","agua5.png","agua6.png","agua7.png","agua8.png","agua9.png","agua10.png","agua11.png","agua12.png","agua13.png","agua14.png","agua15.png","agua16.png"]
const secuenciaFuego = ["fuego2.png","fuego3.png","fuego4.png","fuego5.png"]

object disparo {
		const misilesDisparados = []
		
		method disparoJugador(pos){
			
			if(nivel.partida().hayBarco(nivel.enemigo(),pos)){
				
				fuego.crearVisual(pos)
				self.realizarImpacto(nivel.partida().obtenerBarco(nivel.enemigo(),pos))	
			}else{
				agua.crearVisual(pos)
				game.schedule(800,{self.disparoIA(self.posRandomIA())})
			}
			misilesDisparados.add(pos)
			
			if(nivel.enemigo().barcosHundidos()){
				game.say(mouse,"VICTORIA")
			}else{
				self.redrawMouse()
			}	
		}
		
		method disparoIA(pos){
			
			if(nivel.partida().hayBarco(nivel.aliado(),pos)){
				
				game.schedule(500,{fuego.crearVisual(pos)})
				self.realizarImpacto(nivel.partida().obtenerBarco(nivel.aliado(),pos))
				
				if(nivel.aliado().barcosHundidos()){
					game.say(mouse,"DERROTA")
				
				}else{
					game.schedule(800,{self.disparoIA(self.posRandomIA())})	
				}
				
			}else{
				game.schedule(500,{agua.crearVisual(pos)})
			}
			
		}
		
		method posRandomIA(){
			const num = ai.aux()
			return game.at(ai.soloLaParteEntera(num),ai.soloLaParteDecimal(num))
		}
		
		method realizarImpacto(barco){
			barco.reducirVida()
		}
		
		method redrawMouse(){
			game.removeVisual(mouse)
			game.addVisual(mouse)
		}

		method yaSeDisparo(pos) = misilesDisparados.contains(pos)
		

}

object fuego{
	method crearVisual(pos){
		var i = 0
		const misilFuego = new Impacto(position = pos, image = "fuego1.png")
		game.addVisual(misilFuego)
		game.onTick(80,"fuego",{misilFuego.image(secuenciaFuego.get(i)) i=i+1 if(i == 3){game.removeTickEvent("fuego")}})
		soundProducer.sound("impactoBarco.mp3").play()
	}		
}

object agua{
	method crearVisual(pos){
		var i = 0
		const misilAgua = new Impacto(position = pos, image = "agua1.png")
		game.addVisual(misilAgua)
		game.onTick(80,"agua",{misilAgua.image(secuenciaAgua.get(i)) i=i+1 if(i == 14){game.removeTickEvent("agua")}})
		soundProducer.sound("impactoAgua.mp3").play()
	}
}