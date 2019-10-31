class Persona {
	var property peso
	var property jarras = []
	var property leGustaMusicaTradi = false
	var property nivelAguante
	
	method tomar(jarra){
		jarras.add(jarra)
	}
	method cantidadDeAlcoholIngerida() = jarras.sum({j => j.contenidoDeAlcohol()})
	method estaEbria() = self.cantidadDeAlcoholIngerida() * peso > nivelAguante	
	method leGusta(marca)
	method quiereEntrar(carpa){
		return carpa.tieneBanda() == self.leGustaMusicaTradi() and self.leGusta(carpa.marcaQueSeVende())  
	}
	method puedeEntrar(carpa){
		return self.quiereEntrar(carpa) and carpa.dejaEntrar(self)
	}
	method entrar(carpa){
		carpa.ingresar(self)
	}
	method esEbrioEmpedernido(){
		return jarras.all({j => j.capacidadEnLitros() >= 1})
	}
	method esPatriota(){
		return jarras.all({j => j.marca().pais() == self.pais()})
	}
	method pais()
	method esCompatibleCon(persona){
		var selfMarcas = jarras.map({j => j.marca()}).asSet()
		var personaMarcas = persona.jarras().map({ j => j.marca()}).asSet()
		return selfMarcas.intersection(personaMarcas).size() > selfMarcas.difference(personaMarcas).size()	
	}
	method carpasDondeCompro(){
		return jarras.map({j => j.carpa()})
	}
}

class Belga inherits Persona{
	override method pais() = "Belgica"
	override method leGusta(marca) = marca.lupulo() > 4
}

class Checo inherits Persona{
	override method pais() =  "Republica Checa"
	override method leGusta(marca) = marca.graduacion() > 8
}

class Aleman inherits Persona{
	override method pais() =  "Alemania"
	override method leGusta(marca) = true
	override method quiereEntrar(carpa){
		return super(carpa) and carpa.cantidadPersonas().even()
	}
} 


