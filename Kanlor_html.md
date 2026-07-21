# KanlorOne 网站架构与设计规范

## 一、网站概述

KanlorOne 是一个专业软件产品展示网站，采用纯前端技术栈（HTML + CSS + JavaScript），无需后端服务器即可运行，支持 GitHub Pages 静态部署。

## 二、文件结构

```
KanlorOne.github.io/
├── index.html                          # 首页（产品列表、导航、联系我们）
├── manage.html                         # 产品数据管理工具（增删改查、导入导出）
├── Kanlor_html.md                      # 网站架构与设计规范文档
├── KanlorOne_PRODUCT_TEMPLATE.json     # 产品数据模板（可下载）
├── README.md                           # 项目说明
├── .nojekyll                           # GitHub Pages 配置
├── .github/workflows/static.yml        # 自动部署配置
├── products/                           # 产品统一目录（数据、详情页、图片）
│   ├── KanlorOne_WordSuite.json        # WordSuite 产品数据
│   ├── KanlorOne_WordSuite.html        # WordSuite 详情页面
│   ├── KanlorOne_WordSuite.png         # WordSuite 产品图片
│   ├── KanlorOne_ScreenGuard.json      # ScreenGuard 产品数据
│   ├── KanlorOne_ScreenGuard.html      # ScreenGuard 详情页面
│   ├── KanlorOne_ScreenGuard.png       # ScreenGuard 产品图片
│   ├── KanlorOne_PandocGUI.json        # PandocGUI 产品数据
│   ├── KanlorOne_PandocGUI.html        # PandocGUI 详情页面
│   └── KanlorOne_PandocGUI.png         # PandocGUI 产品图片
└── assets/
    ├── products.js                     # 产品数据（唯一数据源）
    ├── logo.png                        # 网站Logo
    ├── favicon.ico                     # 网站图标
    └── wechat.png                      # 微信二维码
```

### 2.1 文件命名规范

所有产品相关文件使用统一的 `APP_NAME` 命名规则，确保 png、html、json 文件名完全一致，且存放在同一目录 `/products/` 下，便于维护。

| 文件类型 | 命名规则 | 示例 |
|----------|----------|------|
| 产品数据文件 | `APP_NAME.json` | `KanlorOne_WordSuite.json` |
| 详情页面文件 | `APP_NAME.html` | `KanlorOne_WordSuite.html` |
| 产品图片文件 | `APP_NAME.png` | `KanlorOne_WordSuite.png` |
| 通用数据模板 | `KanlorOne_PRODUCT_TEMPLATE.json` | - |

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
| 管理工具 | `/manage.html` |

## 三、技术栈

| 技术 | 用途 |
|------|------|
| HTML5 | 页面结构 |
| Tailwind CSS | 响应式样式框架 |
| Font Awesome 6.5.1 | 图标库 |
| JavaScript (ES6+) | 交互逻辑 |
| Google Fonts | 字体（Inter、Space Grotesk） |

## 四、设计规范

### 4.1 配色方案

| 颜色用途 | 颜色值 | CSS变量/类名 |
|----------|--------|--------------|
| 品牌主色 | #FF3B00 | `accent-color`, `accent-bg`, `accent-border` |
| 品牌渐变 | #FF3B00 → #E63900 | `hero-bg` |
| 文本主色 | #20242a | `--ink` |
| 文本次要色 | #667085 | `--muted` |
| 边框色 | #e8eaed | `--line` |
| 背景色 | #f7f8fa | `--bg` |
| 卡片背景 | #ffffff | `bg-white` |

### 4.2 字体规范

| 字体名称 | 用途 | 引入方式 |
|----------|------|----------|
| Inter | 正文、导航、按钮 | Google Fonts |
| Space Grotesk | Logo、品牌标题 | Google Fonts |
| 系统字体 | 备用字体 | `system-ui, -apple-system, sans-serif` |

### 4.3 间距规范

| 间距级别 | 尺寸 | 用途 |
|----------|------|------|
| xs | 0.25rem (4px) | 紧凑元素间距 |
| sm | 0.5rem (8px) | 小间距 |
| md | 1rem (16px) | 标准间距 |
| lg | 1.5rem (24px) | 较大间距 |
| xl | 2rem (32px) | 卡片内边距 |
| 2xl | 3rem (48px) | 区块间距 |

