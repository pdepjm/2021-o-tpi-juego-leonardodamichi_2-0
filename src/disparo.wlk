import wollok.game.*
import impacto.*
import nivel.*
import AI.*
import mouse.*

object disparo {
		
		method disparar(){
			game.addVisual(new Impacto(position = mouse.position()))
			const num = ai.aux()
			game.onTick(500,"disparo IA",{game.addVisual(new Impacto(position = game.at(ai.soloLaParteEntera(num),ai.soloLaParteDecimal(num))))})
		}
		
}