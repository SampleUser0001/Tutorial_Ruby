DATA_LENGTH = 10

if __FILE__ == $0
    data = (0..DATA_LENGTH-1).to_a

    data2 = data.clone

    # 値は同じ
    puts data == data2

    # 実態は別
    puts data.equal?(data2)

    # コピー先の値を変更してみる。
    data2[5] = 15

    # コピー先は当然変わっているが・・・
    puts data2.join(",")
    # コピー元は変わらない
    puts data.join(",")
end
