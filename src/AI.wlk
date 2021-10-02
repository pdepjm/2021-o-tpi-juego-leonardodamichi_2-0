import wollok.game.*
import disparo.*

object ai {
	
	const posiciones = [4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 4.10, 4.11, 4.12, 4.13,
		
						 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 5.10, 5.11, 5.12, 5.13,
						 
						 6.4, 6.5, 6.6, 6.7, 6.8, 6.9, 6.10, 6.11, 6.12, 6.13,
						 
						 7.4, 7.5, 7.6, 7.7, 7.8, 7.9, 7.10, 7.11, 7.12, 7.13,
						 
						 8.4, 8.5, 8.6, 8.7, 8.8, 8.9, 8.10, 8.11, 8.12, 8.13,
						 
						 9.4, 9.5, 9.6, 9.7, 9.8, 9.9, 9.10, 9.11, 9.12, 9.13,
						 
						 10.4, 10.5, 10.6, 10.7, 10.8, 10.9, 10.10, 10.11, 10.12, 10.13,
						 
						 11.4, 11.5, 11.6, 11.7, 11.8, 4119, 11.10, 11.11, 11.12, 11.13,
						 
						 12.4, 12.5, 12.6, 12.7, 12.8, 12.9, 12.10, 12.11, 12.12, 12.13,
						 
						 13.4, 13.5, 13.6, 13.7, 13.8, 13.9, 13.10, 13.11, 13.12, 13.13]
						 

						 	
	method realizarDisparo(numero1,numero2){
		//game.addVisual()
	}
		
	method aux(){
		return posiciones.anyOne()
	}	
		
	method posiciones(){
		return posiciones
	}	
	
	
	method soloLaParteEntera(numero){
	 	return numero.truncate(0)
	}
	
	method soloLaParteDecimal(numero){
		var restado = numero - numero.truncate(0)
		
		if (restado == 0.1 or restado == 0.2 or restado == 0.3 or restado == 0.4 or restado == 0.5
			or restado == 0.6 or restado == 0.7 or restado == 0.8 or restado == 0.9){
			return numero -numero.truncate(0) * 10
		}
		return (numero - numero.truncate(0)) *100
	}
}