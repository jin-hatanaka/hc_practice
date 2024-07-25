# ６人のリスト
members = ['A', 'B', 'C', 'D', 'E', 'F']
# 実行ごとに結果が変わるように６人のリストをシャッフル
shuffule_members = members.shuffle

# 実行ごとにif文の選択が変わるように配列の要素を1個ランダムに選ぶ
select = [1, 2].sample

# 3人と3人、または2人と4人にグループを分ける
# 2人と4人にグループを分ける
if select == 1
  group1 = shuffule_members.slice(0..1)
  group2 = shuffule_members.slice(2..5)
# 3人と3人にグループを分ける
elsif select == 2
  group1 = shuffule_members.slice(0..2)
  group2 = shuffule_members.slice(3..5)
end

# アルファベット順にして出力
p group1.sort
p group2.sort
