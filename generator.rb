require './state'

$VERBOSE = nil

@@man_fn = [ 'Sebastian', 'Camilo', 'Simón', 'Abraham', 'Oscar' ]
@@man_sn = [ 'Andrés', 'Miguel', 'Antonio' ]
@@man_ss = [ 'Restrepo', 'Gómez', 'Sanchez' ]

@@women_fn = [ 'Karina', 'Camila', 'Victoria', 'Karina', 'Valentina' ]
@@women_sn = [ 'Lucia', 'Isabel', 'María' ]
@@women_ss = [ 'Restrepo', 'Gómez', 'Sanchez' ]

@@universal_action = [ 'Está durmiendo', 'Está en el baño', 'Está de paseo', 'Está cenando', 'Está almorzando', 'Está cenando', 'Está en el cine', 'Está celebrando su cumpleaños' ]

@@baby_action = [ 'Está gateando por la casa', 'Está aprendiendo a caminar', 'Está tomando de su biberón', 'Está escuchando canciones de cuna' ]
@@child_action = [ 'Está jugando con sus juguetes', 'Está viendo la televisión', 'Está haciendo tareas', 'Está en la escuela', 'Está en una fiesta de cumpleaños' ]
@@young_action = [ 'Está jugando videojuegos', 'Está preparando una expocisión', 'Está haciendo tarea de mátematicas', 'Está en la escuela', 'Está presentando un examen', 'Está leyendo un libro', 'Está de paseo con sus amigos', 'Está de paseo con su familia' ]
@@adult_action = [ 'Está cursando en la universidad', 'Está viendo videos en su celular', 'Está haciendo trabajos', 'Está realizando una expocisión', 'Está leyendo un libro', 'Está caminando por la calle', 'Está mercando en el supermercado local', 'Está ofreciendole matrimonio a su pareja' ]

class Generator
    
    def self.generatePerson
        genre = generateGenre();
        names = generateNames(genre);
        return genre, names;
    end
    
    def self.generateGenre
        return rand(2) == 1 ? "Hombre" : "Mujer";
    end
    
    def self.generateNames(genre)
    
        if(genre == "Hombre")
            return @@man_fn.sample(1).join() + ' ' + 
                   @@man_sn.sample(1).join() + ' ' + 
                   @@man_ss.sample(1).join()
        end
        
        return @@women_fn.sample(1).join() + ' ' + 
               @@women_sn.sample(1).join() + ' ' + 
               @@women_ss.sample(1).join()
                   
    end
    
    def self.generateSingleAction(stage)
        
        if(stage == 0)
            return @@baby_action.sample(1).join()
        elsif(stage == 1)
            return @@child_action.sample(1).join()
        elsif(stage == 2)
            return @@young_action.sample(1).join()
        elsif(stage == 3)
            return @@adult_action.sample(1).join()
        end
        
    end
    
    def self.generateActionDataSet(stage)
        
        if(stage == 0)
            return @@baby_action.shuffle[0 .. 2]
        elsif(stage == 1)
            return @@child_action.shuffle[0 .. 2]
        elsif(stage == 2)
            return @@young_action.shuffle[0 .. 2]
        else
            return @@adult_action.shuffle[0 .. 2]
        end
        
    end
    
end