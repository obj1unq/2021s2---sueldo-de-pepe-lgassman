// Requerimiento: saber el sueldo de Sofía
// sofia.sueldo() -> Devuelva su sueldo
object sofia {

	var categoria
	var bonoPorResultado

	method sueldo() {
		return self.sueldoNeto() + self.valorPorBonoResultado()
	}

	method sueldoNeto() {
		return categoria.neto() * 1.3
	}

	method valorPorBonoResultado() {
		return bonoPorResultado.bonificacion(self)
	}

	method categoria(_categoria) {
		categoria = _categoria
	}

	method bonoPorResultado(_bonoPorResultado) {
		bonoPorResultado = _bonoPorResultado
	}

}

object pepe {

	var categoria
	var bonoPorResultado
	var bonoPorPresentismo
	var faltas = 0

	method sueldo() {
		return self.sueldoNeto() + self.valorPorBonoResultado() + self.valorPorBonoPresentismo()
	}

	method sueldoNeto() {
		return categoria.neto()
	}

	method valorPorBonoResultado() {
		return bonoPorResultado.bonificacion(self)
	}

	method categoria(_categoria) {
		categoria = _categoria
	}

	method bonoPorResultado(_bonoPorResultado) {
		bonoPorResultado = _bonoPorResultado
	}

	method bonoPorPresentismo(_bonoPorPresentismo) {
		bonoPorPresentismo = _bonoPorPresentismo
	}

	method valorPorBonoPresentismo() {
		return bonoPorPresentismo.bonificacionPresentismo(self)
	}

	method faltas(_faltas) {
		faltas = _faltas
	}

	method faltas() {
		return faltas
	}

	method asistenciaPerfecta() {
		return faltas == 0
	}

}

//Bonos por presentismo
object bonoPresentismoNormal {

	method bonificacionPresentismo(empleado) {
		return 0.max(2000 - empleado.faltas() * 1000)
// Alternativa if como expresion		
//		return if (empleado.asistenciaPerfecta()) {
//			 2000
//		} 
//		else if (empleado.faltas() == 1) {
//			1000
//		}
//		else {
//			0
//		}
// Alternativa if como control
//		if (empleado.asistenciaPerfecta()) {
//			 return 2000
//		} 
//		else if (empleado.faltas() == 1) {
//			return 1000
//		}
//		else {
//			return 0
//		}
	}

}

object bonoPresentismoAjuste {

	method bonificacionPresentismo(empleado) {
		return if (empleado.asistenciaPerfecta()) 100 else 0
	}

}

object bonoPresentismoDemagogico {

	method bonificacionPresentismo(empleado) {
		return if (empleado.sueldoNeto() < 18000) {
			500
		} else {
			300
		}
	}

}

object bonoPresentismoNulo {

	method bonificacionPresentismo(empleado) {
		return 0
	}

}

// Bonos por resultados
object bonoResultadoNulo {

	method bonificacion(empleado) {
		return 0
	}

}

object bonoResultadoFijo {

	method bonificacion(empleado) {
		return 800
	}

}

object bonoPorcentual {

	method bonificacion(empleado) {
		return 0.10 * empleado.sueldoNeto()
	}

}

// Interfaz -> Conjunto de mensajes que debe entender
//categorias
object gerente {

	var neto = 15000

	method neto() {
		return neto
	}

	method neto(_neto) {
		neto = _neto
	}

}

object cadete {

	method neto() {
		return 20000
	}

}

object vendedor {

	const bruto = 16000
	var hayAumentoPorMuchasVentas = false

	method activarAumentoPorMuchasVentas() {
		hayAumentoPorMuchasVentas = true
	}

	method desactivarAumentoPorMuchasVentas() {
		hayAumentoPorMuchasVentas = false
	}

	method neto() {
		return if (hayAumentoPorMuchasVentas) bruto * 1.25 else bruto
	}

}

