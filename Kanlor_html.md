# KanlorOne 网站架构与设计规范

> 本文档是 KanlorOne 官网的唯一架构与维护规范，可供人类开发者或 AI 智能体直接参照执行。任何对网站结构、样式、内容的修改都必须以本文件为准。

## 一、网站概述

KanlorOne 是一个专业软件产品展示网站，采用纯前端技术栈（HTML + CSS + JavaScript），无需后端服务器即可运行，支持 GitHub Pages 静态部署。

- 线上地址：`https://kanlorone.github.io`
- 技术栈：HTML5 + 原生 CSS + Font Awesome 6.5.1 + 原生 JavaScript
- 部署方式：GitHub Actions 自动部署 main 分支

## 二、文件结构

```
KanlorOne.github.io/
├── index.html                          # 首页（产品列表、导航、联系我们）
├── manage.html                         # 产品数据管理工具（增删改查、导入导出，不部署）
├── Kanlor_html.md                      # 本文件：网站架构与设计规范
├── KanlorOne_PRODUCT_TEMPLATE.json     # 产品数据模板（可下载）
├── README.md                           # 项目说明
├── .nojekyll                           # GitHub Pages 配置（禁用 Jekyll）
├── .github/workflows/static.yml        # 自动部署配置
├── deploy.bat                          # Windows 一键部署脚本
├── products/                           # 产品统一目录（数据、详情页、图片）
│   ├── KanlorOne_WordSuite.json        # WordSuite 产品数据
│   ├── KanlorOne_WordSuite.html        # WordSuite 详情页面
│   ├── KanlorOne_WordSuite.png         # WordSuite 产品图片
│   ├── KanlorOne_Guard.json            # Guard 产品数据
│   ├── KanlorOne_Guard.html            # Guard 详情页面
│   ├── KanlorOne_Guard.png             # Guard 产品图片
│   ├── KanlorOne_HtmlAccPass.json      # HtmlAccPass 产品数据
│   ├── KanlorOne_HtmlAccPass.html      # HtmlAccPass 详情页面
│   ├── KanlorOne_HtmlAccPass.png       # HtmlAccPass 产品图片
│   ├── KanlorOne_ExcelKit.json         # ExcelKit 产品数据
│   ├── KanlorOne_ExcelKit.html         # ExcelKit 详情页面
│   ├── KanlorOne_ExcelKit.png          # ExcelKit 产品图片
│   ├── KanlorOne_PandocGUI.json        # PandocGUI 产品数据
│   ├── KanlorOne_PandocGUI.html        # PandocGUI 详情页面
│   └── KanlorOne_PandocGUI.png         # PandocGUI 产品图片
└── assets/
    ├── products.js                     # 产品数据（唯一数据源）
    ├── logo.png                        # 网站 Logo
    ├── favicon.ico                     # 网站图标
    └── wechat.png                      # 微信二维码
```

### 2.1 文件命名规范

所有产品相关文件使用统一的 `APP_NAME` 命名规则，确保 png、html、json 文件名完全一致，且存放在同一目录 `/products/` 下。

| 文件类型 | 命名规则 | 示例 |
|----------|----------|------|
| 产品数据文件 | `APP_NAME.json` | `KanlorOne_WordSuite.json` |
| 详情页面文件 | `APP_NAME.html` | `KanlorOne_WordSuite.html` |
| 产品图片文件 | `APP_NAME.png` | `KanlorOne_WordSuite.png` |

**命名一致性示例**（以 WordSuite 为例）：
```
products/
├── KanlorOne_WordSuite.json    # 产品数据
├── KanlorOne_WordSuite.html    # 详情页面
└── KanlorOne_WordSuite.png     # 产品图片
```

### 2.2 文件存放位置

| 文件类型 | 存放目录 |
|----------|----------|
| 产品数据文件（单个） | `/products/` |
| 详情页面文件 | `/products/` |
| 产品图片 | `/products/` |
| 主数据文件 | `/assets/products.js` |
| 管理工具（不部署） | `/manage.html` |

## 三、技术栈

