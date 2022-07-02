DATA_LENGTH = 10

if __FILE__ == $0

    # 配列の初期化
    data = (0..DATA_LENGTH-1).to_a

    puts data.join(",")

    # 添字2から5つ分
    puts data[2, 5].join(",")

    # 添字2から添字5まで
    puts data[2..5].join(",")

    # 添字2から上限まで
    puts data[2, DATA_LENGTH].join(",")

    # 後ろから3つ目から2個
    puts data[-3, 2].join(",")

    # 後ろから3つ目から2個
    puts data[-3, 2].join(",")

    # 後ろから7つ目から添字5まで
    puts data[-7..5].join(",")


end
