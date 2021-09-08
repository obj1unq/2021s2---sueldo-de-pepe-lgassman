object pepe {
	
	var categoria = cadete
	
	method sueldo() {
		//return neto + bono x resultados + bono x presentismo
		return self.sueldoNeto()
	}
	
	method sueldoNeto() {
		return categoria.neto()
	}
	
	method categoria(_categoria) {
		categoria = _categoria
	}
	
}

object gerente {
	method neto() {
		return 15000
	}
}

object cadete {
	method neto() {
		return 20000
	}
}
