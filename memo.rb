require "csv" 

loop do
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    memo_type = gets.to_i 

    if memo_type == 1
        puts "拡張子を除いたファイルを入力してください:"
        file_name = gets.chomp
        puts "メモしたい内容を記入してください:"
        puts "完了したらCtrl + Dを押します"
        memo_content =$stdin.read.chomp

        
        CSV.open("#{file_name}.csv", "a") do |csv|
            csv << [memo_content]
        end
        puts "メモが追加されました"
        break
    elsif memo_type == 2
        puts "編集したいメモのファイル名(拡張子を除く)を入力してください:"
        file_name = gets.chomp

        memo_content = CSV.read("#{file_name}.csv").first.first

        puts "現在のメモ内容:#{memo_content}"
        puts "新しいメモ内容を入力してください:"
        puts "完了したらCtrl + Dを押します"
        new_memo_content = $stdin.read.chomp

        CSV.open("#{file_name}.csv", "w") do |csv|
            csv << [new_memo_content]
        end

        puts "メモが更新されました"
        break
    else
        puts "不正な値です。1か2を選択して下さい"
    end
end