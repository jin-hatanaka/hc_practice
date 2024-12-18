class Suica
  attr_reader :balance

  #残高はデフォルトで500円チャージする
  def initialize
    @balance = 500
  end

  #残高に金額をチャージ
  def charge(money)
    @balance += money
  end

  #チャージ残高を減らす
  def pay(price)
    @balance -= price
  end
end