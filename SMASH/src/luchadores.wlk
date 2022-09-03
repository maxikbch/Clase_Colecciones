object mario {
	var nombre = "Mario"
	var agotamiento = 0
	var ataque = "Salto"
	
	method nombre() = nombre
	
	method agotamiento() = agotamiento
	
	method tieneMuchoPoder() = true
	
	method descansar(){
		agotamiento = 0;
	}
	
	method evolucionar() {
		ataque = "Bola de Fuego"
	}
	
	method recibirAtaque(unDanio){
		agotamiento += unDanio
	}
	
	method danioAtaqueSimple(){
		return ataque.size()
	}
	
}

object link {
	var nombre = "Link"
	var agotamiento = 0
	var armas = #{"Espada del Heroe", "Escudo Hyliano", "Arco"}
	
	method nombre() = nombre
	
	method agotamiento() = agotamiento
	
	method armas() = armas
	
	method tieneMuchoPoder() {
		return armas.size() > 3
	}
	
	method descansar(){
		agotamiento = 0;
	}
	
	method evolucionar() {
		self.perderArma("Espada del Heroe")
		self.obtenerArma("Espada Maestra")
		self.obtenerArma("Bombas")
		self.obtenerArma("Gancho")
	}
	
	method obtenerArma(unArma) {
		armas.add(unArma)
	}
	
	method perderArma(unArma) {
		armas.remove(unArma)
	}
	
	method recibirAtaque(unDanio){
		agotamiento += unDanio
	}
	
	method danioAtaqueSimple(){
		return armas.size() * 2
	}
	
}

object sora {
	var nombre = "Sora"
	var agotamiento = 0
	var comandos = #{"Pyro", "Hielo", "Electro"}
	var nivel = 1
	
	method nivel() = nivel
	
	method nombre() = nombre
	
	method agotamiento() = agotamiento
	
	method comandos() = comandos
	
	method tieneMuchoPoder() {
		return comandos.contains("Pyro++")
	}
	
	method descansar(){
		agotamiento = 0;
	}
	
	method evolucionar() {
		comandos = comandos.map({unComando => unComando + "+"}).asSet()
		nivel++
	}
	
	method danioAtaqueSimple(){
		return comandos.size() * nivel
	}
	
	method recibirAtaque(unDanio){
		agotamiento += unDanio
	}
	
}
