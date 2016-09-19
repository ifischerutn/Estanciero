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

class Jugador {
	var dinero
	var propiedades = new Set()
	
	method tirarDados() {
		return [1,2,3,4,5,6].anyOne() + [1,2,3,4,5,6].anyOne()  //ver alguno mejor
	}
	
	method construirEstancia(unaPropiedad) {
		if(propiedades.contains(unaPropiedad)) {
			unaPropiedad.construirEstancia()
			dinero -= unaPropiedad.costoEstancia()
		}
	}
}

class Provincia{
	var campos = #{}
	
	method duenios(){
		return campos.map({unCampo => unCampo.duenio()})
	}
	method esMonopolio(){
		return self.duenios().size() == 1  //ver si hay alguno mejor
	}
	
	method construccionPareja(campoAConstruir) {
		return campos.all({unCampo => self.esParejo(campoAConstruir, unCampo)})
	}
	method esParejo(campoAConstruir, otroCampo) {
		return campoAConstruir.cantidadEstancias() <= otroCampo.cantidadEstancias()
	}
}

class Campo{ //es inherit de provincia?
	var precioCompra
	var duenio
	var rentaFija
	var cantidadEstancias
	var costoEstancia 
	
	method rentaFija(){
		return rentaFija
	}
	
	method costoEstancia() {
		return costoEstancia
	}
	
	method cantidadEstancias() {
		return cantidadEstancias
	}
	method construirEstancia(){
		
		cantidadEstancias += 1 //ver si es ihnerit de provincia para terminar
	}
	method valorRenta(){
		if (cantidadEstancias = 0){
			return rentaFija
		}
		else{
			return rentaFija * (2**cantidadEstancias)  //sin el if no es lo mismo??
		}
	}
	method duenio(){
		return duenio
	}
	
	method sosEmpresa() {
		return false
	}
}

class Empresa{
	var precioCompra
	var duenio
  	
	method duenio() {
		return duenio
	}
	
	method sosEmpresa() {
		return true
  	}
  }
