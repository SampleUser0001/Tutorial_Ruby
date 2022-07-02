def printNameAndValue(name, value)
    puts "#{name} : #{value}"
end

if __FILE__ == $0
    list1 = Array.new
    printNameAndValue("list1", list1)

    list2 = Array.new(5)
    printNameAndValue("list2", list2)

    list3 = list2
    list3[2] = "hoge"
    printNameAndValue("list2", list2)
    printNameAndValue("list3", list3)

    list4 = Array.new(5) do |i|
        "None#{i}"
    end
    printNameAndValue("list4", list4)

end