### 4.4 圆角规范

| 圆角级别 | 尺寸 | 用途 |
|----------|------|------|
| sm | 0.25rem (4px) | 小按钮 |
| md | 0.5rem (8px) | 输入框 |
| lg | 0.75rem (12px) | 卡片 |
| xl | 1rem (16px) | 卡片、模态框 |
| 2xl | 1.5rem (24px) | 大卡片、模态框 |

### 4.5 阴影规范

| 阴影级别 | 样式 | 用途 |
|----------|------|------|
| 默认 | `shadow-sm` | 卡片悬浮状态 |
| 标准 | `shadow-lg` | 卡片默认状态 |
| 强 | `shadow-xl` | 模态框、下载按钮 |

## 五、响应式设计

### 5.1 断点设置

| 设备类型 | 屏幕宽度 | 产品列数 | 导航方式 |
|----------|----------|----------|----------|
| PC端 | ≥1024px (lg) | 3列 | 顶部导航栏 |
| 平板端 | 768px-1023px (md) | 2列 | 顶部导航栏 |
| 移动端 | <640px | 1列 | 汉堡菜单 |

### 5.2 移动端适配规则

1. 导航栏：使用汉堡菜单（`#mobile-menu-btn` + `#mobile-menu`）
2. 产品网格：从多列切换为单列
3. 图片尺寸：使用 `clamp()` 或 `max-height` 限制
4. 字体大小：使用 `clamp()` 或媒体查询调整
5. 间距：减少内边距和外边距

## 六、产品数据结构

### 6.1 数据字段定义

```javascript
{
    id: number,                    // 产品唯一标识
    name: string,                  // 产品英文名称（必填）
    nameCn: string,               // 产品中文名称
    icon: string,                  // Emoji图标（默认📦）
    image: string,                 // 产品图片路径
    version: string,               // 版本号（必填）
    releaseDate: string,           // 发布日期 YYYY-MM-DD（必填）
    description: string,           // 产品简介
    features: string[],            // 核心特色列表
    functions: string[],           // 主要功能列表
    updates: string[],             // 更新日志列表（格式：版本 - 描述）
    downloads: [                   // 下载链接列表
        {
            platform: string,      // 平台名称（如 Windows 64位）
            link: string,          // 下载链接
            size: string           // 文件大小（如 20 MB）
        }
    ]
}
```

### 6.2 数据管理

- **唯一数据源**：`assets/products.js` 文件中的 `productsData` 数组
- **管理工具**：`manage.html` 提供可视化增删改查界面
- **代码生成**：管理工具自动生成完整的 `products.js` 代码，复制覆盖即可
- **导入导出**：支持单个产品数据的导入和导出

### 6.3 数据导入导出规范

#### 导出功能
- **导出单个产品**：在产品列表中点击「导出」按钮，导出为 `APP_NAME_DATA.json` 文件
- **导出模板**：点击「下载模板」按钮，下载通用数据模板 `KanlorOne_PRODUCT_DATA.json`

#### 导入功能
- **导入产品**：点击「导入产品」按钮，选择 `.json` 文件导入
- **导入格式**：必须符合产品数据结构规范
- **自动验证**：导入前自动验证必填字段（name、version、releaseDate）

