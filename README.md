# Kaseitako VS Code Theme

AI で生成し、手元で調整しながら育てる個人用の VS Code テーマ集です。

このリポジトリは VS Code のテーマ拡張機能として構成しています。複数のテーマを `themes/` に追加し、`package.json` の `contributes.themes` に登録することで、VS Code の `Preferences: Color Theme` から切り替えられるようになります。

## セットアップ

初回のみ依存パッケージをインストールします。

```powershell
npm install
```

VSIX パッケージを作成します。

```powershell
npm run package
```

作成した VSIX をローカルの VS Code にインストールします。

```powershell
npm run install:local
```

インストール後、VS Code で `Preferences: Color Theme` を開き、`Kaseitako` のテーマを選択します。

## テーマを追加する

1. `themes/` にテーマ JSON ファイルを追加します。
2. `package.json` の `contributes.themes` にテーマを登録します。
3. `npm run install:local` を実行して VS Code に再インストールします。

テーマ生成時に使ったプロンプトは `prompts/` に残しておくと、あとから色味や方向性を調整しやすくなります。

## ディレクトリ構成

```text
.
├── package.json
├── themes/
│   └── kaseitako-quiet-night-color-theme.json
├── prompts/
│   └── kaseitako-quiet-night.md
└── scripts/
    └── install-local.ps1
```

## 運用メモ

- テーマ JSON は 1 ファイル 1 テーマで管理します。
- 大きく方向性が違うテーマは、別ファイルとして追加します。
- 生成や調整の意図は `prompts/` に Markdown で保存します。
- 普段使いする場合は、VSIX としてインストールしておくと、どの VS Code ワークスペースからでも選べます。