| 技术 | 用途 | 引入方式 |
|------|------|----------|
| HTML5 | 页面结构 | - |
| 原生 CSS | 样式与布局 | 内联 `<style>`（产品详情页移除 Tailwind CDN，避免预flight reset 干扰布局计算） |
| Font Awesome 6.5.1 | 图标库 | CDN `cdnjs.cloudflare.com` |
| JavaScript (ES6+) | 交互逻辑 | 原生 JS |
| Google Fonts | 字体（Inter） | CDN |

## 四、设计规范

### 4.1 配色方案（CSS 变量）

| 颜色用途 | 颜色值 | CSS 变量 |
|----------|--------|----------|
| 品牌主色 | `#ff3b00` | `--brand` |
| 文本主色 | `#20242a` | `--ink` |
| 文本次要色 | `#667085` | `--muted` |
| 边框色 | `#e8eaed` | `--line` |
| 背景色 | `#f7f8fa` | `--bg` |

### 4.2 下载地址（统一）

**所有产品的下载地址统一为唯一微云链接**，详情页和首页均使用此地址：

```
https://share.weiyun.com/d56f8rp2
```

- 平台标识：`Windows 64位`
- 下载按钮样式：橙色渐变（`#f97316 → #ef4444`），圆角 12px，带下载图标
- **禁止**在详情页中出现多个下载链接（如阿里云、Gitee 等），只保留此唯一地址

### 4.3 字体规范

| 字体名称 | 用途 | 引入方式 |
|----------|------|----------|
| Inter | 正文、导航、按钮 | Google Fonts |
| Microsoft YaHei | 中文备选 | 系统字体 |
| Consolas | 代码块 | 系统字体 |

### 4.4 间距与圆角

| 用途 | 尺寸 |
|------|------|
| 卡片圆角 | 8px |
| 按钮圆角 | 12px |
| 容器内边距 | 30px 32px |
| 侧边栏宽度 | 280px |

## 五、响应式设计

### 5.1 断点设置

| 设备类型 | 屏幕宽度 | 布局 |
|----------|----------|------|
| PC 端 | ≥769px | 左侧固定栏 + 右侧主内容 |
| 移动端 | ≤768px | 隐藏左侧栏，主内容全宽 |

### 5.2 关键规则

1. **侧边栏**：`position: fixed; left: 0; width: 280px; z-index: 10`
2. **主内容区**：`margin-left: 280px; max-width: 960px`
3. **移动端**：`@media (max-width: 768px)` 中隐藏 `.sidebar`，`.main-content` 的 `margin-left: 0`
4. **防溢出**：`body { overflow-x: hidden; }`（全局防线），`.main-content` 使用 `word-wrap: break-word; overflow-wrap: break-word; overflow-x: hidden;`（main-content 高度为 auto，不会产生垂直滚动条，因此 `overflow-x: hidden` 安全，可防止内部元素溢出到 sidebar 区域）
5. **锚点跳转**：`html` 和 `body` 均设置 `scroll-behavior: smooth; scroll-padding-top: 24px;`（body 有 `overflow-x: hidden` 会成为滚动容器，scroll-padding-top 必须同时设置在 body 上才生效），`h2/h3 { scroll-margin-top: 24px; }`

## 六、产品数据结构

### 6.1 数据字段定义

```javascript
{
    id: number,                    // 产品唯一标识
    name: string,                  // 产品英文名称（必填，如 "KanlorOne WordSuite"）
    nameCn: string,                // 产品中文名称
    icon: string,                  // Emoji 图标（默认 📦）
    image: string,                 // 产品图片路径（如 "products/KanlorOne_WordSuite.png"）
    version: string,               // 版本号（必填，如 "v1.0.0"）
    releaseDate: string,           // 发布日期 YYYY-MM-DD（必填）
    description: string,           // 产品简介
    features: string[],            // 核心特色列表
    functions: string[],           // 主要功能列表
    updates: string[],             // 更新日志列表（格式："v版本号 - 描述"）
    downloads: [                   // 下载链接列表（统一使用微云地址）
        {
            platform: "Windows 64位",
            link: "https://share.weiyun.com/d56f8rp2",
            size: string           // 文件大小（如 "20 MB"）
        }
    ]
}
```

### 6.2 数据管理

- **唯一数据源**：`/assets/products.js` 中的 `productsData` 数组
- **管理工具**：`/manage.html` 提供可视化增删改查（本地使用，不部署上线）
- **代码生成**：管理工具自动生成 `products.js` 代码，复制覆盖即可
- **导入导出**：支持单个产品数据的导入和导出

