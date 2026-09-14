RubyでのWeb開発

【HTTP通信】（HTTPについてはWebの範囲で解説）  
RubyにはHTTP通信を行うための標準ライブラリ(フレームワークのようなもの)であるNet::HTTPが用意されている。  
これを使用するとHTTPリクエストとレスポンスが簡易的に実装できる。  
Net::HTTPのように外部ファイルを読み込む際は「require」を使用する。外部モジュールについても同様。  

例文）  
```  
require 'net/http'
require 'uri'

uri = URI.parse("http://www.example.com")
response = Net::HTTP.get_response(uri)

puts response.code
puts response.body  
```  
上記のコードは、URLに対してGETリクエストを送り、  
レスポンスで買ってきたhtmlを出力するコード  
[出力結果]長いので一部割愛  
```  
root@4d904ed79b93:/app$ ruby chapter10/http.rb
200
<!doctype html>
<html>
<head>
    <title>Example Domain</title>

    <meta charset="utf-8" />
</head>
<body>
<div>
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents. You may use this
    domain in literature without prior coordination or asking for permission.</p>
    <p><a href="https://www.iana.org/domains/example">More information...</a></p>
</div>
</body>
</html>
```  
上記のようにステータスコード（今回は200で正常）や  
ヘッド、ボディで構成されるhtmlを返す。  
補足）getとget_responseの違い。  
getはレスポンスのbody部分だけを取得  
get_responseはステータスコードを含め丸ごと取得


【JSON】について  
JSONはデータ交換のフォーマットの一つ。  
主にAPIなど、Webアプリにおけるデータ送受信し使われる。  

【JSON」の構造  
JSONファイルの内部はキーと値のペアや配列などで構築されている。 
例文）   
```
{
  "name": "John",
  "age": 30,
  "is_student": false,
  "courses": ["Math", "Science", "History"]
}  
```  
上記ではname,age,is_studentのキーに対する値と、  
coursesという配列で構成されている。  

【RubyでJSONを扱う】  
RubyでJSONを扱うためにライブライ("json")を使用して文字列をJSONファイルを読み込む。  
HTTPと同じくライブラリを読み込むために「require」を使用する。  
例文）  
```  
require 'json'

json_string = '{"name": "John", "age": 30, "is_student": false, "courses": ["Math", "Science", "History"]}'
data = JSON.parse(json_string)

puts data["name"]
puts data["age"]
puts data["is_student"]
puts data["courses"]
```  
上記では、ライブラリを読み込み、JSONファイルの内容を変数に格納、  
その後変数を"JSON.pare"メソッドでRuby用に再編成してdataという変数に格納した。