# g4211 APTリポジトリ

Ubuntu向けのパッケージを配布するAPTリポジトリです。

## 提供パッケージ

| パッケージ名 | 説明 |
|---|---|
| smb-conf-editor | Samba設定エディター - GUIでsmb.confを編集 |

## インストール方法

### ワンライナー（推奨）

```bash
curl -fsSL https://g4211.github.io/apt-repo/install.sh | bash
```

### 手動セットアップ

```bash
# 1. GPG公開鍵のインストール
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://g4211.github.io/apt-repo/KEY.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/g4211-apt-repo.gpg

# 2. APTソースリストの追加
echo "deb [signed-by=/etc/apt/keyrings/g4211-apt-repo.gpg] https://g4211.github.io/apt-repo ./" | sudo tee /etc/apt/sources.list.d/g4211-apt-repo.list

# 3. パッケージリストの更新とインストール
sudo apt update
sudo apt install smb-conf-editor
```

## リポジトリの削除

```bash
sudo rm /etc/apt/keyrings/g4211-apt-repo.gpg /etc/apt/sources.list.d/g4211-apt-repo.list
sudo apt update
```
