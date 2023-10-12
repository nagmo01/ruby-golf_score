# frozen_string_literal: true

#標準入力を行ごとに配列の要素にして受け取る
lines = readlines

#標準入力の形式だと改行文字が入っているようだったので消す
lines[0] = lines[0].gsub("\n", '')
lines[1] = lines[1].gsub("\n", '')

#配列の要素になっている文字列をカンマごとに区切って配列にする
x = lines[0].split(',')
y = lines[1].split(',')

#配列には数字の文字列が入っているのでそれを整数の配列にする
x.map!(&:to_i)
y.map!(&:to_i)

score_names = {

  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0 => 'バー',
  1 => 'ボギー',
  2 => '2ボギー',
  3 => '3ボギー'
}

result = []

x.zip(y) do |hole, player|
  score = player - hole

  if player == 1 && [3, 4].include?(hole)
    result.push('ホールインワン')
  else
    result.push(score_names[score])
  end
end

puts result.join(',')
