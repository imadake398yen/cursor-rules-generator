# Cursor Rules Generator

このリポジトリは、既存のプロジェクトにCursor Rulesを導入し、Cursor IDEのAIエージェントに自動的にルールを生成・管理させるためのツールセットです。

## 前提条件

- **Cursor Pro**: このプロジェクトはCursor Proに課金していることを前提としています
- **Auto-run mode**: Cursor Settingsで「Enable auto-run mode」を有効にしていることが必要です

## 特徴

- **AIによるルール生成**: CursorのAIエージェントがルールファイルを作成・編集します
- **自己文書化**: AIエージェントが自身の使い方を説明するルールを書きます
- **ワークフロー自動化**: ルール変換スクリプトが`.md`ファイルを正式な`.mdc`形式に変換します

## 使い方

1. このリポジトリをクローンする:
   ```bash
   git clone https://github.com/yourusername/cursor-rules.git
   cd cursor-rules
   ```

2. Cursor IDEでプロジェクトを開く

3. AIエージェントにルール作成を依頼する:
   ```
   .cursor/rules_md/ディレクトリに新しいルールファイルを作成してください
   ```

4. ルール編集が完了したら、変換スクリプトを実行:
   ```bash
   ./.cursor/scripts/md_to_mdc.sh
   ```

## ワークフロー

1. AIエージェントは`.cursor/rules_md/`ディレクトリに`.md`形式でルールファイルを作成
2. ユーザーがスクリプトを実行し、ルールファイルを`.mdc`形式に変換
3. 変換されたルールがCursor IDEで自動的に読み込まれる

## 注意事項

- AIエージェントは直接`.mdc`ファイルを編集できないため、このワークフローを使用します
- 常に`.cursor/rules_md/`ディレクトリのファイルを編集元としてください
- 直接`.cursor/rules/`ディレクトリのファイルを編集しないでください 