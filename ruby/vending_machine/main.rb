require_relative 'suica'
require_relative 'juice'
require_relative 'vending_machine'

# インスタンスを生成
suica = Suica.new
vending_machine = VendingMachine.new

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
    vending_machine.show_juices

    puts
    puts "(ペプシ:pe モンスター:mo いろはす:ir)"
    print "購入するジュースの名前を入力してください > "
    pre_juice_name = gets.chomp
    puts "--------------------------------------------"

    if pre_juice_name == "pe"
      juice_name = "ペプシ(150円)"
    elsif pre_juice_name == "mo"
      juice_name = "モンスター(230円)"
    elsif pre_juice_name == "ir"
      juice_name = "いろはす(120円)"
    end

    # 入力情報を元に購入処理をする
    vending_machine.buy(suica, juice_name)

    puts "#{juice_name}を購入しました(残高: #{suica.balance})"
    puts "現在の売上金額: #{vending_machine.total_sales}"

  elsif number == 2
    # ジュースの情報を表示
    vending_machine.show_juices

    puts
    puts "(ペプシ:pe モンスター:mo いろはす:ir)"
    print "在庫を補充するジュースの名前を入力してください > "
    pre_juice_name = gets.chomp
    puts "--------------------------------------------"

    print "補充する本数を入力してください > "
    restock_number = gets.chomp.to_i
    puts "--------------------------------------------"

    if pre_juice_name == "pe"
      juice_name = "ペプシ(150円)"
    elsif pre_juice_name == "mo"
      juice_name = "モンスター(230円)"
    elsif pre_juice_name == "ir"
      juice_name = "いろはす(120円)"
    end

    # 入力情報を元に在庫を補充する処理をする
    vending_machine.restock(juice_name, restock_number)

    puts "#{juice_name}を#{restock_number}本補充しました"

  elsif number == 3
    break
  end
end