$VERBOSE = nil

@@states_man_names = [ 'Bebé', 'Niño', 'Adolescente', 'Joven', 'Adulto' ]
@@states_women_names = [ 'Bebé', 'Niña', 'Adolescente', 'Joven', 'Adulta' ]

class Estado

    def Estado.add_item(key,value)
        @hash ||={}
        @hash[key] = value
    end
    
    def Estado.const_missing(key)
        @hash[key]
    end
    
    def Estado.each
        @hash.each {|key,value| yield(key,value)}
    end
    
    def self.getStateName(genre, state)
    
        if(genre == "Hombre")
            return @@states_man_names[state]
        end
    
        return @@states_women_names[state]
    
    end
    
    def self.calculateYears(stage)
        
        if(stage == 0)
            return rand(1..2)
        elsif(stage == 1)
            return rand(12..14)
        elsif(stage == 2)
            return rand(4..5)
        else
            return rand(5..12)
        end
        
    end
    
    Estado.add_item :BEBE, 0
    Estado.add_item :NINO, 1
    Estado.add_item :ADOLESCENTE, 2
    Estado.add_item :JOVEN, 3
    Estado.add_item :ADULTO, 4
    
end
