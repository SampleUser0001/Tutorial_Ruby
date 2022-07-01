if __FILE__ == $0
    # ダブルクォート記法
    puts %!Hello #{ARGV[0]}\!!
    puts %Q!Hello\! Hello\! #{ARGV[0]}\!!

    # シングルクォート記法
    puts %q!Hello\! Hello\! #{ARGV[0]}\!!

end