#### 数据模板格式

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
            "link": "https://example.com/download",
            "size": "20 MB"
        }
    ]
}
```

### 6.4 产品数据文件规范

每个产品应有独立的数据文件，存放在 `/products/` 目录下，与详情页面和图片使用相同的命名：

| 文件名 | 用途 | 说明 |
|--------|------|------|
| `APP_NAME.json` | 单个产品数据 | 用于备份、单独管理、导入 |
| `APP_NAME.html` | 产品详情页面 | 用户使用指南、功能说明、下载链接 |
| `APP_NAME.png` | 产品图片 | 产品展示图片 |

**命名一致性示例**（以 WordSuite 为例）：
- `KanlorOne_WordSuite.json`（产品数据）
- `KanlorOne_WordSuite.html`（详情页面）
- `KanlorOne_WordSuite.png`（产品图片）

## 七、页面模板规范

### 7.1 首页模板（index.html）

页面结构：
1. **Header**：固定顶部导航，包含 Logo、导航链接、移动端汉堡菜单
2. **Hero**：全屏渐变背景，展示品牌标语
3. **Products**：产品网格列表，每卡片包含：
   - 左上角：中文名称（上）+ 英文名称（下）
   - 右上角：版本号 + 发布日期（右对齐）
   - 中间：产品图片（全尺寸显示，`object-fit: contain`）
   - 下方：产品简介
4. **Contact**：联系方式（邮箱、微信二维码）
5. **Footer**：版权信息、链接

#### 产品卡片跳转链接实现

首页产品卡片点击后自动跳转到对应产品的详情页面，链接生成逻辑如下：

```javascript
const detailUrl = `products/${product.name.replace(/\s+/g, '_')}.html`;
card.onclick = () => { window.location.href = detailUrl; };
```

**自动链接机制说明**：
- 首页通过 JavaScript 动态遍历 `productsData` 数组生成产品卡片
- 每个卡片的链接由产品英文名称（`name` 字段）自动生成
- 转换规则：将空格替换为下划线，添加 `.html` 后缀
- 示例：`KanlorOne WordSuite` → `products/KanlorOne_WordSuite.html`

### 7.2 详情页模板（products/APP_NAME.html）

详情页是产品的独立帮助文档和使用指南，每个产品一个独立的 HTML 文件，内容必须与产品随带的 help 文档保持一致。

#### 页面结构
1. **Header**：页面顶部，包含产品 Logo、微信二维码、产品主标题
2. **Download**：下载地址区域，列出所有下载链接
3. **TOC**：目录导航，列出所有章节锚点链接
4. **Content**：主体内容，按章节组织
5. **Footer**：版权信息

#### 文件命名规范
| 产品名称 | 详情页面文件名 |
|----------|---------------|
| KanlorOne WordSuite | `KanlorOne_WordSuite.html` |
| KanlorOne ScreenGuard | `KanlorOne_ScreenGuard.html` |
| KanlorOne PandocGUI | `KanlorOne_PandocGUI.html` |

#### 必须包含的内容章节

每个产品详情页必须包含以下章节，顺序和内容要求如下：

| 序号 | 章节名称 | 内容要求 | 是否必填 |
|------|----------|----------|----------|
| 1 | 产品简介 | 说明产品是什么、解决什么问题，1-2 段说明 | 必填 |
| 2 | 核心特色 | 列出 3-5 个核心特色功能，使用卡片或标签展示 | 必填 |
| 3 | 使用指南 | 按步骤说明如何使用，使用编号步骤展示 | 必填 |
| 4 | 功能详解 | 详细介绍每个功能模块，使用卡片展示功能名称和说明 | 必填 |
| 5 | 下载安装 | 提供下载链接、安装步骤、系统要求 | 必填 |
| 6 | 更新日志 | 列出版本号和更新内容，按时间倒序 | 必填 |
| 7 | 常见问题 | FAQ 问答形式，列出 5-10 个常见问题及解答 | 必填 |
| 8 | 快捷键 | 如有快捷键，使用表格列出（可选） | 选填 |

#### 设计要求
1. **配色**：严格使用品牌色 #FF3B00 作为强调色
2. **字体**：使用 Inter 字体，标题加粗，正文适中
3. **布局**：响应式设计，PC端双栏，移动端单列
4. **交互**：平滑滚动、锚点导航、悬停效果
5. **图标**：使用 Font Awesome 图标增强视觉
6. **一致性**：保持与产品内置help文档内容一致

#### 样式规范

详情页应使用统一的样式规范，确保各产品页面视觉一致：

| 元素 | 样式要求 |
|------|----------|
| 主标题 H1 | 28px，品牌色，底部边框 |
| 章节标题 H2 | 20px，品牌色，左侧边框 |
| 小节标题 H3 | 16px，深灰色 |
| 正文段落 | 首行缩进 2em，行高 1.7 |
| 卡片 | 白色背景，圆角 8px，浅阴影 |
| 标签 | 圆角 4px，不同类型使用不同颜色 |
| 提示框 | 左侧 4px 边框，浅色背景 |
| 步骤 | 圆形数字编号，蓝色背景 |
| 表格 | 表头深色背景，斑马纹行 |

#### 页面模板代码结构

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>产品名称 — 使用说明 | KanlorOne</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        :root {
            --brand: #ff3b00;
            --ink: #20242a;
            --muted: #667085;
            --line: #e8eaed;
            --bg: #f7f8fa;
        }
        body { font-family: 'Inter', system-ui, sans-serif; background: var(--bg); }
    </style>
</head>
<body>
    <!-- Header：Logo + 微信二维码 + 主标题 -->
    <header>
        <img src="APP_NAME.png" alt="产品Logo">
        <img src="../assets/wechat.png" alt="微信二维码">
        <h1>产品英文名称 — 产品中文描述</h1>
    </header>

    <!-- 下载地址区域 -->
    <section class="download-links">
        <h3>📥 下载地址</h3>
        <p>① 微云下载：<a href="下载链接">下载链接</a></p>
        <p>② 阿里云下载：<a href="下载链接">下载链接</a></p>
        <p>③ Gitee 仓库：<a href="仓库链接">仓库链接</a></p>
    </section>

    <!-- 目录导航 -->
    <nav class="toc">
        <p>目录</p>
        <a href="#intro">一、产品简介</a>
        <a href="#features">二、核心特色</a>
        <a href="#guide">三、使用指南</a>
        <a href="#functions">四、功能详解</a>
        <a href="#download">五、下载安装</a>
        <a href="#updates">六、更新日志</a>
        <a href="#faq">七、常见问题</a>
        <a href="#shortcuts">八、快捷键</a>
    </nav>

    <!-- 主体内容 -->
    <main>
        <!-- 一、产品简介 -->
        <h2 id="intro">一、产品简介</h2>
        <p>说明产品是什么、解决什么问题...</p>

        <!-- 二、核心特色 -->
        <h2 id="features">二、核心特色</h2>
        <div class="card">
            <div class="card-title">特色1</div>
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

        <!-- 五、下载安装 -->
        <h2 id="download">五、下载安装</h2>
        <p>系统要求：Windows 7 及以上</p>
        <p>安装步骤：...</p>

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
            <div class="card-title">Q：问题1？</div>
            <div class="card-desc">A：解答1</div>
        </div>

        <!-- 八、快捷键（可选） -->
        <h2 id="shortcuts">八、快捷键</h2>
        <table>
            <thead><tr><th>快捷键</th><th>功能</th></tr></thead>
            <tbody>
                <tr><td>Ctrl+S</td><td>保存</td></tr>
            </tbody>
        </table>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <p>© 2026 KanlorOne. All Rights Reserved.</p>
    </footer>
</body>
</html>
```

