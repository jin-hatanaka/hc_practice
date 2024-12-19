require_relative 'name_service'

# 抽象クラスを作成
class Pokemon
  include NameService

  attr_accessor :name

  private :name, :name=

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name} のこうげき!"
  end
end
