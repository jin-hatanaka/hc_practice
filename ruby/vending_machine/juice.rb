class Juice
  attr_reader :name, :price

  # 名前、値段の情報を定義
  def initialize(name:, price:)
    @name = name
    @price = price
  end
end