---
description: プロジェクトの基本情報を収集し、一般情報ファイルを作成するためのルール
globs: 
alwaysApply: true
---
# Rules Setup

このルールはプロジェクトの基本情報を収集し、`001_project_general.mdc`ファイルを作成するためのルールです。

## プロセス

1. まず`.cursorignore`ファイルを作成し、プロジェクトタイプに応じて適切な除外パターンを設定します
   - npmプロジェクトの場合: `node_modules/`, `dist/`, `build/`, `.next/`, `coverage/`など
   - Unityプロジェクトの場合: `Library/`, `Temp/`, `Obj/`, `Logs/`, `UserSettings/`など
   - プロジェクトタイプは`package.json`の有無やその他の特徴ファイルで判断します

2. `package.json`を読み込み、プロジェクトの依存関係や基本情報を収集します

3. `README.md`（または同等のドキュメント）を読み込み、プロジェクトの概要や構造に関する情報を収集します

4. 収集した情報を基に`001_project_general.mdc`ファイルを作成または更新します

5. 初期セットアップが完了したら、このファイル（`000_rules_setup.md`）の`alwaysApply: true`を`false`に変更するか、このファイルを削除してください。これにより、セットアップが繰り返し実行されるのを防ぎます。

## 001_project_generalの内容構成

`001_project_general.mdc`には以下の情報を含めます：

```markdown
---
description: プロジェクトの一般情報と構造
globs: "*"
alwaysApply: true
---
# General Rule
ユーザーの指示がきたらまずこのRuleを読み、指示内容に応じて他のRulesを読んでください。

## プロジェクト概要
- [package.jsonとREADMEから抽出したプロジェクトの説明]

## 主要な技術スタック
- [package.jsonから抽出した主要な依存関係とバージョン]

## ディレクトリ構成
```
[プロジェクトの主要なディレクトリ構造]
```
```

## .cursorignoreの例

### npmプロジェクト用
```
node_modules/
dist/
build/
.next/
coverage/
.env
.env.local
```

### Unityプロジェクト用
```
Library/
Temp/
Obj/
Logs/
UserSettings/
*.csproj
*.unityproj
*.sln
*.suo
*.tmp
*.user
*.userprefs
*.pidb
*.booproj
```

## 注意事項

- このルールは初期セットアップ用です。セットアップが完了したら`alwaysApply: true`を`false`に変更してください。
- プロジェクト固有の追加情報が必要な場合は、`001_project_general.mdc`に直接追記することも可能です。