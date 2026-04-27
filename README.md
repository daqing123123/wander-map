# 🗺️ 美食美景取景地地图

一个匿名协作的地图标注网站——在地图上分享美食、美景、取景地。

> 灵感来自 Anitabi，加入了美食和美景打卡。

---

## 🚀 快速部署（3 步搞定）

### 第 1 步：创建 Supabase 后端（2 分钟）

1. 打开 [supabase.com](https://supabase.com) → 注册/登录（GitHub 一键登录）
2. 点击 **New project** → 填项目名 `wander-map` → 设置数据库密码 → **Create project**
3. 等待数据库创建完成（约 1 分钟）
4. 进入 **SQL Editor** → 点击 **New query**
5. 复制 `schema.sql` 的全部内容，粘贴进去 → **Run**
6. 进入 **Storage** → **New bucket** → 名称填 `pin-images` → 勾选 **Public bucket** → 创建
7. 点击刚创建的 `pin-images` → **Policies** → 添加两条策略：
   - `SELECT` 策略：允许所有人（`true`）
   - `INSERT` 策略：允许所有人（`true`）
8. 进入 **Settings** → **API** → 复制两个值：
   - `Project URL`（例如 `https://xxxxx.supabase.co`）
   - `anon` / `public` key

### 第 2 步：配置前端（30 秒）

打开 `index.html`，找到最底部的这两行：

```js
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

替换为你在第 1 步复制的那两个值。

### 第 3 步：部署到 Vercel（1 分钟）

1. 打开 [vercel.com](https://vercel.com) → 注册/登录（GitHub）
2. 点击 **Add New** → **Project**
3. 导入你的 GitHub 仓库（或直接拖拽 `wander-map` 文件夹）
4. 点击 **Deploy** → 等 30 秒搞定 🎉

部署完成后你会得到一个 `https://xxx.vercel.app` 的公网地址，发给别人就能访问了！

---

## 🎨 功能

| 功能 | 说明 |
|------|------|
| 🍜 美食 | 在地图上标记美食打卡点 |
| 🏔️ 美景 | 分享风景优美的打卡点 |
| 🎬 取景地 | 影视/动漫取景地巡礼 |
| 📷 图片 | 每个地标支持上传照片 |
| 🔍 筛选 | 按类别筛选地图上的地标 |
| 🔓 匿名 | 无需注册登录，打开就能用 |

## 🛠 技术栈

- **前端**：原生 HTML/CSS/JS + Leaflet.js 地图
- **后端**：Supabase（PostgreSQL + 对象存储）
- **部署**：Vercel（免费）

## 📁 项目结构

```
wander-map/
├── index.html     # 完整单页应用
├── schema.sql     # 数据库建表脚本
└── README.md      # 本文档
```
