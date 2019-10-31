class Marca {
	var property lupulo
	var property pais
}

class CervezaRubia inherits Marca{
	var property graduacion
}

class CervezaNegra inherits Marca{
	var property graduacionReglamentaria
	
	method graduacion() = graduacionReglamentaria.min(lupulo)
}

class CervezaRoja inherits CervezaNegra{
	override method graduacion() = super() * 1.25
}

class Jarra{
	var property capacidadEnLitros
	var property marca
	var property carpa
	
	method contenidoDeAlcohol() = capacidadEnLitros * marca.graduacion()
}