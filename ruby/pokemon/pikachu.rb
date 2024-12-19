require_relative 'pokemon'

class Pikachu < Pokemon

  def initialize(name, type1, type2, hp)
    super(name, type1, type2, hp)
  end

  def attack
    super
    puts "#{@name} の10万ボルト!"
  end
end