### 6.3 数据模板格式

```json
{
    "id": 0,
    "name": "KanlorOne_ProductName",
    "nameCn": "产品中文名称",
    "icon": "📦",
    "image": "products/KanlorOne_ProductName.png",
    "version": "1.0.0",
    "releaseDate": "2026-07-21",
    "description": "产品简介描述",
    "features": ["核心特色1", "核心特色2", "核心特色3"],
    "functions": ["主要功能1", "主要功能2", "主要功能3"],
    "updates": ["v1.0.0 - 初始版本"],
    "downloads": [
        {
            "platform": "Windows 64位",
            "link": "https://share.weiyun.com/d56f8rp2",
            "size": "20 MB"
        }
    ]
}
```

## 七、页面模板规范

### 7.1 首页模板（index.html）

页面结构：
1. **Header**：固定顶部导航，包含 Logo、导航链接、移动端汉堡菜单
2. **Hero**：全屏渐变背景，展示品牌标语
3. **Products**：产品网格列表，每卡片包含产品图片、名称、版本、简介
4. **Contact**：联系方式（邮箱、微信二维码）
5. **Footer**：版权信息

#### 产品卡片跳转逻辑

```javascript
const detailUrl = `products/${product.name.replace(/\s+/g, '_')}.html`;
card.onclick = () => { window.location.href = detailUrl; };
```

- 转换规则：产品英文名称空格替换为下划线 + `.html`
- 示例：`KanlorOne WordSuite` → `products/KanlorOne_WordSuite.html`

### 7.2 详情页模板（products/APP_NAME.html）★核心★

**详情页采用「左侧固定栏 + 右侧主内容」双栏布局**，所有产品详情页必须严格遵循此模板。

#### 7.2.1 整体布局

```
┌─────────────┬──────────────────────────────────┐
│  左侧固定栏  │  右侧主内容区                      │
│  (280px)    │  (margin-left: 280px)             │
│             │  (max-width: 960px)               │
│  返回首页    │                                  │
│  产品标识    │  H1 主标题                        │
│  目录导航    │  一、产品简介（含产品图片）         │
│  微信二维码  │  二、核心特色                      │
│             │  三、使用指南                      │
│             │  四、功能详解                      │
│             │  五、下载安装（含下载按钮）         │
│             │  六、更新日志                      │
│             │  七、常见问题                      │
│             │  八、快捷键（可选）                 │
│             │  Footer                           │
└─────────────┴──────────────────────────────────┘
```

#### 7.2.2 左侧固定栏结构

左侧栏 `position: fixed`，从上到下依次包含：

1. **返回首页按钮**：橙色背景，带左箭头图标
2. **产品标识**：产品图片（56px 高）+ 英文名 + 中文名
3. **目录导航**：所有章节锚点链接
4. **微信二维码**：140px 宽，带「扫码添加微信」提示

```html
<aside class="sidebar">
    <a href="../index.html" class="back-home" title="返回首页">
        <i class="fas fa-arrow-left"></i> 返回首页
    </a>
    <div class="product-identity">
        <img src="APP_NAME.png" alt="产品名">
        <div class="name">产品英文名</div>
        <div class="nameCn">产品中文名</div>
    </div>
    <div class="toc-title">目录</div>
    <nav class="toc">
        <a href="#intro">一、产品简介</a>
        <a href="#features">二、核心特色</a>
        <a href="#guide">三、使用指南</a>
        <a href="#functions">四、功能详解</a>
        <a href="#download">五、下载安装</a>
        <a href="#updates">六、更新日志</a>
        <a href="#faq">七、常见问题</a>
        <a href="#shortcuts">八、快捷键</a>
    </nav>
    <div class="wechat-box">
        <img src="../assets/wechat.png" alt="微信二维码">
        <div class="tip">扫码添加微信</div>
    </div>
</aside>
```

#### 7.2.3 右侧主内容结构

