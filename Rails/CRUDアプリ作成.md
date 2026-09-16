CRUDアプリ作成

【CRUDとは】  
Create（作成）、Read（読み取り）、Update（更新）、Delete（削除）機能を持ったアプリ  

【ログ解析】  
```  
Started GET "/users" for 172.21.0.1 at 2026-09-16 17:06:50 +0900
``` 
Get形式で/usersにリクエストを渡している。  
```  
Processing by UsersController#index as HTML
```
ルーティングからコントローラーへ指示が出される。  
```  
def index
  @users = User.all
end  
```
コントローラーでは上記のアクションが実行されている。  
上記はDBのusersテーブルの内容を全件取得し、@usersという変数に格納している。  
```  
<% @users.each do |user| %>
  <%= render user %>
<% end %>
``` 
ビューはコントローラーで作成された、@usersをeachで次々表示している。  
renderは「どのビューテンプレートを表示するか（HTMLなどを生成してレスポンスとして返すか）」を指定するメソッド  
render user は、次のパーシャルを自動的に呼び出します。  
次のパーシャルとはapp/views/users/_user.html.erbのこと。  
補足）  
パーシャルとは、  
_user.html.erb のように 先頭にアンダースコア（ _ ） の付いた 再利用可能な部分テンプレート。  
renderを使用すると、userではなく頭にアンダースコアがついたものになる。  