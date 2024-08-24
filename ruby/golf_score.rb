# 標準入力から値を受け取る
# 規定打数 -> hole, プレイヤーの打数 -> player
hole = gets.split(',').map(&:to_i)
player = gets.split(',').map(&:to_i)

score_name = []

# 2つの配列を同時にループさせる
hole.zip(player) do |hole, player|
  # スコアを算出
  score = player - hole

  # スコアに応じた呼び名を変数に格納
  if score == 1
    score_name << 'ボギー'
  elsif score >= 2
    score_name << "#{score}ボギー"
  elsif score.zero?
    score_name << 'パー'
  elsif score == -1
    score_name << 'バーディ'
  elsif score == -2 && player != 1
    score_name << 'イーグル'
  elsif score == -3 && player != 1
    score_name << 'アルバトロス'
  elsif score == -4 
    score_name << 'コンドル'
  elsif player == 1
    score_name << 'ホールインワン'
  end
end

# 区切り文字をカンマにして各要素を連結する
puts score_name.join(',')
