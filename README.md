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

## デバッグで確認する

このリポジトリを VS Code で開いて F5 を押すと、Extension Development Host として別の VS Code ウィンドウが起動します。

そのデバッグ用 VS Code では、このリポジトリの `package.json` にある `contributes.themes` が拡張機能の定義として読み込まれます。つまり、VSIX としてインストールしなくても、`package.json` に登録したテーマを `Preferences: Color Theme` から選択できます。

テーマを調整中に見た目を確認したい場合は F5 起動、普段使いとして別プロジェクトでも使いたい場合は VSIX インストール、という使い分けにします。

## テーマを追加する

1. `themes/` にテーマ JSON ファイルを追加します。
2. `package.json` の `contributes.themes` にテーマを登録します。
3. F5 で Extension Development Host を起動し、`Preferences: Color Theme` から追加したテーマを選んで確認します。
4. 普段使いする場合は `npm run install:local` を実行して VS Code にインストールします。

## Codex でスクリーンショット証跡を取る

Codex にテーマの見た目確認を依頼するときは、`prompts/capture-theme-screenshots.md` の内容を参考にします。

例:

```text
10パターンぐらいテーマを作成したあとで、prompts/capture-theme-screenshots.md の内容を参考に、それぞれスクショの証跡をください。
```

## ディレクトリ構成

```text
.
├── package.json
├── themes/
│   └── *-color-theme.json
├── prompts/
│   └── capture-theme-screenshots.md
├── .vscode/
│   └── launch.json
└── scripts/
    └── install-local.ps1
```

## 運用メモ

- テーマ JSON は 1 ファイル 1 テーマで管理します。
- 大きく方向性が違うテーマは、別ファイルとして追加します。
- `prompts/` にはテーマごとの生成プロンプトではなく、Codex に作業を依頼するための運用プロンプトを置きます。
- 普段使いする場合は、VSIX としてインストールしておくと、どの VS Code ワークスペースからでも選べます。
