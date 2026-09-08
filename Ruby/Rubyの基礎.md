Rubyの基礎

【Ruby】の実行方法  
実行方法はいくつかあるが基本は、rubyファイルを作成して、読み込んで結果を出力する。  
実行コマンド  
ruby ファイル名.rb  

【Ruby】の文法  

●変数宣言   
変数名 = 値  
例）  
a = 10  
b = "Hello"  

●データ型  
数値型（Number）  
文字列（String）  
真偽（Boolean）  
配列（Array）  
ハッシュ（Hash）→キーと値のペアを持つデータ構造  
ハッシュの例文）  
person = { name: "Alice", age: "25}  
シンボル（Symbol）→文字列のようなオブジェクトだが、一度作成すると変更できない。  
nil：値がないこと  

●演算子  
・算術演算子  
　+,-,*,/,%,**  
　%は余を求める、**は累乗を求める際に使用。  
・比較演算子  
　==,!=,>,>,>=,<=  
・論理演算子  
　&&：かつ,||：または,!true：trueではない  

●制御構文  
・if文:条件によって分岐させる、elseで条件に合わない場合の処理を記述  
・case文：whenで条件に合致する処理を実行する。  
例文）colorの値によって処理を分岐させる  
```
color = "red"
case color
when "red"
  puts "Color is red." # colorが"red"なら、このコードが実行されます。
when "blue"
  puts "Color is blue." # colorが"blue"なら、このコードが実行されます。
else
  puts "Color is not red or blue." # どの条件にも当てはまらない場合、このコードが実行されます。
end  
```  
・while文：条件がtrueの間繰り返す。  
・times文：指定した回数だけ、処理を繰り返す。  
例文）5回処理を繰り返す  
```
5.times do |count|
  puts count # 0から4までの数値を順に出力します。
end   
```  

