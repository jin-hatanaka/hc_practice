class VendingMachine
  attr_reader :total_sales, :stock_pepsi, :stock_monster, :stock_irohas, :stocks

  # 売上金額、ジュースの在庫を定義
  #stocksというインスタンス変数に、Juiceインスタンスを要素に持つ配列を定義
  def initialize
    @total_sales = 0
    @stock_pepsi = 5
    @stock_monster = 5
    @stock_irohas = 5
    @stocks = [Juice.new(name: "ペプシ(150円)", price: 150), Juice.new(name: "モンスター(230円)", price: 230), Juice.new(name: "いろはす(120円)", price: 120)]
  end

  # ジュースの情報を表示
  def show_juices
    stocks_number = [@stock_pepsi, @stock_monster, @stock_irohas]
    i = 0
    @stocks.zip(stocks_number) do |stock, stock_number|
      puts "#{i}. #{stock.name} 残り#{stock_number}本"
      i += 1
    end
  end

  # チャージ残高、在庫からジュースを購入できるか判断
  def juice_buy?(suica, juice_number, selected_stock)
    suica.balance >= @stocks[juice_number].price && selected_stock > 0
  end

  # 購入処理
  def buy(suica, juice_number, selected_stock)
    raise "チャージ残高または在庫が足りません" unless juice_buy?(suica, juice_number, selected_stock)

    @total_sales += @stocks[juice_number].price
    suica.pay(@stocks[juice_number].price)
  end

  # 在庫を取得する関数を定義
  def get_stock(juice_number)
    if @stocks[juice_number].name == "ペプシ(150円)"
      @stock_pepsi
    elsif @stocks[juice_number].name == "モンスター(230円)"
      @stock_monster
    elsif @stocks[juice_number].name == "いろはす(120円)"
      @stock_irohas
    end
  end

  # 在庫を減らす関数を定義
  def reduce_stock(juice_number)
    if @stocks[juice_number].name == "ペプシ(150円)"
      @stock_pepsi -= 1
    elsif @stocks[juice_number].name == "モンスター(230円)"
      @stock_monster -= 1
    elsif @stocks[juice_number].name == "いろはす(120円)"
      @stock_irohas -=1
    end
  end

  # 在庫を補充する関数を定義
  def restock(juice_number, restock_number)
    if @stocks[juice_number].name == "ペプシ(150円)"
      @stock_pepsi += restock_number
    elsif @stocks[juice_number].name == "モンスター(230円)"
      @stock_monster += restock_number
    elsif @stocks[juice_number].name == "いろはす(120円)"
      @stock_irohas += restock_number
    end
  end
end