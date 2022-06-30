list = ["hoge", "piyo", "fuga"]

if list.respond_to?("join")
    puts list.join(", ")
end
