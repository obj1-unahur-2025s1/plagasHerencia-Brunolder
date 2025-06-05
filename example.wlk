//Elementos

class Hogar {
    var nivelDeMugre
    const confort
    method esBueno() = nivelDeMugre <= confort / 2
  method efectoDelAtaque(unaPlaga) {
    nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDaño()
  }

}
class Huerta {
  var produccion
  method esBueno() = produccion > nivelMinimo.valor()
  method efectoDelAtaque(unaPlaga) {
    produccion = (produccion - (unaPlaga.nivelDeDaño()) * 0.1 + if(unaPlaga.transmiteEnfermedades()) 10 else 0).max(0)
  }
}

object nivelMinimo {
  var property valor = 1000 
}

class Mascota {
  var nivelDeSalud
  method esBueno() = nivelDeSalud > 250 
  method efectoDelAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedades()) {nivelDeSalud = nivelDeSalud - unaPlaga.nivelDeDaño()}
  }
}

class Barrios {
  const elementos = [] 
  method agregarElementos(unElemento) {
    elementos.add(unElemento)
  }
  method cantElementosBuenos() = elementos.count({e = e.esBueno()}) 
  method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos() 
  method cantElementosMalos() = elementos.count({e =>not e.esBuenos()}) 
  method cantElementosMalosBIS() = elementos.size()



}

class Plagas {
  var poblacion 
  method transmiteEnfermedades() = poblacion > 10  
  method efectoDeAtacar() {
    poblacion = poblacion + poblacion * 0.1
  }
  method atacar(unElemento) {
    self.efectoDeAtacar()
    unElemento.efectoDeAtacar(self)
    self.efectoDeAtacar()
  }
}

class Cucarachas inherits Plagas{
  const pesoPromedio  
 override method transmiteEnfermedades() = super() && pesoPromedio > 10 
  method nivelDeDaño() = poblacion / 2
  override method efectoDeAtacar() {
    super()
    poblacion = poblacion + poblacion * 2
  }
}

class Mosquitos inherits Plagas{
 override method transmiteEnfermedades() = super() && poblacion % 3 == 0
  method nivelDeDaño() = poblacion 
  override method efectoDeAtacar() {
    super()
    poblacion = poblacion + poblacion * 2
  }
}

class Pulgas inherits Plagas{
  method nivelDeDaño() = poblacion * 2
  override method efectoDeAtacar() {
    super()
    poblacion = poblacion + poblacion * 2
  }
}

class Garrapatas inherits Plagas{
  method nivelDeDaño() = poblacion * 2
  override method efectoDeAtacar() {
    super()
    poblacion = poblacion + poblacion * 2
  }
}
