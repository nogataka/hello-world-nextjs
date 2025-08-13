# hello-world-nextjs プロジェクト概要

## プロジェクトの目的と概要

このプロジェクトは、**Kinsta**が提供するNext.jsを使用した静的サイトのデモ・テンプレートプロジェクトです。Kinstaのホスティングサービス（Static Site HostingとApplication Hosting）での展開方法を示すサンプルアプリケーションとして設計されています。

### 基本情報
- **プロジェクト名**: hello-world-nextjs
- **バージョン**: 0.1.0
- **Next.jsバージョン**: 13.5.5
- **Reactバージョン**: 18
- **アーキテクチャ**: Next.js App Router
- **出力形式**: 静的サイト（Static Export）

## 技術スタック

### フロントエンド
- **Next.js 13.5.5**: React フレームワーク
- **React 18**: UIライブラリ
- **App Router**: Next.js 13の新しいルーティングシステム

### スタイリング
- **Tailwind CSS**: ユーティリティファーストのCSSフレームワーク
- **PostCSS**: CSS処理ツール
- **Autoprefixer**: ベンダープレフィックス自動付与

### 開発・ビルドツール
- **serve**: 静的ファイル配信用パッケージ
- **Docker**: コンテナ化対応

## プロジェクト構造

```
hello-world-nextjs/
├── src/
│   └── app/                    # App Router ディレクトリ
│       ├── favicon.ico         # ファビコン
│       ├── globals.css         # グローバルスタイル
│       ├── layout.js          # ルートレイアウト
│       └── page.js            # メインページ
├── public/                     # 静的アセット
│   ├── next.svg               # Next.jsロゴ
│   └── vercel.svg             # Vercelロゴ
├── Dockerfile                  # Docker設定
├── captain-definition          # CapRover展開設定
├── next.config.js             # Next.js設定
├── package.json               # 依存関係とスクリプト
├── tailwind.config.js         # Tailwind CSS設定
├── postcss.config.js          # PostCSS設定
└── jsconfig.json              # JavaScript設定
```

## Next.js 13.5.5 設定と静的エクスポート

### 静的エクスポート設定
プロジェクトは`next.config.js`で静的エクスポートが有効化されています：

```javascript
const nextConfig = {
    'output': 'export'
}
```

この設定により、`npm run build`実行時に静的HTMLファイルが`out`ディレクトリに生成されます。

### App Router アーキテクチャ
Next.js 13の新しいApp Routerパターンを採用：
- `src/app`ディレクトリベースのルーティング
- ファイルベースルーティングシステム
- レイアウトとページの分離

## 展開オプション

### 1. Kinsta Static Site Hosting
- **ビルドコマンド**: `npm run build`
- **Node.jsバージョン**: 16.20.0
- **公開ディレクトリ**: `out`
- **特徴**: 無料で最大100サイトまでホスティング可能

### 2. Kinsta Application Hosting
- **開始コマンド**: `npm start`
- **ポート**: 自動設定（環境変数`PORT`を使用）
- **プロセス**: `serve -s out -l 3000`で静的ファイルを配信

### 3. Docker コンテナ展開
- マルチステージビルドを使用
- Node.js 18 Alpine ベースイメージ
- 静的ファイルのみを本番イメージにコピー
- `serve`パッケージでHTTPサーバーを起動

### 4. CapRover 展開
- `captain-definition`ファイルでDocker設定を指定
- 自動化された展開プロセス

## 開発・ビルドスクリプト

```json
{
  "scripts": {
    "dev": "next dev",           // 開発サーバー起動
    "build": "next build",       // 本番ビルド（静的ファイル生成）
    "start": "serve -s out -l 3000", // 静的ファイル配信
    "lint": "next lint"          // ESLintによるコード検査
  }
}
```

## 主な特徴

### 1. 静的サイト生成に特化
- 完全な静的HTML生成
- CDN配信に最適化
- 高速なページロード

### 2. モダンなNext.js実装
- App Routerパターン
- React 18の最新機能
- TypeScript対応準備済み（jsconfig.json）

### 3. レスポンシブデザイン
- Tailwind CSSによるユーティリティファーストアプローチ
- ダークモード・ライトモード対応
- モバイルファーストデザイン

### 4. 展開の柔軟性
- 複数のホスティングオプション対応
- Docker化による環境の一貫性
- 自動化された展開プロセス

## 依存関係

### 本番依存関係
- `next`: 13.5.5 - React フレームワーク
- `react`: ^18 - UIライブラリ
- `react-dom`: ^18 - React DOM レンダリング
- `serve`: ^14.2.1 - 静的ファイル配信サーバー

### 開発依存関係
- `autoprefixer`: ^10 - CSS ベンダープレフィックス
- `postcss`: ^8 - CSS 処理ツール
- `tailwindcss`: ^3 - ユーティリティファーストCSS

このプロジェクトは、Next.jsを使用した静的サイト開発のベストプラクティスを示すとともに、Kinstaのホスティングサービスでの展開方法を学習するための優れたサンプルとなっています。
