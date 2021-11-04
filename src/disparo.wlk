import wollok.game.*
import barcos.*
import impacto.*
import nivel.*
import AI.*
import mouse.*
import jugadores.*
import soundProducer.*

const secuenciaAgua = ["agua2.png","agua3.png","agua4.png","agua5.png","agua6.png","agua7.png","agua8.png","agua9.png","agua10.png","agua11.png","agua12.png","agua13.png","agua14.png","agua15.png","agua16.png"]
const secuenciaFuego = ["fuego2.png","fuego3.png","fuego4.png","fuego5.png"]

object disparo {
			
		
		method disparoJugador(pos){
			
			if(self.hayBarco(partida.enemigo(), pos)){
				
				self.fuego(pos)
				misilFuego.posicionYaDisparada(pos)
				self.realizarImpacto(self.barcoAfectado(partida.enemigo(), pos))
				
				if(partida.enemigo().barcosHundidos()){
					game.say(mouse,"VICTORIA")
				}
				
			}else{
				self.agua(pos)
				misilAgua.posicionYaDisparada(pos)
				game.schedule(800,{self.disparoIA(self.posRandomIA())})
			}
			self.redrawMouse()
			
		}
		
		method disparoIA(pos){
			
			if(self.hayBarco(partida.aliado(), pos)){
				
				game.schedule(500,{self.fuego(pos)})
				self.realizarImpacto(self.barcoAfectado(partida.aliado(), pos))
				
				if(partida.aliado().barcosHundidos()){
					game.say(mouse,"DERROTA")
				
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
			//game.sound().play()
			//soundProducer.sound("impactoBarco.mp3").play()
		}
		
		method agua(posicion){
			var i = 0
			const misilAgua = new Impacto(position = posicion, image = "agua1.png")
			game.addVisual(misilAgua)
			game.onTick(80,"agua",{misilAgua.image(secuenciaAgua.get(i)) i=i+1 if(i == 14){game.removeTickEvent("agua")}})
			//game.sound("impactoAgua.mp3").play()
			
		}
		
		method posRandomIA(){
			const num = ai.aux()
			return game.at(ai.soloLaParteEntera(num),ai.soloLaParteDecimal(num))
		}
		
		method hayBarco(jugador, pos){
			return jugador.barcos().any({a=> a.posiciones().contains(pos)})
		}
		
		method realizarImpacto(barco){
			barco.quitarVida()
		}
		
		method redrawMouse(){
			game.removeVisual(mouse)
			game.addVisual(mouse)
		}

		method barcoAfectado(jugador, pos){
			return jugador.barcos().find({a => a.posiciones().contains(pos)})
		}
		

}

object misilAgua{
	const misilesAgua = []
	
	method posicionYaDisparada(pos){
		misilesAgua.add(pos)
	}
	
	method misiles() = misilesAgua
			
}

object misilFuego{
	const misilesFuego = []
	
	method posicionYaDisparada(pos){
		misilesFuego.add(pos)
	}
	
	method misiles() = misilesFuego
	
}