```html
<div class="container">
    <h1>产品英文名 — 产品中文描述</h1>

    <!-- 一、产品简介（产品图片必须放在这里） -->
    <h2 id="intro">一、产品简介</h2>
    <img src="APP_NAME.png" alt="产品界面" class="product-image">
    <p>产品说明文字...</p>

    <!-- 二、核心特色 -->
    <h2 id="features">二、核心特色</h2>
    <div class="card">
        <div class="card-title">特色标题</div>
        <div class="card-desc">特色说明</div>
    </div>

    <!-- 三、使用指南 -->
    <h2 id="guide">三、使用指南</h2>
    <div class="step">
        <div class="step-num">1</div>
        <div class="step-text">步骤说明</div>
    </div>

    <!-- 四、功能详解 -->
    <h2 id="functions">四、功能详解</h2>
    <div class="card">
        <div class="card-title">功能模块</div>
        <div class="card-desc">功能详细说明</div>
    </div>

    <!-- 五、下载安装（下载按钮必须放在这里） -->
    <h2 id="download">五、下载安装</h2>
    <div class="card">
        <div class="card-title">系统要求</div>
        <div class="card-desc">
            <ul>
                <li>操作系统：Windows 7 及以上（64 位）</li>
            </ul>
        </div>
    </div>
    <a href="https://share.weiyun.com/d56f8rp2" target="_blank" rel="noopener noreferrer" class="download-btn">
        <i class="fas fa-download"></i>
        <span>下载 Windows 64位</span>
    </a>

    <!-- 六、更新日志 -->
    <h2 id="updates">六、更新日志</h2>
    <table>
        <thead><tr><th>版本</th><th>更新内容</th><th>发布日期</th></tr></thead>
        <tbody>
            <tr><td>v1.0.0</td><td>初始版本</td><td>2026-07-21</td></tr>
        </tbody>
    </table>

    <!-- 七、常见问题 -->
    <h2 id="faq">七、常见问题</h2>
    <div class="card">
        <div class="card-title">Q：问题？</div>
        <div class="card-desc">A：解答</div>
    </div>

    <!-- 八、快捷键（可选） -->
    <h2 id="shortcuts">八、快捷键</h2>
    <table>
        <thead><tr><th>快捷键</th><th>功能</th></tr></thead>
        <tbody>
            <tr><td>Ctrl+S</td><td>保存</td></tr>
        </tbody>
    </table>

    <!-- Footer -->
    <div class="footer">
        <p class="no-indent">© 2026 KanlorOne. All Rights Reserved. | 微信: MToolsService | 邮箱: <a href="mailto:kanlorone@163.com">kanlorone@163.com</a></p>
    </div>
</div>
```

#### 7.2.4 完整 CSS 样式规范

详情页必须包含以下完整 CSS（可直接复制使用）：

