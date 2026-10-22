generatorとLint

【generator】  
railsにはgeneratorというツールが備わっていてこのコマンドを実行することで、マイグレーションファイルの作成やモデルの作成を簡単に行える。  

docker compose exec web rails g model  
上記のコマンドはdockerに備わっているRailsのgeneratorによって、  
モデルを作成するというコマンド。同時にマイグレーションファイルも生成される。  

docker compose exec web rails g migration　　
モデルを作成せずにマイグレーションファイルだけを作成するコマンド。  
既存のテーブルにカラムを追加したり変更削除したいときに使用。  

docker compose exec web rails g controller  
コントローラーを作成するコマンド  

【Lintとは】  
Lintとは、コードの品質やスタイルをチェックしてくれるツールのこと。  
不要な空白行や無駄なコードが無いかをチェックしてくれる。  

【Rubocopルボコップ】  
RubyのLintのこと。  
Rubyで記述されたコードをチェックしてくれる。  
これにより、インデント間違いや空行、空白などをチェックしてくれる  
Rubocopは下記コマンドで実行される。  
docker compose exec web bundle exec rubocop  
違反が見つかった際は「C」や「W」の文字が返される。  
