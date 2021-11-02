import wollok.game.*
import barcos.*
import impacto.*
import nivel.*
import AI.*
import mouse.*

object disparo {
		const secuenciaAgua = ["agua2.png","agua3.png","agua4.png","agua5.png","agua6.png","agua7.png","agua8.png","agua9.png","agua10.png","agua11.png","agua12.png","agua13.png","agua14.png","agua15.png","agua16.png"]
		const secuenciaFuego = ["fuego2.png","fuego3.png","fuego4.png","fuego5.png"]
		const misilesAgua = []
		const misilesFuego = []
		
		method disparoJugador(){
			if(self.hayBarcoEnemigo()){
				self.fuego(mouse.position())
				if(self.barcosEnemigosDestruidos()){
					self.victoria()
				}
			}else{
				self.agua(mouse.position())
				game.schedule(800,{self.disparoIA(self.posRandomIA())})
			}
			self.redrawMouse()
			
		}
		
		method disparoIA(pos){
			if(self.hayBarcoAliado(pos)){
				game.schedule(500,{self.fuego(pos)})
				if(self.barcosAliadosDestruidos()){
					self.derrota()
				}else{
					game.schedule(800,{self.disparoIA(self.posRandomIA())})	
				}
				
			}else{
				game.schedule(500,{self.agua(pos)})
			}
			
		}
		
		
		method fuego(posicion){
			
			var i = 0
			const misilFuego = new Impacto(position = posicion, image = "fuego1.png")
			game.addVisual(misilFuego)
			game.onTick(80,"fuego",{misilFuego.image(secuenciaFuego.get(i)) i=i+1 if(i == 3){game.removeTickEvent("fuego")}})
			misilesFuego.add(posicion)
			
			self.realizarImpacto(self.barcoImpactado(posicion), posicion)
			
			
		}
		
		method agua(posicion){
			var i = 0
			const misilAgua = new Impacto(position = posicion, image = "agua1.png")
			game.addVisual(misilAgua)
			game.onTick(80,"agua",{misilAgua.image(secuenciaAgua.get(i)) i=i+1 if(i == 14){game.removeTickEvent("agua")}})
			misilesAgua.add(posicion)
			
		}
		
		method misilesAgua() = misilesAgua
		
		method misilesFuego() = misilesFuego

		
		method posRandomIA(){
			const num = ai.aux()
			return game.at(ai.soloLaParteEntera(num),ai.soloLaParteDecimal(num))
		}
		
		method hayBarcoEnemigo(){
			return nivel.barcosEnemigos().any({a=> a.posiciones().contains(mouse.position())})
		}
		
		method hayBarcoAliado(pos){
			return barcosAliados.barcos().any({a=> a.posiciones().contains(pos)})
		}
		
		method barcoImpactado(posicion){
			return nivel.barcosEnemigos().find({a => a.posiciones().contains(posicion)})			
		}
		
		method realizarImpacto(barco, posicion){
			barco.posiciones().remove(posicion)
		}
		
		method redrawMouse(){
			game.removeVisual(mouse)
			game.addVisual(mouse)
		}

		
		method barcosEnemigosDestruidos(){
			return nivel.barcosEnemigos().all({a => a.posiciones().isEmpty()})
		}
		
		method barcosAliadosDestruidos(){
			return barcosAliados.barcos().all({a => a.posiciones().isEmpty()})
		}
		
		method victoria(){
			game.say(mouse,"VICTORIA")
		}
		
		method derrota(){
			game.say(mouse,"DERROTA")			
		}


}












