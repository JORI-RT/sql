# EAV
```sql
select * from issueattributes i 
where attr_name = 'date_reported'
```

## デメリット
* クエリが複雑になる
* 制約がかけられない

## 使ってもいいケース
あんまりない　key valueを使えばいい

## 代替の解決策
### シングルテーブル継承
全部の属性を1つのテーブルの属性として定義して、サブタイプを示すマーカー列を作る　NULLが多くなる

### 具象テーブル継承
共通絡むを用意して、サブタイプテーブルを複数作る　デメリットとして共通部分の修正が大きくなる（dry違反）

### クラステーブル継承
共通のカラムをつくって、サブタイプごとに外部キーをつくってつなげる

### 反構造化系をつかう（json）とか





## ready.sqlを流す
```sql
CREATE TABLE Issues ( issue_id SERIAL PRIMARY KEY );
INSERT INTO Issues (issue_id) VALUES (1234);
CREATE TABLE IssueAttributes (
issue_id BIGINT UNSIGNED NOT NULL,
attr_name VARCHAR(100) NOT NULL,
attr_value VARCHAR(100),
PRIMARY KEY (issue_id, attr_name),
FOREIGN KEY (issue_id) REFERENCES Issues(issue_id) );
INSERT INTO IssueAttributes (issue_id, attr_name, attr_value) 
VALUES 
(1234, 'product', '1'),
(1234, 'date_reported', '2009-06-01'),
(1234, 'status', 'NEW'),
(1234, 'description', ' 保存処理に失敗する '),
(1234, 'reported_by', 'Bill'),
(1234, 'version_affected', '1.0'),
(1234, 'severity', ' 機能の損失 '),
(1234, 'priority', 'HIGH');

```





