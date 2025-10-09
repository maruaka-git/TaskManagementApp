# タスク管理アプリ

<h2>
  <img src="https://github.com/user-attachments/assets/579b2b99-6338-426f-82c1-8b8e98a7cbdc" alt="alt text" style="height: 1em; vertical-align: -0.5em;" />
  概要
</h2>

『タスク管理アプリ』は、1人で約1ヶ月間かけて制作したiOSアプリです。
Swiftの勉強目的で制作し、シンプルで日常的に使いやすいアプリを意識しました。

主な特徴は以下の通りです：

- タスクをフォルダごとに管理可能
- タスクの検索が可能
- 達成したタスクの数に応じて画面に変化がある業績可視化機能あり

---

<h2>
  <img src="https://github.com/user-attachments/assets/579b2b99-6338-426f-82c1-8b8e98a7cbdc" alt="alt text" style="height: 1em; vertical-align: baseline;" />
  『タスク管理アプリ』の機能
</h2>

- タスク追加（フォルダ作成後、各フォルダにタスクを登録）
- タスク検索
- 業績の可視化（達成したタスク数に応じて画面演出が変化）

---

<h2>
  <img src="https://github.com/user-attachments/assets/579b2b99-6338-426f-82c1-8b8e98a7cbdc" alt="alt text" style="height: 1em; vertical-align: baseline;" />
   工夫した点
</h2>

- 操作がわかりやすいようにシンプルな画面設計に
- 毎日使うことを想定し、余計な機能はなるべく排除
- タスク完了時に達成感を得られるようにし、継続を支援
- CoreDataを使わず、軽量なデータ管理を実現
UserDefaults に Codable 構造体をJSON形式で保存することで、複雑なデータベースを使わずにタスクやフォルダの情報を永続化。小規模アプリに適した、シンプルで高速な保存方式を採用。

---

<h2>
  <img src="https://github.com/user-attachments/assets/579b2b99-6338-426f-82c1-8b8e98a7cbdc" alt="alt text" style="height: 1em; vertical-align: baseline;" />
   使用した技術
</h2>

| 分類 | 技術名 | 用途・役割 |
|------|----------|-------------|
| 言語 | Swift | アプリ全体の開発言語 |
| フレームワーク | SwiftUI | UI構築・画面遷移の実装 |
| フレームワーク | SpriteKit | 業績画面でのアニメーション演出 |

---

<h2>
  <img src="https://github.com/user-attachments/assets/579b2b99-6338-426f-82c1-8b8e98a7cbdc" alt="alt text" style="height: 1em; vertical-align: baseline;" />
   実際のアプリ画面
</h2>

<table>
    <tr>
        <td align="center">
            <strong>タイトル画面</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/288f65d9-62a9-4a95-ad73-420b73d23ce6" width="80%" />
        </td>
        <td align="center">
            <strong>フォルダ一覧画面</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/ef8d0c63-cea1-4ac3-bf43-6d163ba83245" width="80%" />
        </td> 
        <td align="center">
            <strong>タスク一覧画面</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/62a52225-f521-4a1e-a529-0f1a1125c54f" width="80%" />
        </td> 
    </tr>
    <tr>
        <td align="center">
            <strong>検索画面</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/d9cb115c-7596-4a14-8bff-0d9d5af403ab" width="80%" />
        </td>
        <td align="center">
            <strong>業績画面</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/17e76c5c-77ac-426d-81f7-06c2156160c1" width="80%" />
        </td>
    </tr>
</table>
    
<table>
    <tr>
        <td align="center">
            <strong>フォルダ、タスクの登録</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/678a4104-93b4-4a06-bd46-8521bd843079" width="80%" />
        </td>
        <td align="center">
            <strong>タスクの達成</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/37539ccd-1d3d-419b-9d3f-62833ae0cd16" width="80%" />
        </td>
        <td align="center">
            <strong>タスクの検索</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/3f6fb2b7-a915-4c3d-a63d-1300ce4a5978" width="80%" />
        </td>
        <td align="center">
            <strong>達成タスク数に応じた数のボールが落ちてくる</strong><br>
            <hr style="border: 0; border-top: 1px solid #ddd; width: 100%;">
            <img src="https://github.com/user-attachments/assets/ff1544f3-a614-44c7-8e95-8a31711feee7" width="80%" />
        </td>
    </tr>
</table>

---

<h2>
  <img src="https://github.com/user-attachments/assets/579b2b99-6338-426f-82c1-8b8e98a7cbdc" alt="alt text" style="height: 1em; vertical-align: baseline;" />
   フォルダ構成
</h2>

```plaintext

FirstApp/
├── Assets.xcassets/
├── Preview Content/
├── FirstApp.xcdatamodeld
├── FirstAppApp.swift
├── ContentView.swift
│
├── Models/
│   ├── TaskData.swift
│   └── Models.swift
├── Views/
│   ├── AchieveBall.swift
│   ├── AchieveBallScene.swift
│   ├── Achievement.swift
│   ├── BottomTabBar.swift
│   ├── Search.swift
│   ├── Title.swift
│   ├── TodoList.swift
│   └── TodoListFolder.swift
└── Persistence/
    └── Persistence.swift

```

---
