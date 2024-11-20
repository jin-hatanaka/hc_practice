class VendingMachine
  attr_reader :total_sales

  #売上金額を定義
  def initialize
    @total_sales = 0
  end

  # ジュースの情報を表示
  def show_juices(juices)
    i = 0
    juices.each do |juice|
      puts "#{i}. #{juice.name} 残り#{juice.stock}本"
      i += 1
    end
  end

  # チャージ残高、在庫からジュースを購入できるか判断
  def juice_buy?(suica, selected_juice)
    suica.balance >= selected_juice.price && selected_juice.stock > 0
  end

  # 購入処理
  def buy(suica, selected_juice)
    raise "チャージ残高または在庫が足りません" unless juice_buy?(suica, selected_juice)

    selected_juice.reduce_stock
    @total_sales += selected_juice.price
    suica.pay(selected_juice.price)
  end
end