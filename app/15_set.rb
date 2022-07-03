require 'set'

def addToSet(sets, value)
    if sets.add?(value)
        puts '追加されました。'
    else
        puts '追加されませんでした。'
    end
end

if __FILE__ == $0
    # 重複排除される。
    # 順序は保持されない。
    sets = Set['b', 'a', 'c', 'a']
    puts sets
    
    addToSet(sets, 'a')
    addToSet(sets, 'd')
    puts sets
end