```css
:root {
    --brand: #ff3b00;
    --ink: #20242a;
    --muted: #667085;
    --line: #e8eaed;
    --bg: #f7f8fa;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
html { scroll-behavior: smooth; scroll-padding-top: 24px; }
body { font-family: 'Inter', 'Microsoft YaHei', system-ui, sans-serif; line-height: 1.7; color: var(--ink); background: var(--bg); overflow-x: hidden; }
img { max-width: 100%; }
pre { max-width: 100%; overflow-x: auto; }

/* 左侧固定栏 */
.sidebar {
    position: fixed; left: 0; top: 0; bottom: 0;
    width: 280px;
    background: #fff;
    border-right: 1px solid var(--line);
    overflow-y: auto;
    padding: 24px 20px;
    z-index: 10;
}
.sidebar .back-home {
    display: flex; align-items: center; gap: 8px;
    padding: 10px 14px;
    background: var(--brand); color: #fff;
    border-radius: 10px; text-decoration: none;
    margin-bottom: 20px;
    font-size: 14px; font-weight: 500;
    transition: background 0.2s;
}
.sidebar .back-home:hover { background: #cc3000; }
.sidebar .product-identity {
    text-align: center;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid var(--line);
}
.sidebar .product-identity img { height: 56px; margin-bottom: 8px; }
.sidebar .product-identity .name { font-size: 15px; font-weight: 600; color: var(--ink); }
.sidebar .product-identity .nameCn { font-size: 13px; color: var(--muted); margin-top: 2px; }
.sidebar .toc-title {
    font-size: 12px; font-weight: bold;
    color: var(--muted);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 10px;
    padding-left: 10px;
}
.sidebar nav.toc a {
    display: block;
    padding: 7px 10px;
    color: var(--ink);
    text-decoration: none;
    font-size: 14px;
    border-radius: 6px;
    transition: all 0.15s;
}
.sidebar nav.toc a:hover {
    background: #fff5f2;
    color: var(--brand);
}
.sidebar .wechat-box {
    margin-top: 24px;
    padding-top: 20px;
    border-top: 1px solid var(--line);
    text-align: center;
}
.sidebar .wechat-box img {
    width: 140px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.sidebar .wechat-box .tip {
    font-size: 12px;
    color: var(--muted);
    margin-top: 8px;
}

/* 右侧主内容区 */
.main-content {
    margin-left: 280px;
    max-width: 960px;
    padding: 30px 32px;
    word-wrap: break-word;
    overflow-wrap: break-word;
    overflow-x: hidden;
}

h1 { font-size: 28px; color: var(--brand); border-bottom: 3px solid var(--brand); padding-bottom: 12px; margin-bottom: 24px; font-weight: 700; }

/* 产品图片（产品简介章节内） */
.product-image {
    width: 100%;
    max-width: 640px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    margin: 16px 0;
    display: block;
}

/* 下载按钮（统一样式） */
.download-btn {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 14px 32px;
    background: linear-gradient(to right, #f97316, #ef4444);
    color: #fff !important;
    font-weight: 600;
    border-radius: 12px;
    text-decoration: none;
    box-shadow: 0 4px 14px rgba(255, 59, 0, 0.25);
    transition: all 0.3s cubic-bezier(0.4, 0.0, 0.2, 1);
    font-size: 16px;
    margin: 16px 0;
}
.download-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(255, 59, 0, 0.35);
    text-decoration: none;
}

/* Typography */
h2 { font-size: 20px; color: var(--brand); margin-top: 36px; margin-bottom: 14px; padding-left: 10px; border-left: 4px solid var(--brand); font-weight: 700; scroll-margin-top: 24px; }
h3 { font-size: 16px; color: var(--ink); margin-top: 20px; margin-bottom: 10px; font-weight: 600; scroll-margin-top: 24px; }
p { margin-bottom: 10px; text-indent: 2em; }
p.no-indent { text-indent: 0; }

/* Card */
.card { background: #fff; border-radius: 8px; padding: 16px 20px; margin-bottom: 12px; box-shadow: 0 1px 3px rgba(0,0,0,0.06); border: 1px solid var(--line); }
.card-title { font-weight: bold; color: var(--brand); font-size: 15px; margin-bottom: 6px; }
.card-desc { color: var(--muted); font-size: 14px; }
.card-desc ul { margin: 8px 0 12px 2em; }
.card-desc li { margin-bottom: 4px; }

/* Tags */
.tag { display: inline-block; background: #ffe6dd; color: var(--brand); padding: 2px 8px; border-radius: 4px; font-size: 12px; margin-right: 6px; }

/* Tip / Warn */
.tip { background: #ecfdf5; border-left: 4px solid #10b981; padding: 10px 14px; margin: 12px 0; border-radius: 0 6px 6px 0; font-size: 14px; }
.warn { background: #fefce8; border-left: 4px solid #eab308; padding: 10px 14px; margin: 12px 0; border-radius: 0 6px 6px 0; font-size: 14px; }

/* Steps */
.step { display: flex; align-items: flex-start; margin-bottom: 10px; }
.step-num { flex-shrink: 0; width: 28px; height: 28px; background: var(--brand); color: #fff; border-radius: 50%; text-align: center; line-height: 28px; font-size: 14px; font-weight: bold; margin-right: 12px; margin-top: 2px; }
.step-text { flex: 1; }

/* Table */
table { width: 100%; max-width: 100%; border-collapse: collapse; margin: 12px 0; font-size: 14px; table-layout: auto; word-break: break-word; }
th { background: var(--brand); color: #fff; padding: 8px 12px; text-align: left; }
td { padding: 8px 12px; border-bottom: 1px solid var(--line); }
tr:nth-child(even) td { background: #f9fafb; }

/* Lists */
ul, ol { margin: 8px 0 12px 2em; }
li { margin-bottom: 4px; }

/* Footer */
.footer { text-align: center; margin-top: 40px; padding-top: 20px; border-top: 1px solid var(--line); color: var(--muted); font-size: 13px; }
.footer a { color: var(--brand); text-decoration: none; }

code { background: #f1f3f5; padding: 2px 6px; border-radius: 4px; font-size: 13px; font-family: 'Consolas', 'Microsoft YaHei', monospace; }
b { color: var(--ink); }

/* 移动端：隐藏左侧栏，全宽显示 */
@media (max-width: 768px) {
    .sidebar { display: none; }
    .main-content { margin-left: 0; padding: 20px 16px; }
}
```

