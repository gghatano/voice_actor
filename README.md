声優データベースをスクレイピング
===

## 目的

声優データベースからデータを抜いてcsvにします. 
http://lain.gr.jp/voicedb/profile/list/cid/1


## 進捗
名前;variable;value という形でデータを作りました

所属事務所データテーブル作りたい

## 内容

- va_list.txt 
  各声優さんのプロフィールページへのリンク
  3771人います

- ./download.bash
  声優さんデータページ.htmlをresult/にダウンロードします

- ./makeProfileDB.bash 
  プロフィールを作ります. 

- va_data.txt 
  集計結果です. 

- va_twitter.txt 
  名前とTwitterアカウント対応


## 雑感

共演者項目はあったりなかったりする. 共演回数は取得できる. 

所属事務所情報を別ルートからゲットしたい



