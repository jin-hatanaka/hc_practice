# 「名前を変更する」、「名前を取得する」という処理のモジュールを作成
module NameService
 def change_name(new_name)
    return puts '不適切な名前です' if new_name == "うんこ"

    @name = new_name
  end

  def get_name
    @name
  end
end