#### 7.2.5 必须包含的章节

| 序号 | 章节名称 | id | 内容要求 | 是否必填 |
|------|----------|-----|----------|----------|
| 1 | 产品简介 | `intro` | 产品说明 + **产品图片**（必须放在此章节） | 必填 |
| 2 | 核心特色 | `features` | 3-5 个核心特色，使用卡片展示 | 必填 |
| 3 | 使用指南 | `guide` | 编号步骤说明 | 必填 |
| 4 | 功能详解 | `functions` | 功能模块卡片 | 必填 |
| 5 | 下载安装 | `download` | 系统要求 + 安装步骤 + **下载按钮**（必须放在此章节） | 必填 |
| 6 | 更新日志 | `updates` | 版本表格，按时间倒序 | 必填 |
| 7 | 常见问题 | `faq` | 5-10 个 FAQ | 必填 |
| 8 | 快捷键 | `shortcuts` | 快捷键表格（如有） | 选填 |

#### 7.2.6 关键规则（不可违反）

1. **下载地址统一**：所有产品详情页只使用 `https://share.weiyun.com/d56f8rp2` 一个下载地址，禁止出现多个下载链接
2. **下载按钮位置**：下载按钮必须放在「五、下载安装」章节末尾，使用 `.download-btn` 样式
3. **产品图片位置**：产品图片必须放在「一、产品简介」章节标题下方，使用 `.product-image` 样式
4. **二维码位置**：微信二维码必须放在左侧固定栏底部 `.wechat-box`，不得放在正文或顶部
5. **左侧栏固定**：目录导航、返回首页、产品标识必须在左侧固定栏，不得放在顶部
6. **锚点跳转优化**：必须包含 `scroll-behavior: smooth`、`scroll-padding-top: 24px`、`scroll-margin-top: 24px`
7. **防溢出**：`body` 和 `.main-content` 必须包含 `overflow-x: hidden`

## 八、交互规范

### 8.1 导航交互

- 点击左侧目录链接：平滑滚动到对应章节（`scroll-behavior: smooth`）
- 跳转后目标标题留出 24px 顶部空间（`scroll-margin-top`），不被遮挡

### 8.2 卡片交互

- 鼠标悬停：阴影增强
- 下载按钮悬停：上移 2px，阴影增强

### 8.3 移动端交互

- 屏幕宽度 ≤768px 时隐藏左侧栏
- 主内容区全宽显示

## 九、部署规范

### 9.1 GitHub Pages 配置

- 使用 `main` 分支部署
- 添加 `.nojekyll` 文件禁用 Jekyll 处理
- 部署时排除 `manage.html`、`deploy.bat` 等内部文件

### 9.2 CI/CD

- 配置文件：`.github/workflows/static.yml`
- 触发条件：push 到 main 分支
- 自动部署到 GitHub Pages，通常 1-5 分钟

## 十、智能体维护指南 ★AI 适用★

本节专为 AI 智能体设计，描述如何按照本规范更新网站信息。

### 10.1 智能体工作流程

当接到「更新网站」「修改产品页」「新增产品」等任务时，按以下流程执行：

#### 场景 A：修改现有产品详情页内容

1. 读取 `/products/APP_NAME.html` 文件
2. 修改对应章节内容（如更新日志、FAQ、功能说明）
3. **不得改变整体布局结构**（左侧栏 + 右侧主内容）
4. **不得改变下载地址**（必须保持 `https://share.weiyun.com/d56f8rp2`）
5. **不得移动产品图片和二维码位置**
6. 保存文件，验证 HTML 结构完整

#### 场景 B：新增产品详情页

