# GO-study

このリポジトリは、Go 言語で書かれた非常にシンプルな HTTP サーバーのサンプルです。

## 概要

`main.go` は以下の動作を行います。

- ポート `8080` で HTTP サーバーを起動する。
- ルートパス `/` にアクセスがあった場合、レスポンスとして `hello world` を返す。

主要な実装ポイント:

- `http.HandleFunc("/", helloHandler)` でルーティングを設定。
- `http.ListenAndServe(":8080", nil)` でサーバーを起動。

## ファイル

- `main.go` : サーバー本体（ハンドラとサーバ起動処理）

## 実行方法

開発環境に Go がインストールされていることを前提とします。

1. そのまま実行（ビルドせずに実行）:

```bash
cd /workspaces/go/learn-go
go run main.go
```

ブラウザで `http://localhost:8080/` にアクセスすると `hello world` が表示されます。

2. ビルドして実行:

```bash
cd /workspaces/go/learn-go
go build -o server main.go
./server
```

3. curl で確認する例:

```bash
curl http://localhost:8080/
# => hello world
```

## 推奨の次のステップ

- レスポンスを JSON にする（`encoding/json` を使う）。
- ルーティングを増やす（複数エンドポイント）。
- テストを追加する（`net/http/httptest` を使用）。
- Graceful shutdown を実装してプロセス終了時に接続を待つ。

## 開発・形式チェック

- コード整形: `gofmt -w main.go` で自動整形。
- 静的解析: `go vet ./...` を推奨。