#### 内容编写规范

1. **语言**：使用中文，技术术语可保留英文
2. **标题层级**：严格使用 H1 → H2 → H3 层级
3. **代码示例**：使用 `<code>` 标签或等宽字体
4. **截图**：使用产品实际界面截图，尺寸统一
5. **链接**：外部链接使用 `target="_blank"` 新窗口打开
6. **更新日志格式**：`v版本号 - 更新内容描述`
7. **FAQ 格式**：`Q：问题` + `A：解答`

## 八、交互规范

### 8.1 导航交互

- 点击导航链接：平滑滚动到对应区域
- 移动端菜单：点击汉堡图标展开/收起，点击链接自动收起

### 8.2 卡片交互

- 鼠标悬停：卡片上移 8px，阴影增强
- 点击图片：跳转到详情页

### 8.3 按钮交互

- 鼠标悬停：背景色加深，阴影增强
- 下载按钮：渐变背景，悬停时有上移动画

### 8.4 模态框交互

- 打开：淡入 + 缩放动画
- 关闭：点击遮罩层或关闭按钮
- 键盘：Esc键关闭

## 九、性能优化

### 9.1 代码优化

- 移除未使用的代码和资源
- 使用 Tailwind CSS 减少自定义CSS
- 合并重复的JavaScript函数

### 9.2 图片优化

- 使用合适的图片格式（PNG/JPG/WebP）
- 压缩图片大小
- 使用 `object-fit: contain` 确保正确显示

