object tablero {
    var casilleros = new List()
    
    method casillerosDesde(casilleroInicial, unNumero) {
        var inicio = self.indiceDeCasillero(casilleroInicial)
        return (casilleros.copy() + casilleros.copy()).subList(inicio, inicio + unNumero).drop(1)
    }

	method indiceDeCasillero(unCasillero) {
 		return self.indice(unCasillero, 0)
 	}
 
 	method indice(unCasillero, index) {
	 	if (unCasillero == casilleros.get(index)) {
	 		return index
	 	} else {
	 		return self.indice(unCasillero, index + 1)
	 	}
 	}
}

class Juego {
    var jugadores = new List()
        
    method agregarJugador(unJugador) {
        jugadores.add(unJugador)    
    }
    
    method empezar() {
        if (self.estaTerminado()) {
            jugadores.forEach({ jugador => self.haceQueJuegue(jugador) })
            self.empezar()
        }    
    }
    
    method estaTerminado() {
        return jugadores.any({ jugador => jugador.tieneTodasLasPropiedades() }) 
    }
    method haceQueJuegue(unJugador) {
        // TODO: HACERLO
    }
}

class jugador{}

class provincia{
	var campos = #{}
	
	method duenios(){
		return campos.map({unCampo => unCampo.duenio()})
	}
	method esMonopolio(){
		return ((self.duenios()).asSet()).size() == 1 //esta solucion es horrible, encontrar una mejor
	}
}

class campos{ //es inherit de provincia?
	var precioCompra
	var duenio
	var rentaFija
	var cantidadEstancias
	const construccionEstancia
	
	method rentaFija(){
		return rentaFija
	}
	method construirEstancia(){
		
		cantidadEstancias += 1 //sin terminar 
	}
	method valorRenta(){
		if (cantidadEstancias = 0){
			return rentaFija
		}
		else{
			return rentaFija * (2**cantidadEstancias)
		}
	}
	method duenio(){
		return duenio
	}
}

class empresas{
	var precioCompra
	var duenio
	
	method duenio(){
		return duenio
	}
}

