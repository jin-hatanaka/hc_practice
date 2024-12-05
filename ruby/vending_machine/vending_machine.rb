class VendingMachine
  attr_reader :total_sales, :stock_pepsi, :stock_monster, :stock_irohas

  # 売上金額、ジュースの在庫を定義
  def initialize
    @total_sales = 0
    @stock_pepsi = 5
    @stock_monster = 5
    @stock_irohas = 5
  end

  # ジュースの情報を表示
  def show_juices(juices)
    stocks = [@stock_pepsi, @stock_monster, @stock_irohas]
    i = 0
    juices.zip(stocks) do |juice, stock|
      puts "#{i}. #{juice.name} 残り#{stock}本"
      i += 1
    end
  end

  # チャージ残高、在庫からジュースを購入できるか判断
  def juice_buy?(suica, selected_juice, selected_stock)
    suica.balance >= selected_juice.price && selected_stock > 0
  end

  # 購入処理
  def buy(suica, selected_juice, selected_stock)
    raise "チャージ残高または在庫が足りません" unless juice_buy?(suica, selected_juice, selected_stock)

    @total_sales += selected_juice.price
    suica.pay(selected_juice.price)
  end

  # 在庫を取得する関数を定義
  def get_stock(selected_juice)
    if selected_juice.name == "ペプシ(150円)"
      @stock_pepsi
    elsif selected_juice.name == "モンスター(230円)"
      @stock_monster
    elsif selected_juice.name == "いろはす(120円)"
      @stock_irohas
    end
  end

  # 在庫を減らす関数を定義
  def reduce_stock(selected_juice)
    if selected_juice.name == "ペプシ(150円)"
      @stock_pepsi -= 1
    elsif selected_juice.name == "モンスター(230円)"
      @stock_monster -= 1
    elsif selected_juice.name == "いろはす(120円)"
      @stock_irohas -=1
    end
  end

  # 在庫を補充する関数を定義
  def restock(selected_juice, restock_number)
    if selected_juice.name == "ペプシ(150円)"
      @stock_pepsi += restock_number
    elsif selected_juice.name == "モンスター(230円)"
      @stock_monster += restock_number
    elsif selected_juice.name == "いろはす(120円)"
      @stock_irohas += restock_number
    end
  end
end