### 9.3 加载优化

- 脚本放在页面底部
- 使用 CDN 加载外部资源
- 启用 GitHub Pages 缓存

## 十、部署规范

### 10.1 GitHub Pages 配置

- 使用 `gh-pages` 分支或 `main` 分支部署
- 添加 `.nojekyll` 文件禁用 Jekyll 处理
- 配置自定义域名（可选）

### 10.2 CI/CD

- 使用 GitHub Actions 自动部署
- 配置文件：`.github/workflows/static.yml`
- 触发条件：push 到 main 分支

## 十一、详情页维护指南

### 11.1 创建新的详情页

当需要为新产品创建详情页时，遵循以下步骤：

1. **复制模板**：基于现有产品详情页（如 `KanlorOne_WordSuite.html`）创建新文件
2. **命名文件**：使用 `APP_NAME.html` 命名规则，存放在 `/products/` 目录
3. **填充内容**：按照第 7.2 节规定的章节结构编写内容
4. **保持一致**：使用相同的配色、字体、布局、样式规范
5. **响应式测试**：确保在 PC 和移动设备上正常显示
6. **内容同步**：与产品内置 help 文档保持一致

### 11.2 必须包含的章节检查清单

创建或编辑详情页时，必须确认以下章节已完整填写：

- [ ] Header：产品 Logo + 微信二维码 + 主标题
- [ ] 下载地址：列出所有下载链接
- [ ] 目录导航：所有章节锚点链接
- [ ] 一、产品简介：产品说明
- [ ] 二、核心特色：3-5 个核心特色
- [ ] 三、使用指南：操作步骤
- [ ] 四、功能详解：功能模块说明
- [ ] 五、下载安装：系统要求 + 安装步骤
- [ ] 六、更新日志：版本 + 更新内容 + 日期
- [ ] 七、常见问题：5-10 个 FAQ
- [ ] 八、快捷键（如有）：快捷键表格
- [ ] Footer：版权信息

### 11.3 内容规范

- 使用中文编写，技术术语可保留英文
- 严格使用 H1 → H2 → H3 标题层级
- 代码示例使用 `<code>` 标签或等宽字体
- 截图使用产品实际界面，尺寸统一
- 外部链接使用 `target="_blank"` 新窗口打开
- 更新日志格式：`v版本号 - 更新内容描述`
- FAQ 格式：`Q：问题` + `A：解答`

### 11.4 更新流程

1. 修改详情页 HTML 文件
2. 本地测试（运行 `python -m http.server 8000`）
3. 确认所有章节内容完整
4. 提交到 GitHub
5. 等待自动部署完成
6. 验证线上效果

## 十二、注意事项

1. **产品数据修改**：通过 `manage.html` 管理，不要直接编辑 `products.js`
2. **图片路径**：产品图片必须放在 `products/` 目录下，与对应产品的 html、json 同目录
3. **链接规范**：使用相对路径，避免硬编码绝对路径
4. **兼容性**：确保在主流浏览器（Chrome、Firefox、Safari、Edge）中正常显示
5. **安全**：下载链接使用 HTTPS，避免不安全的外部链接

## 十三、维护操作方法

### 13.1 本地开发环境

**启动本地服务器**：
```bash
cd KanlorOne.github.io
python -m http.server 8000
```

访问地址：`http://localhost:8000`

### 13.2 产品数据管理

#### 添加新产品
1. 访问 `http://localhost:8000/manage.html`
2. 点击「下载模板」按钮，下载 `KanlorOne_PRODUCT_DATA.json`
3. 填写产品数据
4. 点击「导入产品」按钮，选择填写好的 JSON 文件
5. 点击「生成代码」按钮
6. 点击「复制代码」按钮
7. 打开 `assets/products.js` 文件，粘贴覆盖原有内容

#### 修改产品信息
1. 访问 `http://localhost:8000/manage.html`
2. 在产品列表中找到要修改的产品，点击「编辑」按钮
3. 修改产品信息
4. 点击「保存」按钮
5. 点击「生成代码」按钮
6. 点击「复制代码」按钮
7. 打开 `assets/products.js` 文件，粘贴覆盖原有内容

