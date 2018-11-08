require './human'
require 'securerandom'

human = Human.generate();
year = 2018

loop do
    
    Gem.win_platform? ? (system "cls") : (system "clear")
    
    puts '---------------------------------------------------------'
    puts ''
    
    puts 'Año ' + year.to_s
    human.pushDie
    human.smartPrint
    
    puts ''
    puts 'Nota: Presione ENTER para avanzar en el tiempo.'
    puts ''
    puts '---------------------------------------------------------'
    
    year += Estado.calculateYears(human.state)
    human.increaseStage
    
    gets
    
end

