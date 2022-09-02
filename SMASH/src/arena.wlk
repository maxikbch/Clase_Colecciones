import luchadores.*

object arena {
	
	var luchadores = #{}
	
	method agregarLuchador(unLuchador) {
		luchadores.add(unLuchador)
	}
	
	method echarLuchador(unLuchador) {
		luchadores.remove(unLuchador)
	}
	
	method cantidadDeLuchadores() {
		return luchadores.size()
	}
	
	//es amateur cuando la cantidad de integrantes sin poder es mayor a la mitad de sus integrantes
	
	method esAmateur() {
		return self.luchadoresSinMuchoPoder().size() > self.cantidadDeLuchadores() / 2
	}
	
	method luchadoresSinMuchoPoder() {
		return luchadores.filter({ unLuchador => !unLuchador.tieneMuchoPoder() })
	}
	
	method nombresDeLosLuchadores() {
		return luchadores.map({ unLuchador => unLuchador.nombre() })
	}
	
	method entrenarTodosLosLuchadores() {
		luchadores.forEach({ unLuchador => unLuchador.descanzar() })
	}
	
	method combateSimple(){
		luchadores.forEach({unLuchador => self.atacarAlgunRival(unLuchador)})
		return self.luchadorMenosAgotado()
	}
	
	method luchadorMenosAgotado(){
		return luchadores.min({unLuchador => unLuchador.agotamiento()})
	}
	
	method rivales(unLuchador){
		return luchadores.filter({otroLuchador => otroLuchador != unLuchador})
	}
	
	method algunRival(unLuchador){
		return self.rivales(unLuchador).anyOne()
	}
	
	method atacarAlgunRival(unLuchador){
		self.algunRival(unLuchador).recibirAtaque(unLuchador.danioAtaqueSimple())
	}
}
