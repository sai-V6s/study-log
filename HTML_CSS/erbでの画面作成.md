erbファイルでhtml、コントローラを記述する際のノート  


【form_with】view  
Railsでフォームを簡単に作成するヘルパーメソッド  
@でモデルを指定すると、そのモデルの状態(新規or既存)に基づいて、  
適切なリクエスト先とHTTPメソッドを選択してくれる。 
モデルではなく直接パスを指定することも可能 
```<%= form_with model: @user do |f| %>```
```<%= form_with url: "/quizzes/answer", data: { turbo: false } do |form| %> <%# ルートで指定したアクションにフォームを飛ばしている %>```

【redirect_to】controller  
指定のURLにリダイレクトするメソッド  
通常ではアクション完了後にユーザーを次のページに遷移させる場合に用いられる。  
例  
```#次の問題に進むアクション
    def next
        session[:answered] = false#次の問題に進むため、回答済みフラグをoffにする
        session[:question_number] += 1 #セッションに保存されている問題番号をインクリメント
        @question_number = session[:question_number] #インクリメントした値をインスタンス変数に格納
        
        redirect_to reverses_path#次の出題ページに遷移する
    end
```  
補足status: :see_otherについて)
Railsのredirect_toメソッドでstatus: :see_otherを指定すると、  
POSTリクエスト後の新しいページへのGETリクエスト移動が促され、フォームの再送信を防いでくれる。

【render】controller  
現在のwebページを更新するためのメソッド  
例  
```
# 正誤判定を行うアクション
    def answer
    unless session[:answered] == true#回答済みフラグがon(true)でないならば↓を実行
        session[:results] ||= [] #回答結果を格納する配列が未作成の場合のみ、空配列で初期化する
        @correct = params[:answer_id].to_i == session[:correct_id] # セッションに保存していた正解と回答のIDを比較
        @term = Term.find(session[:correct_id])#問題文も表示させなおす必要があるため、セッションのidからレコードを特定している
        @choices = session[:choices_ids].map {|choice| Term.find(choice)}#セッションに保存されたIDからmapメソッドでDBを探索して問題順通りにそれぞれのTermを取得しています。
        @question_number = session[:question_number]

        #結果画面に正解不正解、選択肢、解答を表示させるために各情報を配列に詰めている
        session[:results]<<{
            correct_id:session[:correct_id], #正解となる選択肢のID
            answer_id:params[:answer_id].to_i, #ユーザーが選んだ回答のID
            correct:@correct, #正解/不正解の結果
            choices_ids:session[:choices_ids]
        }

        session[:answered] = true#回答済みフラグをonにする
        render :index
```
  
【link_to】view  
HTMLのaタグを生成する。  
これによりページからページへの遷移が行える。  
例)
```
<div class="button-area">
<%= link_to terms_path do %>
    <%= image_tag "button_01.png", class: "menu-button" %>
<% end %>
</div>
```