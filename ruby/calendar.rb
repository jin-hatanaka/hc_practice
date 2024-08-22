# puts "    February 2022   "
# puts "Mo Tu We Th Fr Sa Su"
# puts "    1  2  3  4  5  6"
# puts " 7  8  9 10 11 12 13"
# puts "14 15 16 17 18 19 20"
# puts "21 22 23 24 25 26 27"
# puts "28"

require 'date'
require 'optparse'

def calendar(year, month)
  # 指定した月の1日と最終日を指定します
  month_start_day = Date.new(year, month, 1)
  month_end_day = Date.new(year, month, -1)

  # カレンダーのヘッダーを表示
  puts "      #{month}月 #{year}    "
  puts '月 火 水 木 金 土 日'

  # 1日までの位置を揃えるようにスペースを表示
  # cwday->暦週の日 (曜日) を返します (1-7、月曜は1)
  print '   ' * (month_start_day.cwday - 1)

  # 月の日にちを表示
  (month_start_day..month_end_day).each do |d|
    # 日曜日で改行
    if d.sunday?
      # 2桁右詰めで出力
      puts d.day.to_s.rjust(2)
    else
      # 2桁右詰めで出力＆各、日にちの間にスペース
      print "#{d.day.to_s.rjust(2)} "
    end
  end
  puts
end


# optparseを使用しオプションを定義
options = {}
opt = OptionParser.new
opt.on("-m month", Integer) {|m| options[:month] = m}

opt.parse!(ARGV)

# 現在の日付と年を取得
today = Date.today
year = today.year

# -mオプションの指定があった月を取得 なければ、今月の月を取得
month = options[:month] || today.mon

# -mの引数が不正な月(1月〜12月以外)であればエラーを表示
if month < 1 || 12 < month
  puts "#{month} is neither a month number (1..12) nor a name"
end

calendar(year, month)
