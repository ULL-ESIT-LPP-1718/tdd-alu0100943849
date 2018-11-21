require 'spec_helper'

RSpec.describe Nutricional_label do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    before :all do
        @dll = DlinkedList.new()
        @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
        @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
        @alimento3 = Nutricional_label.new("yogur de fresa",11.2,0.8,0.1,12.5,1.8,0.1)
        @alimento4 = Nutricional_label.new("Chuleta de cerdo",20.0,0.0,14.0,0.0,36.0,0.75)
        @alimento5 = Nutricional_label.new("Hamburguesa",20.0,11.0,35.0,8.0,26.9,2.75)
    end
    
#------------------------------------------------------------------------------------
    
    describe "# Debe existir un nombre para la etiqueta: " do
        it "existe un nombre" do
            expect(@alimento1.nombre_etiqueta).to eq("Palmera de chocolate")
        end
    end
    
    describe "# Debe existir la candidad de grasas: " do
        it "existe la candidad de grasa" do
            expect(@alimento1.grasa.nil?).to eq(false)  #espera que el valor de @alimento1.grasa.nil? sea falso, porque tiene un valor y no esta nula, si la variable esta nula nil es igual a true que es distinto de false y falla la prueba
        end
        it "existe la candidad de grasa saturadas" do
            expect(@alimento1.grasa_saturada.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de  hidratos de carbono: " do
        it "existe la candidad de hidratos de carbono" do
            expect(@alimento1.hid_carbono.nil?).to eq(false)
        end
        it "existe la candidad de azucares" do
            expect(@alimento1.azucares.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de proteinas: " do
        it "existe la candidad de proteinas" do
            expect(@alimento1.proteinas.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de sal: " do
        it "existe la candidad de sal" do
            expect(@alimento1.sal.nil?).to eq(false)
        end
    end
#------------------------------------------------------------------------------------
    describe "# Nombre de la etiqueta: " do
        it "Existe un metodo para obtener el nombre" do
            expect(@alimento1.label_name).to eq("Palmera de chocolate")
        end
    end
    
    describe "# Valor Energetico: " do
        it "Existe un metodo para obtener el valor energetio en KJ." do
            expect(@alimento1.energetic_value_KJ).to eq(2144.4)
        end
        it "Existe un metodo para obtener el valor energetioen Kcal." do
            expect(@alimento1.energetic_value_Kcal).to eq(514.4)
        end
    end
    
    describe "# candidad de grasas: " do
        it "Existe un metodo para obtener la cantidad de grasas" do
            expect(@alimento1.grasa).to eq(11.0)
        end
        it "Existe un metodo para obtener la cantidad de grasas saturadas" do
            expect(@alimento1.grasa_saturada).to eq(22.0)
        end
    end
    
    describe "# candidad de  hidratos de carbono: " do
        it "Existe un metodo para obtener la cantidad de hidratos de carbono" do
            expect(@alimento1.hid_carbono).to eq(24.0)
        end
        it "Existe un metodo para obtener la cantidad de azucares" do
            expect(@alimento1.azucares).to eq(23.0)
        end
    end
    
    describe "# candidad de proteinas: " do
        it "Existe un metodo para obtener la cantidad de proteinas" do
            expect(@alimento1.proteinas).to eq(5.7)
        end
    end
    
    describe "# candidad de sal: " do
        it "Existe un metodo para obtener la cantidad de sal" do
            expect(@alimento1.sal).to eq(1.1)
        end
    end
    
    describe "# etiqueta: " do
        it "Existe un metodo para obtener la etiqueta formateada" do
            expect(@alimento1.to_s)
        end
    end
#------------------------------------------------------------------------------------
    describe "# Dll vacia: " do
        it "head = nil." do
            expect(@dll.head).to eq(nil)
        end
        it "tail = nil." do
            expect(@dll.tail).to eq(nil)
        end
    end
    
    describe "# insertar un alimento: " do
        it "comprobar que head y tail apunta al mismo nodo." do
            @dll.insertHead(@alimento1)
            expect(@dll.head.value).to eq(@alimento1)
            expect(@dll.tail.value).to eq(@alimento1)
        end
        it "Introducir mas alimentos" do
            @dll.insertTail(@alimento2)
            expect(@dll.tail.value).to eq(@alimento2)
            @dll.insertTail(@alimento3)
            expect(@dll.tail.value).to eq(@alimento3)
            @dll.insertTail(@alimento4)
            expect(@dll.tail.value).to eq(@alimento4)
            @dll.insertTail(@alimento5)
            expect(@dll.tail.value).to eq(@alimento5)
        end
    end
    
    describe "# cantidad de sal: " do
        it "poca sal" do
           expect(@alimento2.clasificar).to eq("poca")
           expect(@alimento3.clasificar).to eq("poca")
           expect(@alimento4.clasificar).to eq("poca")
        end
        it "cantidad justa de sal" do
           expect(@alimento1.clasificar).to eq("media")
        end
        it "mucha sal" do
           expect(@alimento5.clasificar).to eq("mucha")
        end
    end
    
    describe "# extraer un alimento: " do
        it "eliminar el ultimo alimento de la lista." do
          expect(@dll.popTail.value).to eq(@alimento5)
        end
        it "eliminar el primer alimento de la list." do
          expect(@dll.popHead.value).to eq(@alimento1)
        end
        it "Eliminar todos los alimento existente en la lista." do
          expect(@dll.removeAll).to eq(nil)
        end
        it "Eliminar un alimento inexistente de la lista." do
          expect(@dll.head).to eq(nil)
        end
    end
#------------------------------------------------------------------------------------     
    describe "# Herencia: " do
        before :each do
            @persona = Individuo.new("Mario Perez")
            @paciente = Pacientes.new("Pepe Garcia", nil)
        end  
        it "una objeto persona es una instancia de la clase Individuo" do
            expect(@persona).to be_an_instance_of(Individuo::Individuo)
        end
        it "una persona pertenece a la clase Individuo" do
          expect(@persona).is_a? Individuo
        end
        it "una persona pertenece a la clase Object" do
           expect(@persona).is_a? Object
        end
        it "una persona pertenece a la clase BasicObject" do
           expect(@persona).is_a? BasicObject
        end
        it "una objeto paciente es una instancia de la clase Pacientes" do
            expect(@paciente).to be_an_instance_of(Pacientes::Pacientes)
        end
        it "una paciente pertenece a la clase Pacientes" do
          expect(@paciente).is_a? Pacientes
        end
        it "una paciente pertenece a la clase Individuo" do
          expect(@paciente).is_a? Individuo
        end
        it "una paciente pertenece a la clase Object" do
           expect(@paciente).is_a? Object
        end
        it "una persopacientena pertenece a la clase BasicObject" do
           expect(@paciente).is_a? BasicObject
        end
    end
    
    describe "# Tipo: " do
        before :each do
          @persona = Individuo.new("Mario Perez")
          @paciente = Pacientes.new("Pepe Garcia", nil)
        end
        it "un objeto persona responde al método nombre" do
           expect(@persona).to respond_to(:nombre)
        end
        it "un objeto persona responde al método .es" do
           expect(@persona).to respond_to('es') 
        end
        it "un objeto paciente responde al método nombre y datos" do
           expect(@paciente).to respond_to(:nombre, :datos) 
        end
        it "un objeto persona responde al método indice_corporal" do
           expect(@paciente).to respond_to('indice_corporal') 
        end
        it "un objeto persona responde al método .es de la clase individuo" do
           expect(@paciente).to respond_to('es') 
        end
    end
 
    describe "# Clasificacion por imc: " do
        before :all do
            @persona = Individuo.new("Mario Perez")
            
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0))
            @paciente2 = Pacientes.new("Juas Perez", @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6))
            @paciente3 = Pacientes.new("Begoña Gomez", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0))
            @paciente4 = Pacientes.new("Luis Medina", @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5))
            @paciente5 = Pacientes.new("Maria Perez", @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5))
            
            @lista_pacientes = DlinkedList.new()
            @lista_pacientes.insertTail(@paciente1)
            @lista_pacientes.insertTail(@paciente2)
            @lista_pacientes.insertTail(@paciente3)
            @lista_pacientes.insertTail(@paciente4)
            @lista_pacientes.insertTail(@paciente5)
        end
        it "comprobacion de si un individuo cualquiera es paciente" do
           expect(@persona.es @paciente1).to eq(false) #Mario Perez no es Pepe Garcia
        end
        it "ICM: Peso adecuado" do
           expect(@lista_pacientes.head.value.to_s).to eq("Peso adecuado")
           @lista_pacientes.popHead
        end
        it "ICM: Sobrepeso" do
           expect(@lista_pacientes.head.value.to_s).to eq("Sobrepeso")
           @lista_pacientes.popHead
        end
        it "ICM: Peso adecuado" do
            expect(@lista_pacientes.head.value.to_s).to eq("Peso adecuado")
           @lista_pacientes.popHead
        end
         it "ICM: Obesidad grado 3" do
           expect(@lista_pacientes.head.value.to_s).to eq("Obesidad grado 3")
           @lista_pacientes.popHead
        end
        it "ICM: Obesidad grado 1" do
           expect(@lista_pacientes.head.value.to_s).to eq("Obesidad grado 1")
           @lista_pacientes.popHead
        end
    end
end
