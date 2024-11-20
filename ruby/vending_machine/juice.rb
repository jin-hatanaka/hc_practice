class Juice
  attr_reader :name, :price, :stock

  #名前、値段、在庫の情報を定義
  def initialize(name:, price:)
    @name = name
    @price = price
    @stock = 5
  end

  #在庫を減らす
  def reduce_stock
    @stock -= 1 
  end

  # 在庫を補充
  def restock(restock_number)
    @stock +=  restock_number
  end
end