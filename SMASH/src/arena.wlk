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
		return self.luchadoresDebiles().size() > self.cantidadDeLuchadores() / 2
	}
	
	method luchadoresDebiles() {
		return luchadores.filter({ unLuchador => !unLuchador.tieneMuchoPoder() })
	}
	
	method nombresDeLosLuchadores() {
		return luchadores.map({ unLuchador => unLuchador.nombre() })
	}
	
	method descansarTodosLosLuchadores() {
		luchadores.forEach({ unLuchador => unLuchador.descansar() })
	}
	
	method combateSimple(){
		luchadores.forEach({unLuchador => self.atacarAlgunRival(unLuchador)})
	}
	
	method luchadorGanador(){
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
