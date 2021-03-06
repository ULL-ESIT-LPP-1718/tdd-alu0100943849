# @author Carlos Arvelo Garcia (alu0100943849)

require 'nutrientes/version'
require 'Antropometrico'

#Clase Individuo almacena los datos de un individuo

class Individuo 
    
    attr_reader :nombre
    
    def initialize(nombre)
        @nombre = nombre
        @datos = nil
    end
    
    # Comprueba si el Tipo de un objeto es de tipo Individuo
    #
    # == Parameters:
    # Recibe un objeto
    #
    # == Returns:
    # Retorna true o false
    def es (other)
        if other.is_a? Individuo
          @nombre == other.nombre
        elsif
          false
        end
    end
    
    # Define el metodo para imprimir por pantalla 
    #
    # == Parameters:
    # No recibe ninguno
    #
    # == Returns:
    # Un string con el contenido de las variables
    def to_s
        puts "#{nombre}"
    end
    
    
end

class Pacientes < Individuo
    
    attr_reader :datos
    
    def initialize(nombre,datos)
        super(nombre)
        @datos = datos
    end
    
    def == (other)
        if other.is_a? Individuo
            nombre == other.nombre
        elsif
            false
        end
    end
    
    # Comprueba entre que valores esta el icm de un pacuente y determina su estado corporal
    #
    # == Parameters:
    # No recibe ninguno
    #
    # == Returns:
    # Un string con el peso del paciente
    def indice_corporal
        if @datos.indice_masa_corporal <= 18.5
            "Bajo peso"
        elsif @datos.indice_masa_corporal > 18.5 and @datos.indice_masa_corporal <= 24.9
            "Peso adecuado"
        elsif @datos.indice_masa_corporal > 25.0 and @datos.indice_masa_corporal <= 29.9
            "Sobrepeso"
        elsif @datos.indice_masa_corporal > 30.0 and @datos.indice_masa_corporal <= 34.9
            "Obesidad grado 1"
        elsif @datos.indice_masa_corporal > 35.0 and @datos.indice_masa_corporal <= 39.9
            "Obesidad grado 2"
        elsif @datos.indice_masa_corporal > 40
            "Obesidad grado 3"
        end
    end
    
    # Define el metodo para imprimir por pantalla 
    #
    # == Parameters:
    # No recibe ninguno
    #
    # == Returns:
    # Un string con el contenido de las variables
    def to_s
        "#{@datos.indice_masa_corporal}"
    end

end



