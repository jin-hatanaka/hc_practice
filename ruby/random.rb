# ６人のリスト
members = ['A', 'B', 'C', 'D', 'E', 'F']
# 実行ごとに結果が変わるように６人のリストをシャッフル
shuffule_members = members.shuffle

# 配列の要素を1個ランダムに選ぶ
x = [1, 2].sample

# 3人と3人、または2人と4人にグループを分ける
devide1 = shuffule_members.slice(0..x)
devide2 = shuffule_members.slice(x+1..5)

# アルファベット順にして出力
p devide1.sort
p devide2.sort