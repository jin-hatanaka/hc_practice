# ６人のリスト
members = ['A', 'B', 'C', 'D', 'E', 'F']
# 実行ごとに結果が変わるように６人のリストをシャッフル
shuffule_members = members.shuffle

# 2人と4人にグループを分ける
devide1 = shuffule_members.slice(0..1)
devide2 = shuffule_members.slice(2..5)
group1 = [devide1, devide2]

# 3人と3人にグループを分ける
devide3 = shuffule_members.slice(0..2)
devide4 = shuffule_members.slice(3..5)
group2 =[devide3, devide4]

# 配列の要素を1個ランダムに選ぶ
select = [group1, group2].sample

# アルファベット順にして出力
p select[0].sort
p select[1].sort