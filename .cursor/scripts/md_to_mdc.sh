#!/bin/bash

# プロジェクトルートディレクトリへの相対パス
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

# ソースとターゲットのディレクトリパス
SOURCE_DIR="$PROJECT_ROOT/.cursor/rules_md"
TARGET_DIR="$PROJECT_ROOT/.cursor/rules"

# カラー出力用の定義
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "🔄 rules_md ディレクトリの .md ファイルを .mdc ファイルに変換します..."
echo "📁 ソースディレクトリ: $SOURCE_DIR"
echo "📁 ターゲットディレクトリ: $TARGET_DIR"
echo ""

# ソースディレクトリが存在するか確認
if [ ! -d "$SOURCE_DIR" ]; then
  echo -e "${RED}エラー: ソースディレクトリ ($SOURCE_DIR) が見つかりません。${NC}"
  exit 1
fi

# .md ファイルの数をカウント
MD_FILES=$(find "$SOURCE_DIR" -name "*.md" | wc -l)
if [ "$MD_FILES" -eq 0 ]; then
  echo -e "${YELLOW}警告: 変換する .md ファイルが見つかりませんでした。${NC}"
  exit 0
fi

echo "🔍 $MD_FILES 件の .md ファイルを処理します..."
echo ""

# ターゲットディレクトリを削除して再作成
echo -e "${BLUE}既存のターゲットディレクトリを削除します...${NC}"
rm -rf "$TARGET_DIR"
echo -e "${GREEN}ターゲットディレクトリを作成します...${NC}"
mkdir -p "$TARGET_DIR"

# ソースディレクトリからターゲットディレクトリへファイルをコピー
echo -e "${BLUE}ファイルをコピーして拡張子を変更します...${NC}"
CONVERTED=0
FAILED=0

for md_file in "$SOURCE_DIR"/*.md; do
  if [ -f "$md_file" ]; then
    # ファイル名のみを取得（パスなし、拡張子なし）
    filename=$(basename "$md_file" .md)
    
    # ターゲットファイルのパス
    mdc_file="$TARGET_DIR/${filename}.mdc"
    
    # ファイルをコピーして拡張子を変更
    cp "$md_file" "$mdc_file"
    
    if [ $? -eq 0 ]; then
      echo -e "✅ ${GREEN}変換成功:${NC} $md_file → $mdc_file"
      CONVERTED=$((CONVERTED + 1))
    else
      echo -e "❌ ${RED}変換失敗:${NC} $md_file → $mdc_file"
      FAILED=$((FAILED + 1))
    fi
  fi
done

echo ""
echo "📊 変換結果:"
echo -e "   ${GREEN}成功:${NC} $CONVERTED ファイル"
if [ "$FAILED" -gt 0 ]; then
  echo -e "   ${RED}失敗:${NC} $FAILED ファイル"
fi

echo ""
echo "🎉 処理が完了しました！"
echo "💡 変換したルールファイルは Cursor で使用できるようになりました。" 