#### 删除产品
1. 访问 `http://localhost:8000/manage.html`
2. 在产品列表中找到要删除的产品，点击「删除」按钮
3. 确认删除
4. 点击「生成代码」按钮
5. 点击「复制代码」按钮
6. 打开 `assets/products.js` 文件，粘贴覆盖原有内容

#### 导出单个产品数据
1. 访问 `http://localhost:8000/manage.html`
2. 在产品列表中找到要导出的产品，点击「导出」按钮
3. 文件将自动下载，命名为 `APP_NAME_DATA.json`

### 13.3 帮助文档维护

#### 创建新产品帮助文档
1. 复制 `/products/KanlorOne_WordSuite_help.html` 文件
2. 修改文件名为 `APP_NAME_help.html`
3. 修改页面内容：
   - 更新 `<title>` 标签中的产品名称
   - 更新 Hero 区域的图标、中英文名称
   - 更新产品概述中的版本、发布日期、描述
   - 更新核心特色列表
   - 更新主要功能列表
   - 更新下载链接和文件大小
   - 更新更新日志
   - 更新常见问题

#### 修改现有帮助文档
1. 打开 `/products/APP_NAME_help.html` 文件
2. 修改相应内容
3. 保存文件

### 13.4 首页内容维护

#### 修改网站标题和标语
编辑 `index.html` 文件中的 `siteConfig` 和 `heroIntro` 对象：
```javascript
const siteConfig = {
    companyName: "KanlorOne",
    heroTitle: "专业软件，<span class='text-orange-200'>驱动未来</span>",
    heroSubtitle: "高效 · 安全 · 持续更新"
};

const heroIntro = {
    title: "沉淀办公经验，<span class='text-orange-200'>打造趁手工具</span>",
    subtitle: "功能精准 · 轻量高效 · 持续进化",
    buttonText: "告别机械劳作，释放核心精力"
};
```

#### 修改联系方式
编辑 `index.html` 文件中的 `contactInfo` 对象：
```javascript
const contactInfo = {
    email: "kanlorone@163.com",
    wechatId: "MToolsService",
    wechatQRCode: "assets/wechat.png",
    wechatTip: "扫码添加微信"
};
```

#### 修改页脚信息
编辑 `index.html` 文件中的 `footerInfo` 对象：
```javascript
const footerInfo = {
    copyright: "© 2026 KanlorOne. All Rights Reserved.",
    links: [
        { text: "服务条款", url: "#" },
        { text: "隐私政策", url: "#" },
        { text: "关于我们", url: "#" }
    ]
};
```

### 13.5 图片资源维护

#### 添加产品图片
1. 将图片文件命名为 `APP_NAME.png`
2. 复制到 `products/` 目录，与该产品的 html、json 放在一起
3. 在产品数据中设置 `image` 字段为 `products/APP_NAME.png`
4. 详情页 html 中引用图片使用相对路径 `APP_NAME.png`（同目录引用）

#### 更新微信二维码
1. 将新的二维码图片命名为 `wechat.png`
2. 复制到 `assets/` 目录，覆盖原有文件

### 13.6 部署流程

#### 本地测试
1. 启动本地服务器：`python -m http.server 8000`
2. 在浏览器中访问 `http://localhost:8000`
3. 测试所有页面和功能

#### 提交代码
```bash
git add .
git commit -m "更新说明"
git push origin main
```

#### 等待部署
GitHub Actions 会自动部署到 GitHub Pages，通常需要 1-5 分钟。

#### 验证部署
访问 `https://kanlorone.github.io` 验证部署结果。

### 13.7 常见操作清单

| 操作 | 步骤 |
|------|------|
| 添加新产品 | 下载模板 → 填写数据 → 导入 → 生成代码 → 覆盖 products.js |
| 修改产品信息 | 编辑 → 保存 → 生成代码 → 覆盖 products.js |
| 删除产品 | 删除 → 生成代码 → 覆盖 products.js |
| 创建帮助文档 | 复制模板 → 修改内容 → 保存 |
| 修改帮助文档 | 打开文件 → 修改内容 → 保存 |
| 更新图片 | 复制新图片到对应目录 → 更新数据中的路径 |
| 更新联系方式 | 修改 contactInfo 对象 → 保存 |