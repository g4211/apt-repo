#!/bin/bash
# =============================================================================
# smb-conf-editor APTリポジトリ追加スクリプト
# このスクリプトを実行すると、APTリポジトリが追加され、
# apt install でsmb-conf-editorをインストールできるようになります
# =============================================================================

set -e

REPO_URL="https://g4211.github.io/apt-repo"
KEYRING_PATH="/etc/apt/keyrings/g4211-apt-repo.gpg"
LIST_PATH="/etc/apt/sources.list.d/g4211-apt-repo.list"

echo "=== smb-conf-editor APTリポジトリの追加 ==="

# キーリングディレクトリの作成
sudo mkdir -p /etc/apt/keyrings

# GPG公開鍵のダウンロードとインストール
echo "GPG公開鍵をインストール中..."
curl -fsSL "${REPO_URL}/KEY.gpg" | sudo gpg --dearmor -o "$KEYRING_PATH"

# APTソースリストの作成
echo "APTソースリストを作成中..."
echo "deb [signed-by=${KEYRING_PATH}] ${REPO_URL} ./" | sudo tee "$LIST_PATH" > /dev/null

# パッケージリストの更新
echo "パッケージリストを更新中..."
sudo apt update

echo ""
echo "=== セットアップ完了！ ==="
echo "以下のコマンドでインストールできます:"
echo "  sudo apt install smb-conf-editor"
echo ""
echo "アンインストール:"
echo "  sudo apt remove smb-conf-editor"
echo ""
echo "リポジトリの削除:"
echo "  sudo rm $KEYRING_PATH $LIST_PATH"
echo "  sudo apt update"
