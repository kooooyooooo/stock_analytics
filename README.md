# 株式分析

株式市場分析のためのデータ分析・機械学習プロジェクト

## 環境構築

### 前提条件
- Python 3.10.13
- Docker と Docker Compose（オプション）

### ローカル開発環境のセットアップ

#### 1. 仮想環境セットアップ
```bash
# 仮想環境の作成
make venv

# 全ての依存関係をインストール（本番用 + 開発用）
make install-dev

# または本番用依存関係のみをインストール
make install
```

#### 2. Docker開発環境（代替手段）
```bash
# 全ての依存関係を含む開発環境を起動
docker-compose up
```

### 開発コマンド

#### コード品質
```bash
make fmt      # black と isort でコードをフォーマット
make lint     # ruff と flake8 でコードをチェック
make type     # mypy で型チェック
```

#### テスト
```bash
make test     # pytest でテストを実行（高速、fail-fast）
make cov      # カバレッジレポート付きでテストを実行
```

#### ノートブック管理
```bash
make nbstrip  # ノートブックの出力を削除し、Gitフックをインストール
```

#### クリーンアップ
```bash
make clean    # キャッシュディレクトリと一時ファイルを削除
```

## プロジェクト構造

```
├── src/                    # メインのPythonパッケージ
│   └── data/              # データ読み込み・前処理ユーティリティ
├── config/
│   └── default.yaml       # 設定ファイル
├── data/
│   └── raw/               # 生データファイル（gitignored）
├── models/                # 保存されたモデルファイル（gitignored）
├── notebooks/             # Jupyterノートブック
├── requirements.txt       # 本番用依存関係
└── requirements-dev.txt   # 開発用依存関係
```

## 設定

プロジェクトでは `config/default.yaml` のYAMLベース設定を使用します：
- ランダムシード と実験名
- データファイルパス と 訓練/検証データの分割
- モデル選択 と ハイパーパラメータ

## 依存関係

- **データ・機械学習**: pandas, numpy, scikit-learn, lightgbm, xgboost
- **可視化**: matplotlib, seaborn, plotly
- **ML Ops**: mlflow, optuna
- **開発**: black, ruff, pytest, mypy, jupyter
