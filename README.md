# Tutorial_Ruby
Rubyのチュートリアル

- [Tutorial\_Ruby](#tutorial_ruby)
  - [Apps](#apps)
    - [print](#print)
    - [関数](#関数)
      - [引数なし](#引数なし)
      - [引数あり](#引数あり)
      - [デフォルト引数](#デフォルト引数)
  - [クラス](#クラス)
    - [クラスの宣言](#クラスの宣言)
    - [分割宣言](#分割宣言)
  - [配列](#配列)
    - [each](#each)
    - [join](#join)
  - [main宣言](#main宣言)
  - [％記法](#記法)
  - [配列](#配列-1)
    - [ブラケット構文(部分配列の取得)](#ブラケット構文部分配列の取得)
    - [fetch(配列の外の添字でアクセスする)](#fetch配列の外の添字でアクセスする)
    - [ディープコピー(clone)](#ディープコピーclone)
  - [set](#set)
  - [hash(Javaで言うMap, Pythonで言うdict)](#hashjavaで言うmap-pythonで言うdict)
  - [generator](#generator)
  - [class](#class)
    - [クラス宣言](#クラス宣言)
    - [宣言したクラスの使用](#宣言したクラスの使用)
  - [継承](#継承)
  - [例外](#例外)
  - [ファイルへのリンク](#ファイルへのリンク)
  - [参考](#参考)


## Apps

### print

``` ruby
puts "Hello World!"
```

``` txt
Hello World!
```

### 関数

#### 引数なし

``` ruby
def f1
    puts "Hello World!"
end

f1
f1()
```

``` txt
Hello World!
Hello World!
```

#### 引数あり

``` ruby
def f1(name)
    puts "Hello #{name}!"
end

f1("World")
f1("Hogehoge")
```

``` txt
Hello World!
Hello Hogehoge!
```

#### デフォルト引数

``` ruby
def f1(name = "World")
    puts "Hello #{name} !"
end

f1
f1()
f1("hogehoge")
f1(name = "hogehoge")
```

``` txt
Hello World !
Hello World !
Hello hogehoge !
Hello hogehoge !
```

## クラス

### クラスの宣言

``` ruby
class SampleClass
    def initialize(name = "World")
        @name = name
    end
    
    def printName()
        puts @name
    end
end

sample = SampleClass.new("Hoge")
sample.printName
# これはエラー。
# sample.name
# sample.@name
```

``` txt
Hoge
```

### 分割宣言

``` ruby 
class SampleClass
    def initialize(name = "World")
        @name = name
    end
    
    def printName()
        puts @name
    end
end
class SampleClass
    # getterとsetterを両方宣言する。
    attr_accessor :name
end

sample = SampleClass.new("Hoge")
puts "sample.respond_to?('name') : #{sample.respond_to?('name')}" 
sample.printName

sample.name = "Piyo"
sample.printName

# これはエラー。
# sample.name
# sample.@name

```

``` txt
sample.respond_to?('name') : true
Hoge
Piyo
```

## 配列

[参考](https://www.ruby-lang.org/ja/documentation/quickstart/3/)

### each

``` ruby
list = ["hoge", "piyo", "fuga"]

if list.respond_to?("each")
    list.each do |v|
        puts v
    end
end
```

### join

``` ruby
list = ["hoge", "piyo", "fuga"]

if list.respond_to?("join")
    puts list.join(", ")
end
```

## main宣言

``` ruby
if __FILE__ == $0
    puts $0
    puts "Hello World"
end
```

## ％記法

``` ruby
if __FILE__ == $0
    # ダブルクォート記法
    puts %!Hello #{ARGV[0]}\!!
    puts %Q!Hello\! Hello\! #{ARGV[0]}\!!

    # シングルクォート記法
    puts %q!Hello\! Hello\! #{ARGV[0]}\!!

end
```

``` txt
Hello !
Hello! Hello! !
Hello! Hello! #{ARGV[0]}!
```

## 配列

``` ruby
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
```

``` txt
list1 : []
list2 : [nil, nil, nil, nil, nil]
list2 : [nil, nil, "hoge", nil, nil]
list3 : [nil, nil, "hoge", nil, nil]
list4 : ["None0", "None1", "None2", "None3", "None4"]
```

### ブラケット構文(部分配列の取得)

``` ruby
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

```

``` txt
0,1,2,3,4,5,6,7,8,9
2,3,4,5,6
2,3,4,5
2,3,4,5,6,7,8,9
7,8
7,8
3,4,5
```

### fetch(配列の外の添字でアクセスする)

``` ruby
DATA_LENGTH = 10

if __FILE__ == $0
    data = (0..DATA_LENGTH-1).to_a

    # 添字5を取得
    puts data.fetch(5, 'X')

    # 添字10は存在しない。Xを取得。
    puts data.fetch(10, 'X')
end
```

### ディープコピー(clone)

``` ruby
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

```

## set

重複排除される配列

``` ruby
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
```

``` txt
#<Set: {"b", "a", "c"}>
追加されませんでした。
追加されました。
#<Set: {"b", "a", "c", "d"}>
```

## hash(Javaで言うMap, Pythonで言うdict)

``` ruby

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
```

``` txt
{"hoge"=>10, "piyo"=>20, "fuga"=>30}
10

key : hoge , value : 10
key : piyo , value : 20
key : fuga , value : 30
```

## generator

``` ruby
if __FILE__ == $0
    gen = Enumerator.new do |y|
        y << 'first'
        y << 'second'
        y << 'third'
    end
    
    puts gen.next
    puts gen.next
    puts gen.next
end
```

``` txt
first
second
third
```

## class

### クラス宣言

``` ruby
class SampleClass
    # コンストラクタ
    def initialize(value)
        # インスタンス変数
        @value = value
        @privateValue = 'privateValue'
    end

    def sampleFunc()
        puts "This is sampleFunc."
    end
    # public :sampleFunc
    # デフォルトはパブリック。
    
    # privateメソッド
    def privateSampleFunc()
        return @privateValue 
    end
    private :privateSampleFunc
    
    def putsPrivateValue()
        puts self.privateSampleFunc()
    end

    # クラスメソッド。インスタンスを生成しなくても呼べる。
    def self.classMethod()
        puts "This is classMethod."
    end

    attr_accessor :value
end
```

### 宣言したクラスの使用

``` ruby
require_relative 'lib/Sample'

if __FILE__ == $0
    hoge = SampleClass.new('hoge')
    piyo = SampleClass.new('piyo')
    
    puts hoge.value
    p piyo.value
    
    hoge.sampleFunc()
    hoge.putsPrivateValue()

    # privateなので呼べない。
    # hoge.privateSampleFunc()
    
    SampleClass.classMethod()
end
```

## 継承

``` ruby
# 親クラス
class SuperClass
    attr_accessor :value
    def initialize(value)
        @value = value
    end
    
    # 抽象メソッド
    # 直接抽象メソッドを実装することはできないので、抽象メソッドとして扱いたいメソッドは親クラスで例外を投げるようにしておく。
    def sampleMethod()
        raise "Called abstract method: my_print"
    end
end

# 継承
class SubClass < SuperClass
    def sampleMethod()
        puts "This is SubClass."
    end
end
```

``` ruby
require_relative 'lib/ExtendedSample'

if __FILE__ == $0
    sub = SubClass.new("hoge")
    puts sub.value
    puts sub.sampleMethod()
end
```

``` txt
hoge
This is SubClass.

```

## 例外

``` ruby
def raiseException()
    raise RuntimeError.new("RuntimeError!!")
end

if __FILE__ == $0
    begin
        raiseException()
    rescue RuntimeError => e
        puts e
    end
end
```

``` txt
RuntimeError!!
```

## ファイルへのリンク

- [print](./app/01_print.rb)
- 関数
    - [引数なし](./app/02_function.rb)
    - [引数あり](./app/03_function.rb)
    - [デフォルト引数](./app/04_function.rb)
- クラス
    - [クラスの宣言](./app/05_class.rb)
    - [分割宣言](./app/06_class.rb)
        - 正しい言い方は未確認。
 - 配列
    - [参考](https://www.ruby-lang.org/ja/documentation/quickstart/3/)
    - [each](./app/07_list_each.rb)
    - [join](./app/08_list_join.rb)
- main宣言
    - [main宣言](./app/09_main.rb)
- 特殊な文字列表現
    - [パーセント記法](./app/10_parcent.rb)
- コレクション/コンテナ
    - [配列](./app/11_list.rb)
        - [ブラケット構文](./app/12_bracket.rb)
        - [fetch](./app/13_list_fetch.rb)
            - 配列外の添字を指定したときにエラーにならずに何を返すかを指定する。
        - [clone](./app/14_list_clone.rb)
    - [Set](./app/15_set.rb)
    - [Hash](./app/16_hash.rb)
- 外部ファイルを読み込む
    - [require_relative](./app/17_require_relative.rb)
    - [require](./app/18_require.rb)
- ジェネレータ
    - [generator](./app/19_generator.rb)
- クラス
    - [class](./app/20_class.rb)
    - [継承](./app/21_extends.rb)
- 例外
    - [例外](./app/22_raise_exception.rb)


## 参考

- [20分ではじめるRuby:Ruby](https://www.ruby-lang.org/ja/documentation/quickstart/)