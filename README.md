# KanlorOne 软件系列展示站

面向 GitHub Pages 的纯静态官网，介绍 KanlorOne 系列软件。
零构建、零依赖运行时，所有产品数据由 `assets/products.js` 单一文件驱动。

## 本地预览

```bash
python -m http.server 8000
```

浏览器打开 `http://localhost:8000/`。

## 一键部署

双击 `deploy.bat` 即可自动完成 git 添加、提交、推送，GitHub Pages 会在 1-5 分钟后自动更新。

访问地址：https://kanlorone.github.io

## 项目结构

```
KanlorOne.github.io/
├── index.html                          # 首页（产品列表、导航、联系我们）
├── manage.html                         # 产品数据管理工具（增删改查、导入导出，本地工具不公开部署）
├── deploy.bat                          # 一键部署脚本（含分支校验）
├── .gitignore                          # Git 忽略规则
├── Kanlor_html.md                      # 网站架构与设计规范文档
├── KanlorOne_PRODUCT_TEMPLATE.json     # 产品数据模板
├── products/                           # 产品统一目录（数据、详情页、图片）
│   ├── KanlorOne_WordSuite.json        # 产品数据
│   ├── KanlorOne_WordSuite.html        # 详情页面
│   ├── KanlorOne_WordSuite.png         # 产品图片
│   ├── KanlorOne_PandocGUI.*
│   ├── KanlorOne_Guard.*
│   ├── KanlorOne_HtmlAccPass.*
│   └── KanlorOne_ExcelKit.*
├── assets/
│   ├── products.js                     # 产品数据（唯一数据源，首页与详情页共用）
│   ├── logo.png                        # 网站Logo
│   ├── favicon.ico                     # 网站图标
│   └── wechat.png                      # 微信二维码
└── .github/workflows/static.yml        # GitHub Pages 自动部署配置（自动排除内部文件）
```

## 产品维护

### 文件命名规范

所有产品相关文件使用统一的 `APP_NAME` 命名规则，存放在 `/products/` 目录：

| 文件类型 | 命名规则 | 示例 |
|----------|----------|------|
| 产品数据 | `APP_NAME.json` | `KanlorOne_WordSuite.json` |
| 详情页面 | `APP_NAME.html` | `KanlorOne_WordSuite.html` |
| 产品图片 | `APP_NAME.png` | `KanlorOne_WordSuite.png` |

### 增删改产品

访问 `http://localhost:8000/manage.html` 使用可视化管理工具：

1. **新增产品**：填写表单 → 保存 → 生成代码 → 复制覆盖 `assets/products.js`
2. **修改产品**：点击编辑 → 修改 → 保存 → 生成代码 → 复制覆盖
3. **删除产品**：点击删除 → 生成代码 → 复制覆盖
4. **导入导出**：支持单个产品数据的导入和导出

新增产品后，需在 `/products/` 目录创建对应的 `APP_NAME.html` 详情页，首页会自动链接。

### 产品数据结构

```json
{
    "id": 1,
    "name": "KanlorOne WordSuite",
    "nameCn": "WordSuite 文档套件",
    "icon": "📋",
    "image": "products/KanlorOne_WordSuite.png",
    "version": "1.9.3",
    "releaseDate": "2026-07-11",
    "description": "产品简介",
    "features": ["特色1", "特色2"],
    "functions": ["功能1", "功能2"],
    "updates": ["v1.9.3 - 更新内容"],
    "downloads": [
        {
            "platform": "Windows 64位",
            "link": "https://...",
            "size": "20 MB"
        }
    ]
}
```

## 详情页规范

每个产品详情页必须包含以下章节：

1. 产品简介
2. 核心特色
3. 使用指南
4. 功能详解
5. 下载安装
6. 更新日志
7. 常见问题
8. 快捷键（可选）

详细规范请参阅 [Kanlor_html.md](Kanlor_html.md)。

## 技术栈

| 技术 | 用途 |
|------|------|
| HTML5 | 页面结构 |
| Tailwind CSS | 响应式样式框架（CDN） |
| Font Awesome 6.5.1 | 图标库（CDN） |
| JavaScript (ES6+) | 交互逻辑 |
| Google Fonts | 字体（Inter、Space Grotesk） |

## 响应式设计

| 设备类型 | 屏幕宽度 | 产品列数 | 导航方式 |
|----------|----------|----------|----------|
| PC端 | ≥1024px | 3列 | 顶部导航栏 |
| 平板端 | 768px-1023px | 2列 | 顶部导航栏 |
| 移动端 | <640px | 1列 | 汉堡菜单 |

## 部署

### GitHub Pages（已配置）

直接 push 到 `main` 分支，`.github/workflows/static.yml` 会自动部署。

### 一键部署

双击 `deploy.bat`，脚本会自动执行（含分支校验，仅 main 分支可部署）：
1. 校验当前分支是否为 main
2. `git add -A`
3. `git commit -m "Deploy update YYYY-MM-DD HH:MM:SS"`
4. `git push origin main`

部署时 GitHub Actions 会自动排除以下内部文件，不发布到公开站点：
- `manage.html`（产品数据管理后台）
- `deploy.bat`、`KanlorOne_PRODUCT_TEMPLATE.json`、`Kanlor_html.md`、`README.md`

## 相关文档

- [Kanlor_html.md](Kanlor_html.md) - 网站架构与设计规范（传给大模型可按规范维护详情页）
