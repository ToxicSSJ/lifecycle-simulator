require './state'
require './generator'

require 'securerandom'

class Human
    
    attr_accessor :id, :genre, :name, :state, :stage, :action, :generation
    
    def initialize(genre, name)
    
        @id = SecureRandom.urlsafe_base64(5)
        @genre = genre
        @name = name
        
        @state = Estado::BEBE
        @stage = 0
        @action = getAction()
        @die = false
        
        @generation = 1
        @family = 1
        
    end
    
    def pushDie
        
        if(rand(10) == 5)
        
            @action = [ 'Ha muerto esta mañana', 'Ha muerto de un paro respiratorio', 'Ha muerto de un trauma craneoencefalico' ].shuffle
            @die = true
        
        end
    
    end
    
    def increaseStage
        
        if(@die || (@state + 1 > 4))
        
            if(@die)
                @family += 1
            end
        
            @stage = 0
            @state = 0
            @die = false
            
            fill = Generator.generatePerson()
            
            @genre = fill[0]
            @name = fill[1]
            
            @generation += 1
            @state = 0
            
            @action = getAction()
            
            return
            
        end
        
        @state += 1
        @action = getAction()
        
    end
    
    def smallPrint
        puts '[Human -> ID: ' + @id + ', GENERO: ' + @genre + ', NAME: ' + @name + ']'
    end
    
    def dataPrint
        puts '[Human -> ID: ' + @id + ', GENERO: ' + @genre + ', NAME: ' + @name + ', STATE: ' + getState() + ', ACTION: ' + @action[@stage] + ']'
    end
    
    def smartPrint
    
        puts 'Humano #' + @generation.to_s + ' Familia #' + @family.to_s
        puts ''
        puts 'Nombre: ' + @name
        puts 'Genero: ' + @genre
        puts 'Etapa: ' + getState()
        puts 'Estado: ' + @action[@stage].to_s
        puts 'Fase: ' + @state.to_s + '/4' 
        
        if(@state == 0)
            puts ''
            puts ' > ¡Ha nacido un nuevo bebe!'
            puts ''
        end
        
    end
    
    def getState
        return Estado.getStateName(@genre, @state)
    end
    
    def getAction
        return Generator.generateActionDataSet(@state)
    end
    
    def self.generate
        
        fill = Generator.generatePerson();
        instance = Human.new(fill[0], fill[1]);
        
        return instance
        
    end
    
end