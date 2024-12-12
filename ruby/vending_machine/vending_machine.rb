class VendingMachine
  attr_reader :total_sales, :stocks

  # 売上金額を定義
  #stocksというインスタンス変数に、Juiceインスタンスを要素に持つ配列を定義
  def initialize
    @total_sales = 0
    @stocks = [Juice.new(name: "ペプシ(150円)", price: 150), Juice.new(name: "ペプシ(150円)", price: 150), Juice.new(name: "ペプシ(150円)", price: 150), Juice.new(name: "ペプシ(150円)", price: 150), Juice.new(name: "ペプシ(150円)", price: 150), 
               Juice.new(name: "モンスター(230円)", price: 230), Juice.new(name: "モンスター(230円)", price: 230), Juice.new(name: "モンスター(230円)", price: 230), Juice.new(name: "モンスター(230円)", price: 230), Juice.new(name: "モンスター(230円)", price: 230), 
               Juice.new(name: "いろはす(120円)", price: 120), Juice.new(name: "いろはす(120円)", price: 120), Juice.new(name: "いろはす(120円)", price: 120), Juice.new(name: "いろはす(120円)", price: 120), Juice.new(name: "いろはす(120円)", price: 120)]
  end

  # ジュースの情報を表示
  def show_juices
    "0. ペプシ(150円) 残り#{get_stock(0)}本\n" +
    "1. モンスター(230円) 残り#{get_stock(1)}本\n" +
    "2. いろはす(120円) 残り#{get_stock(2)}本"
  end

  # チャージ残高、在庫からジュースを購入できるか判断
  def juice_buy?(suica, juice_number)
    suica.balance >= get_price(juice_number) && get_stock(juice_number) > 0
  end

  # 購入処理
  def buy(suica, juice_number)
    raise "チャージ残高または在庫が足りません" unless juice_buy?(suica, juice_number)

    @total_sales += get_price(juice_number)
    suica.pay(get_price(juice_number))
  end

  # 在庫を取得する関数を定義
  def get_stock(juice_number)
    if juice_number == 0
      @stocks.select { |juice| juice.name == "ペプシ(150円)" }.size
    elsif juice_number == 1
      @stocks.select { |juice| juice.name == "モンスター(230円)" }.size
    elsif juice_number == 2
      @stocks.select { |juice| juice.name == "いろはす(120円)" }.size
    end
  end

  #値段を取得する関数を定義
  def get_price(juice_number)
    if juice_number == 0
      150
    elsif juice_number == 1
      230
    elsif juice_number == 2
      120
    end
  end

  #名前を取得する関数を定義
  def get_name(juice_number)
    if juice_number == 0
      "ペプシ(150円)"
    elsif juice_number == 1
      "モンスター(230円)"
    elsif juice_number == 2
      "いろはす(120円)"
    end
  end

  # 在庫を減らす関数を定義
  def reduce_stock(juice_number)
    if juice_number == 0
      @stocks.delete_at(@stocks.index { |stock| stock.name == "ペプシ(150円)" })
    elsif juice_number == 1
      @stocks.delete_at(@stocks.index { |stock| stock.name == "モンスター(230円)" })
    elsif juice_number == 2
      @stocks.delete_at(@stocks.index { |stock| stock.name == "いろはす(120円)" })
    end
  end

  # 在庫を補充する関数を定義
  def restock(juice_number, restock_number)
    if juice_number == 0
      restock_number.times { @stocks << Juice.new(name: "ペプシ(150円)", price: 150) }
    elsif juice_number == 1
      restock_number.times { @stocks << Juice.new(name: "モンスター(230円)", price: 230) }
    elsif juice_number == 2
      restock_number.times { @stocks << Juice.new(name: "いろはす(120円)", price: 120) }
    end
  end
end