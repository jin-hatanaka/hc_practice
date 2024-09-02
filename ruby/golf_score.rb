# 標準入力から値を受け取る
# 規定打数 -> hole, プレイヤーの打数 -> player
hole = gets.split(',').map(&:to_i)
player = gets.split(',').map(&:to_i)

# スコアに応じた呼び名のハッシュを定義
SCORE_MAPPING = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0 => 'パー',
  1 => 'ボギー'
}

score_name = []

# 2つの配列を同時にループさせる
hole.zip(player) do |hole, player|
  # スコアを算出
  score = player - hole

  # スコアに応じた呼び名を変数に格納
  if score >= 2
    score_name << "#{score}ボギー"
  elsif player == 1 && score != -4
    score_name << 'ホールインワン'
  else
    score_name << SCORE_MAPPING[score]
  end
end

# 区切り文字をカンマにして各要素を連結する
puts score_name.join(',')
