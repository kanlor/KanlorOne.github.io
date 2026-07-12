# KanlorOne 软件系列展示站

面向 GitHub Pages / Cloudflare Pages 的纯静态官网，介绍 KanlorOne 系列软件。
零构建、零依赖运行时，所有产品数据由 `data/products.json` 单一文件驱动。

## 本地预览

由于使用 `fetch` 加载数据，需通过 HTTP 服务预览（不能直接双击打开 `index.html`）：

```bash
python -m http.server 8000
# 或
npx serve .
```

浏览器打开 `http://localhost:8000/`。

## 部署

### GitHub Pages（已配置）
直接 push 到 `main` 分支，`.github/workflows/static.yml` 会自动部署。

### Cloudflare Pages
- 构建命令：留空
- 输出目录：`/`（仓库根）
- 连接 GitHub 仓库后推送即部署

## ★ 增删改产品（核心维护流程）

所有产品信息集中在 **`data/products.json`** 单一文件。编辑后保存、提交、推送，站点会自动更新。**无需触碰任何 HTML/CSS/JS 代码。**

### 新增产品
在 `products` 数组中追加一个对象：

```jsonc
{
  "id": "my-new-tool",                 // 唯一标识，kebab-case，用于 URL
  "name": "KanlorOne NewTool",
  "tagline": "一句话简介",
  "description": "详细描述……",
  "logo": "logo/your-logo.png",        // 把 logo 文件放到 logo/ 目录
  "status": "active",                  // active | archived
  "currentVersion": "1.0.0",
  "releaseDate": "2026-08-01",
  "platforms": ["Windows"],
  "tags": ["文档处理", "办公效率"],
  "highlights": ["亮点1", "亮点2"],
  "downloads": [
    { "source": "微云", "url": "https://...", "label": "推荐" }
  ],
  "features": [
    {
      "group": "功能分组名",
      "items": [
        { "name": "功能名", "desc": "描述", "tags": ["免费"], "icon": "list" }
      ]
    }
  ],
  "versions": [
    { "version": "1.0.0", "date": "2026-08-01", "type": "feature", "notes": ["首次发布"] }
  ]
}
```

### 删除产品
从 `products` 数组中移除对应对象即可。

### 修改产品
直接编辑对应字段。常用操作：
- **发布新版本**：在 `versions` 数组开头插入新版本对象，并更新 `currentVersion` 与 `releaseDate`
- **更新下载链接**：修改 `downloads` 数组
- **新增功能**：在对应 `features[].items` 中追加
- **归档产品**：将 `status` 改为 `archived`

### 字段速查

| 字段 | 说明 |
|------|------|
| `products[].tags` | 产品分类标签数组（如 `["文档处理","办公效率"]`），用于产品页筛选 |
| `features[].items[].tags` | 功能标签，可选值：`免费` / `注册` / `新增` / `样式优先` / `需 Word`（自动配色） |
| `icon` | [Lucide 图标名](https://lucide.dev/icons)（如 `list`、`search`、`download`） |
| `versions[].type` | `feature` / `fix` / `improvement` |
| `status` | `active`（活跃）/ `archived`（归档） |

## 页面结构

三个页签，简洁直观：

| 页签 | 路由 | 内容 |
|------|------|------|
| 首页 | `#/` | 品牌简介 + 各产品最新版本/发布时间/下载/详情入口 |
| 产品 | `#/products` | 按标签切换产品，每个产品含：是什么、为什么用、核心功能、下载 |
| 联系 | `#/contact` | 联系方式（微信/邮箱/仓库/官网）+ 关于 KanlorOne |

点击首页"详情"按钮可直达对应产品标签：`#/products/:id`

## 项目结构

```
├── index.html              # 入口
├── css/style.css           # 设计系统
├── js/
│   ├── app.js              # 入口逻辑
│   ├── router.js           # hash 路由
│   ├── store.js            # 数据加载
│   ├── utils.js            # 渲染辅助
│   └── render/             # 各页面渲染（home / products / contact）
├── data/products.json      # ★ 唯一数据源
├── logo/                   # 品牌与产品 logo
└── .github/workflows/      # GitHub Pages 部署
```

## 技术栈

原生 HTML5 + CSS3 + ES6 模块化 JS。无构建步骤、无框架运行时。
字体：Fraunces / Manrope / JetBrains Mono（Google Fonts CDN）。
图标：Lucide Icons（CDN）。
