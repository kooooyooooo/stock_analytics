# データ分析・機械学習用 テンプレートリポジトリ要件定義

## 1. 目的
- データ分析・機械学習プロジェクトを迅速かつ再現性高く立ち上げるためのテンプレートを提供する。
- 実務用を想定し、再利用性・拡張性・チーム開発での標準化を重視する。

---

## 2. 想定利用シーン
- 社内/個人プロジェクトの初期立ち上げ
- KaggleやPoCでのベースライン構築
- 実務での再現性確保とチーム開発効率化

---

## 3. ディレクトリ構成案
'''
.
├── README.md
├── LICENSE
├── .gitignore
├── pyproject.toml / setup.cfg / requirements.txt
├── .python-version # pyenvでのPythonバージョン固定
├── Dockerfile
├── docker-compose.yml # 任意
├── Makefile
├── notebooks/
├── src/
│ ├── data/ # データ読み込み・前処理
│ ├── features/ # 特徴量エンジニアリング
│ ├── models/ # 学習・予測・評価
│ ├── utils/ # 共通ユーティリティ
│ └── visualization/ # 可視化処理
├── tests/ # pytestによるユニットテスト
├── config/ # 設定ファイル (YAML/JSON等)
├── data/
│ ├── raw/ # 生データ (git管理外)
│ ├── processed/ # 前処理後データ
│ └── external/ # 外部提供データ
└── models/ # 学習済みモデル (git管理外)
'''


---

## 4. 機能要件

### データ処理
- CSV, Parquet, SQL などからの読み込み関数
- 欠損値処理、外れ値処理、スケーリング、正規化
- 訓練/検証/テスト分割 (ランダム, 時系列, K-fold)

### 特徴量エンジニアリング
- カテゴリ変換（ラベル/ワンホット）
- 数値変換・標準化
- 時系列特徴量生成 (lag, rolling, shift)
- 地理座標や日付処理の共通関数

### モデリング
- scikit-learnベースライン（分類・回帰）
- LightGBM / XGBoost のテンプレ
- Optunaによるハイパーパラメータ最適化
- クロスバリデーション・評価指標 (RMSE, AUC, MAE, logloss等)

### 可視化
- matplotlib / seaborn / plotly を使った共通関数
- 分布図, 相関行列, 時系列プロット, モデル評価可視化

### 実験管理
- MLflow または wandb の統合
- ローカル保存用の簡易ロガー
- 設定ファイルから再現性ある実行制御

---

## 5. 非機能要件

### 環境管理
- **pyenv**: Pythonバージョン管理
- **仮想環境**: venv または poetry
- **Docker**: 開発環境の統一・再現性確保
- **Makefile**: 環境構築・実行・テストを一括管理

### コーディング規約
- black / isort / flake8 による自動整形
- pre-commit フックによるコミット時チェック
- nbstripout によるNotebook出力削除

### テスト・CI/CD
- pytest によるユニットテスト
- GitHub Actions による lint, test, notebook 実行確認
- Pull Request 単位でのレビュー・自動検証

### バージョン管理
- GitHub Flowを基本とした運用
- Issue/PRテンプレート整備
- Notebookは出力除去後に管理
- 大容量ファイルは Git LFS または外部ストレージ管理

---

## 6. マイルストーン

| フェーズ | 実装内容 |
|----------|-----------------------------|
| フェーズ0 | 環境構築（pyenv, venv/poetry, Docker, Makefile） |
| フェーズ1 | データ入出力・前処理モジュール作成 |
| フェーズ2 | 特徴量エンジニアリング・モデル基盤作成 |
| フェーズ3 | 可視化・実験ログ管理統合 |
| フェーズ4 | CI/CD, lint, pre-commit, ドキュメント整備 |
| フェーズ5 | 拡張（パイプライン, API化, DVCなど） |

---
