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

class provincia{}

class campos inherits provincia{}

class empresas{}
