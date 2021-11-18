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
			
			if(self.hayBarco(nivel.enemigo(),pos)){
				const barco = nivel.partida().obtenerBarco(nivel.enemigo(),pos)
				fuego.crearVisual(pos)
				self.realizarImpacto(barco)	
				if(barco.hundido()){
					game.addVisual(self.barcoDestruido(barco))
				}
			}else{
				agua.crearVisual(pos)
				game.schedule(800,{self.disparoIA(self.posRandomIA())})
			}
			misilesDisparados.add(pos)
			
			if(nivel.enemigo().barcosHundidos()){
				
				game.schedule(500,{game.clear() game.addVisual(victoria)})
			}else{
				self.redrawMouse()
			}	
		}
		
		method disparoIA(pos){
			
			if(self.hayBarco(nivel.aliado(),pos)){
				
				const barco = nivel.partida().obtenerBarco(nivel.aliado(),pos)
				
				game.schedule(500,{fuego.crearVisual(pos)})
				
				self.realizarImpacto(barco)
				
				game.schedule(500,{
					if(barco.hundido()){
						barco.nombre(barco.nombre()+"1")
						game.removeVisual(barco)
						game.addVisual(barco)
					}
				})		
				
								
				if(nivel.aliado().barcosHundidos()){
					
					game.schedule(500,{game.clear() game.addVisual(derrota)})
				
				}else{
					
					game.schedule(800,{self.disparoIA(self.posRandomIA())})	
				}
				
				
				
			}else{
				game.schedule(500,{agua.crearVisual(pos)})
			}
			
		}
		
		method hayBarco(jugador,pos) = nivel.partida().hayBarco(jugador,pos)
		
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
		
		method barcoDestruido(barco){
			const nuevoNombre = barco.nombre() + "1"
			return new BarcoDestruido(position = barco.position(), tipo = new Tipo(nombre = nuevoNombre, tamanio = barco.tamanio(), vida = barco.vida(), orientacion = barco.orientacion()))	
		} 
}




object victoria{
	const property position = game.at(0,0)
	const property image = "victoria.png"
}


object derrota{
	const property position = game.at(0,0)
	const property image = "derrota.png"
}


object fuego{
	method crearVisual(pos){
		var i = 0
		const misilFuego = new Impacto(position = pos, image = "fuego1.png")
		game.addVisual(misilFuego)
		game.sound("impactoBarco.mp3").volume(0.4)
		game.sound("impactoBarco.mp3").play()
		game.schedule(1000,{})
		game.onTick(80,"fuego",{misilFuego.image(secuenciaFuego.get(i)) i=i+1 if(i == 4){game.removeTickEvent("fuego")}})
	}		
}

object agua{
	method crearVisual(pos){
		var i = 0
		const misilAgua = new Impacto(position = pos, image = "agua1.png")
		game.addVisual(misilAgua)
		game.sound("impactoAgua.mp3").volume(0.4)
		game.sound("impactoAgua.mp3").play()
		game.onTick(80,"agua",{misilAgua.image(secuenciaAgua.get(i)) i=i+1 if(i == 14){game.removeTickEvent("agua")}})
	}
}