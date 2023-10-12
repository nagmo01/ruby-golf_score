
puts "このプログラムは"
puts "cat case_1.txt | ruby golf_score.rb"
puts "を実行するファイルを作成したときの考え方になります"



puts "readlinesを利用して標準入力を行ごとに配列で受け取る"
lines = readlines
puts "linesは"
p lines
puts lines.class
puts "lines[0]は"
puts lines[0]
puts lines[0].class
puts "lines[1]は"
puts lines[1]
puts lines[1].class

puts "配列の要素が数字とカンマが連続する文字列になっているので\nカンマを削除して数字だけの文字列にします"
=begin
lines[0] = (lines[0].delete(","))
lines[1] = (lines[1].delete(","))
puts "一行目"
puts lines[0]
puts "二行目"
puts lines[1]
=end
puts 'putsだと大丈夫なのですが、pで出力すると\nが入るのが気になります'

puts "念の為sizeメソッドで確認します"

p lines[0].size

puts '数字が18個に対してsizeが19になったので\nが要素にカウントされている可能性があります'

puts '改行文字を削除してもう一度sizeを確認します(deleteだとうまくいかなかったのでgsubで""に置き換えました)'
lines[0] = lines[0].gsub("\n", "")
lines[1] = lines[1].gsub("\n", "")

p lines[0]
p lines[0].size
p lines[1]
p lines[1].size



puts "これでテキストファイルからの受け取りをプログラム内で利用しやすい形にできました"

puts "-追記- やり方間違えてました。カンマを消す作業を行わずに改行文字のみ削除してからsplitメソッドでカンマを利用して配列を作る方法を取ります"

x = lines[0].split(',')
y = lines[1].split(',')

p x
p y

puts "map!メソッドで配列の中の文字列を整数に変える"
x.map!{|x| x.to_i}
y.map!{|x| x.to_i}

p x
p y

score_names = {

  -4=>"コンドル",
  -3=>"アルバトロス",
  -2=>"イーグル",
  -1=>"バーディ",
  0=>"バー",
  1=>"ボギー",
  2=>"2ボギー",
  3=>"3ボギー"
}

result = []


x.zip(y) do |hole,player|
  score = hole - player

  if player == 1 && (hole==3 || hole==4)
    result.push("ホールインワン")
  else
    result.push(score_names[score])
  end

end

puts result.join(',')

