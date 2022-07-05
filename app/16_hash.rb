
if __FILE__ == $0
    sampleHash = Hash['hoge', 10, 'piyo', 20, 'fuga', 30]
    puts sampleHash
    
    puts sampleHash['hoge']
    
    # エラーにはならない。
    puts sampleHash['foo']

    sampleHash.each do |k, v|
        puts "key : #{k} , value : #{v}"
    end
end