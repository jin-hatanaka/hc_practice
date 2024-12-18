class VendingMachine
  attr_reader :total_sales, :stocks

  # 売上金額を定義
  #stocksというインスタンス変数に、Juiceインスタンスを要素に持つ配列を定義
  def initialize
    @total_sales = 0
    @stocks = []
    5.times do
      @stocks << Juice.new(name: "ペプシ(150円)", price: 150)
      @stocks << Juice.new(name: "モンスター(230円)", price: 230)
      @stocks << Juice.new(name: "いろはす(120円)", price: 120)
    end
  end

  # ジュースの情報を表示
  def show_juices
    @stocks.uniq { |stock| stock.name }.each do |s|
      puts "- #{s.name} 残り#{@stocks.select do |stock| stock.name == s.name end.size}本"
    end
  end

  # チャージ残高、在庫からジュースを購入できるか判断
  def juice_buy?(suica, juice_name)
    get_stock(juice_name) > 0 && suica.balance >= get_price(juice_name)
  end

  # 購入処理
  def buy(suica, juice_name)
    raise "チャージ残高または在庫が足りません" unless juice_buy?(suica, juice_name)
    
    # 売上金額を増やす
    @total_sales += get_price(juice_name)
    # Suicaのチャージ残高を減らす
    suica.pay(get_price(juice_name))
    # 在庫を減らす
    @stocks.delete_at(@stocks.index { |stock| stock.name == juice_name })
  end

  # 在庫を取得する関数を定義
  def get_stock(juice_name)
    @stocks.select { |stock| stock.name == juice_name }.size
  end

  #値段を取得する関数を定義
  def get_price(juice_name)
    @stocks.find { |stock| stock.name == juice_name }.price
  end

  # 在庫を補充する関数を定義
  def restock(juice_name, restock_number)
    if juice_name == "ペプシ(150円)"
      restock_number.times { @stocks << Juice.new(name: "ペプシ(150円)", price: 150) }
    elsif juice_name == "モンスター(230円)"
      restock_number.times { @stocks << Juice.new(name: "モンスター(230円)", price: 230) }
    elsif juice_name == "いろはす(120円)"
      restock_number.times { @stocks << Juice.new(name: "いろはす(120円)", price: 120) }
    end
  end
end