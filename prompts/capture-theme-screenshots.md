# テーマのスクリーンショット証跡を Codex に依頼するためのプロンプト

このリポジトリで複数の VS Code テーマを作成・調整したあと、Codex にスクリーンショット証跡を依頼するときの手順です。

## 依頼例

```text
作成済みのテーマについて、以下の手順を参考にスクリーンショットの証跡をください。

- prompts/capture-theme-screenshots.md の内容に従ってください
- 対象は package.json の contributes.themes に登録されているテーマです
- 各テーマごとに、テーマ名が分かるファイル名でスクリーンショットを保存してください
- 可能なら JSON / TypeScript / Markdown など複数の構文が見える状態で撮ってください
- 作業用の一時ファイルや一時設定を作った場合は、最後に削除してください
- リポジトリに不要な変更を残さないでください
```

10パターン程度のテーマをまとめて確認したい場合は、次のように依頼します。

```text
10パターンぐらいテーマを作成したあとで、prompts/capture-theme-screenshots.md の内容を参考に、それぞれスクショの証跡をください。
```

## Codex に期待する作業

1. `package.json` の `contributes.themes` を読み、確認対象のテーマ名を把握する。
2. VS Code の Extension Development Host を使える場合は、F5 または `.vscode/launch.json` 相当の設定でデバッグ用 VS Code を起動する。
3. デバッグ用 VS Code で対象テーマを `Preferences: Color Theme` から選択する。
4. 必要に応じて一時的なプレビュー用ファイルを作成する。
5. JSON / TypeScript / Markdown など、構文ハイライトの違いが分かるファイルを開く。
6. 対象 VS Code ウィンドウを前面化し、可能なら最大化する。
7. 対象 VS Code ウィンドウのスクリーンショットを保存する。
8. 生成したスクリーンショットの保存先と、確認できた内容を報告する。
9. 一時的に作成したプレビュー用ファイル、workspace 設定、VSIX などがあれば削除する。
10. 最後に `git status` を確認し、意図しない変更が残っていないことを報告する。

## フォールバック

Extension Development Host の GUI 操作が不安定な場合は、次の方法で確認してもよいです。

1. `npm run package` で VSIX を作成する。
2. VS Code CLI で VSIX をローカルインストールする。
3. 一時的な workspace 設定で `workbench.colorTheme` に対象テーマ名を指定する。
4. プレビュー用ファイルを開いてスクリーンショットを撮る。
5. 一時的な workspace 設定、プレビュー用ファイル、生成した VSIX を削除する。

このフォールバックを使った場合は、Extension Development Host ではなく VSIX インストールで確認したことを報告してください。

## 注意点

- `prompts/` 配下のファイルは、テーマ生成プロンプトの保存場所ではなく、Codex に作業を依頼するための運用メモとして扱う。
- スクリーンショットのためだけに作成したファイルは、基本的にコミットしない。
- 既存の `.vscode/settings.json` がある場合は上書きせず、必要ならバックアップして最後に戻す。
- 既存のユーザー変更や未追跡ファイルを勝手に削除しない。
