import wollok.game.*
import impacto.*
import nivel.*
import AI.*

object misil {
		
		method disparar(x,y){
			
			game.addVisual(new Impacto(position = game.at(x,y), image = "agua.png"))
			
		}
		
		method dispararIA(){
			
			ai.realizarDisparo(ai.soloLaParteEntera(ai.aux()), ai.soloLaParteDecimal(ai.aux()))
		}
	
}