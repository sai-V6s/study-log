SQLのINSERT、IPDATE、DELTEを学ぶ  

【INSERT】テーブルに新しいをレコードを追加する際に使用する。  
基本構造  
INSERT INTO テーブル名（列1,列2,...）VALUES（値1,値2...）;  
例文）  
`INSERT INTO account_books (inout_date, inout_type, category_id, description, amount) VALUES ('2021-01-12', 1, 3, '夕食', 2000);`  
account_booksというテーブルの各列名にvalueで指定した値が追加される。  
複数のレコードを追加する際、valueに続く値を複数記述する。  
例文）  
`INSERT INTO テーブル名 (列1, 列2, ...) VALUES (値1, 値2, ...), (値3, 値4, ...), ...;`  

【UPDATE】既存データを更新する際に使用する。WEHRE句と組み合わせることで、特定の条件に一致する行のデータを変更できる。  
基本構造  
`UPDATE テーブル名 SET 列1 = 値1, 列2 = 値2, ... WHERE 条件;`  
例文）account_booksテーブルのidが1の行の金額を変更する場合  
`UPDATE account_books SET amount = 350000 WHERE id = 1;`  
複数の列を同時に更新することもできる。  
`UPDATE テーブル名 SET 列1 = 値1, 列2 = 値2, ... WHERE 条件;`  
例文）account_booksテーブルのidが2の行の金額と説明を変更する場合  
`UPDATE account_books SET amount = 1500, description = '昼食代' WHERE id = 2;`  
WHERE句で行を条件に値を変更する。WHEREを付け忘れると、テーブル内のすべての値を変更してしまうので注意。  
基本構造  
`UPDATE テーブル名 SET 列1 = 値1, 列2 = 値2, ... WHERE 条件;`  
例文）account_booksテーブルのinout_dateが'2021-01-02'の行の金額を変更する場合  
`UPDATE account_books SET amount = 1200 WHERE inout_date = '2021-01-02';`  

【DELETE】データを削除する際に用いる。同じくWHEREで条件を指定する。  
基本構造  
`DELETE FROM テーブル名 WHERE 条件;`  
例文）  account_booksテーブルのidが3の行を削除する場合
`DELETE FROM account_books WHERE id = 3;`  
WHERE句を省略するとテーブルのすべてのデータが削除されてしまうため、注意すること。