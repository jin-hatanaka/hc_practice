require_relative 'pikachu'

pika = Pikachu.new("ピカチュウ", "でんき", "", 100)

pika.attack

pika.change_name("テキセツ")
puts pika.get_name

pika.change_name("うんこ")
puts pika.get_name