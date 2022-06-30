list = ["hoge", "piyo", "fuga"]

if list.respond_to?("each")
    list.each do |v|
        puts v
    end
end
