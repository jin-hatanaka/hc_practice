require_relative 'suica'
require_relative 'juice'
require_relative 'vending_machine'

# インスタンスを生成
suica = Suica.new

juice1 = Juice.new(name: "ペプシ(150円)", price: 150)
juice2 = Juice.new(name: "モンスター(230円)", price: 230)
juice3 = Juice.new(name: "いろはす(120円)", price: 120)

vending_machine = VendingMachine.new

# 生成したインスタンスを配列に入れる
juices = [juice1, juice2, juice3]

while true
  puts "--------------------------------------------"
  puts "何をしますか"
  puts
  puts "0. suicaにチャージする"
  puts "1. ジュースを購入する"
  puts "2. ジュースの在庫を補充する"
  puts "3. 終了"
  puts
  print "番号を選択してください > "
  number = gets.chomp.to_i
  puts "--------------------------------------------"

  if number == 0
    print "チャージする金額を入力してください > "
    money = gets.chomp.to_i
    puts "--------------------------------------------"

    # 100円未満をチャージしようとした場合は例外を発生させる
    raise "100円以上をチャージしてください" if money < 100

    # 100円以上の金額をチャージ
    suica.charge(money)
    puts "#{money}円チャージしました"
    puts "suicaの残高: #{suica.balance}円"

  elsif number == 1
    # ジュースの情報を表示
    vending_machine.show_juices(juices)

    puts
    print "購入するジュースの番号を入力してください > "
    juice_number = gets.chomp.to_i
    puts "--------------------------------------------"

    selected_juice = juices[juice_number]
    # 在庫を取得し、selected_stockに代入する
    selected_stock = vending_machine.get_stock(selected_juice)

    # 入力情報を元に購入処理をする
    vending_machine.buy(suica, selected_juice, selected_stock)
    # 入力情報を元に在庫を減らす処理をする
    vending_machine.reduce_stock(selected_juice)

    puts "#{selected_juice.name}を購入しました(残高: #{suica.balance})"
    puts "現在の売上金額: #{vending_machine.total_sales}"

  elsif number == 2
    # ジュースの情報を表示
    vending_machine.show_juices(juices)

    puts
    print "在庫を補充するジュースの番号を入力してください > "
    juice_number = gets.chomp.to_i
    puts "--------------------------------------------"

    selected_juice = juices[juice_number]

    print "補充する本数を入力してください > "
    restock_number = gets.chomp.to_i
    puts "--------------------------------------------"

    # 入力情報を元に在庫を補充する処理をする
    vending_machine.restock(selected_juice, restock_number)

    puts "#{selected_juice.name}を#{restock_number}本補充しました"

  elsif number == 3
    break
  end
end