1. 复制 `/products/KanlorOne_WordSuite.html` 作为模板
2. 重命名为 `KanlorOne_NewProduct.html`
3. 修改以下内容：
   - `<title>` 标签
   - `<meta>` 描述和关键词
   - 左侧栏的产品标识（图片、英文名、中文名）
   - 左侧栏的目录链接（如需调整章节）
   - 右侧主内容的 H1 标题
   - 各章节内容
4. 确保产品图片 `KanlorOne_NewProduct.png` 已放入 `/products/` 目录
5. 更新 `/assets/products.js` 添加新产品数据
6. 验证所有规则符合第 7.2.6 节

#### 场景 C：更新产品数据

1. 修改 `/assets/products.js` 中的 `productsData` 数组
2. 同步更新 `/products/APP_NAME.json` 单产品数据文件
3. 同步更新 `/products/APP_NAME.html` 详情页中的相关信息（版本号、更新日志等）

### 10.2 智能体检查清单

修改或创建详情页后，必须逐项检查：

- [ ] 左侧固定栏存在且包含：返回首页、产品标识、目录、微信二维码
- [ ] 右侧主内容 `margin-left: 280px`
- [ ] 产品图片在「一、产品简介」章节内，使用 `.product-image` 类
- [ ] 下载按钮在「五、下载安装」章节末尾，使用 `.download-btn` 类
- [ ] 下载地址为 `https://share.weiyun.com/d56f8rp2`，且只有此一个下载链接
- [ ] 微信二维码在左侧栏底部 `.wechat-box`
- [ ] CSS 包含 `scroll-behavior: smooth`、`scroll-padding-top: 24px`、`scroll-margin-top: 24px`
- [ ] CSS 包含 `body { overflow-x: hidden; }`，`.main-content` 使用 `word-wrap: break-word` 和 `overflow-x: hidden`（main-content 高度为 auto，overflow-x: hidden 安全）
- [ ] 移动端媒体查询 `@media (max-width: 768px)` 隐藏侧边栏
- [ ] 所有章节 id 与目录链接对应（`#intro`、`#features`、`#guide` 等）
- [ ] Footer 包含版权信息和联系方式

### 10.3 智能体禁止事项

1. **禁止**在详情页顶部添加 header 导航栏（必须用左侧固定栏）
2. **禁止**添加多个下载链接（阿里云、Gitee 等一律不要）
3. **禁止**将产品图片放在产品简介以外的位置
4. **禁止**将二维码放在正文区域或顶部
5. **禁止**删除或修改 CSS 中的 `scroll-*` 规则（`html` 和 `body` 都必须有 `scroll-padding-top: 24px`）
6. **禁止**改变下载按钮的文字（必须为「下载 Windows 64位」）
7. **禁止**在移动端显示左侧栏（必须 `@media (max-width: 768px) { .sidebar { display: none; } }`）

## 十一、维护操作方法

### 11.1 本地开发环境

```bash
cd KanlorOne.github.io
python -m http.server 8000
```
访问 `http://localhost:8000`

### 11.2 产品数据管理

通过 `manage.html`（本地访问）进行可视化增删改查，生成代码后覆盖 `assets/products.js`。

### 11.3 部署流程

```bash
git add .
git commit -m "更新说明"
git push origin main
```
GitHub Actions 自动部署，1-5 分钟后访问 `https://kanlorone.github.io` 验证。

### 11.4 常见操作清单

| 操作 | 步骤 |
|------|------|
| 修改产品详情页 | 编辑 `/products/APP_NAME.html` → 保存 |
| 新增产品 | 创建 html/json/png → 更新 products.js |
| 更新下载地址 | 全局替换为 `https://share.weiyun.com/d56f8rp2` |
| 更新微信二维码 | 替换 `/assets/wechat.png` |
| 修改首页内容 | 编辑 `index.html` 中的配置对象 |

## 十二、注意事项

1. **产品数据修改**：通过 `manage.html` 管理，不要直接编辑 `products.js`（除非智能体批量更新）
2. **图片路径**：产品图片必须放在 `products/` 目录下，详情页用相对路径 `APP_NAME.png` 引用
3. **链接规范**：使用相对路径，外部链接使用 `target="_blank" rel="noopener noreferrer"`
4. **兼容性**：确保在主流浏览器（Chrome、Firefox、Safari、Edge）中正常显示
5. **安全**：下载链接使用 HTTPS
6. **manage.html 不部署**：管理工具仅本地使用，部署时被排除
