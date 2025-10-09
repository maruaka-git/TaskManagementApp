# タスク管理アプリ

## 概要

『タスク管理アプリ』は、1人で約1ヶ月間かけて制作したiOSアプリです。
Swiftの勉強目的で制作し、シンプルで日常的に使いやすいアプリを意識しました。

主な特徴は以下の通りです：
タスクをフォルダごとに管理可能
タスクの検索が可能
達成したタスクの数に応じて画面に変化がある業績可視化機能あり

---

## 企画背景

- Swiftという言語に触れたことがなかった
- MacとiPhoneを使用している自身の環境を活かした開発がしたかった

---

## 『タスク管理アプリ』の機能

- タスク追加（フォルダ作成後、各フォルダにタスクを登録）
- タスク検索
- 業績の可視化（達成したタスク数に応じて画面演出が変化）

---

 ## 工夫した点
- 操作がわかりやすいシンプルな画面設計
- 使いやすさを重視したUI/UX
- 毎日使うことを想定し、余計な機能はなるべく排除
- タスク達成時に達成感を得られるようにし、継続を支援

---

## 使用した技術

- Swift
- SwiftUI
- SpriteKit
- Foundation
- CoreData

---

## 実際のアプリ画面

<table>
    <tr>
        <td align="center">
            <strong>タイトル画面</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/288f65d9-62a9-4a95-ad73-420b73d23ce6" width="80%" />
        </td>
        <td align="center">
            <strong>フォルダ一覧画面</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/ef8d0c63-cea1-4ac3-bf43-6d163ba83245" width="80%" />
        </td> 
        <td align="center">
            <strong>タスク一覧画面</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/62a52225-f521-4a1e-a529-0f1a1125c54f" width="80%" />
        </td> 
    </tr>
    <tr>
        <td align="center">
            <strong>検索画面</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/d9cb115c-7596-4a14-8bff-0d9d5af403ab" width="80%" />
        </td>
        <td align="center">
            <strong>業績画面</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/17e76c5c-77ac-426d-81f7-06c2156160c1" width="80%" />
        </td>
    </tr>
</table>
    
<table>
    <tr>
        <td align="center">
            <strong>フォルダ、タスクの登録</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/678a4104-93b4-4a06-bd46-8521bd843079" width="80%" />
        </td>
        <td align="center">
            <strong>タスクの達成</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/37539ccd-1d3d-419b-9d3f-62833ae0cd16" width="80%" />
        </td>
        <td align="center">
            <strong>タスクの検索</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/3f6fb2b7-a915-4c3d-a63d-1300ce4a5978" width="80%" />
        </td>
        <td align="center">
            <strong>達成タスク数に応じた数のボールが落ちてくる</strong><br>
            <hr style="border: 0; border-top: 2px solid #ccc; width: 80%;">
            <img src="https://github.com/user-attachments/assets/ff1544f3-a614-44c7-8e95-8a31711feee7" width="80%" />
        </td>
    </tr>
</table>

---

## フォルダ構成

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

## めも
Jsonで保存してること
画面レイアウト
