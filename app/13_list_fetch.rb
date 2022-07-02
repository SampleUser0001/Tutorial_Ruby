DATA_LENGTH = 10

if __FILE__ == $0
    data = (0..DATA_LENGTH-1).to_a

    # 添字5を取得
    puts data.fetch(5, 'X')

    # 添字10は存在しない。Xを取得。
    puts data.fetch(10, 'X')
end
