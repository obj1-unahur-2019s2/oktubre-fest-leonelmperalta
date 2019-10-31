class Carpa {
	var property limiteGenteAdmitida
	var property tieneBanda
	var property marcaQueSeVende
	var property personas = []
	
	method cantidadPersonas(){
		return personas.size()
	}
	method dejaEntrar(persona){
		return not (self.cantidadPersonas() + 1) == limiteGenteAdmitida and not persona.estaEbria()
	}
	method ingresar(persona){
		if(persona.puedeEntrar(self)){
			personas.add(persona)
		}
		else{
			
		}
	}
	method servir(persona, capacidadJarra){
		if(personas.contains(persona)){
			var jarra = new Jarra(capacidadEnLitros = capacidadJarra, marca = marcaQueSeVende)
			persona.tomar(jarra)
		}
		else{
			
		}
	}
	method cuantosEbriosEmpedernidos(){
		var ebrios = personas.filter({p => p.estaEbria()})
		return ebrios.count({e => e.esEbrioEmpedernido()})
	}
	method esHomogenea(){
		return personas.all({p => p.pais() == personas.first().pais()})
	}
	method nuevosAsistentes(){
		return personas.filter({p => not p.carpasDondeCompro().contains(self)})
	}
}
