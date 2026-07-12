// 产品信息唯一维护文件：首页与详情页共用。
// 新增、删除或修改产品后，直接提交发布即可。

const productsData = [
            {
                "id": 1,
                "name": "KanlorOne WordSuite",
                "icon": "📋",
                "image": "assets/products/KanlorOne_WordSuite.png",
                "version": "1.9.3",
                "releaseDate": "2026-07-11",
                "description": "专业级Word批量排版与自动化处理套件，深度集成VBA与AI能力，一键搞定长文档排版、格式批量统一、模板智能生成，大幅提升文档处理效率。",
                "features": [
                    "批量格式一键统一",
                    "AI智能排版优化",
                    "自定义模板生成器",
                    "多文档批量合并拆分"
                ],
                "functions": [
                    "长文档自动化排版",
                    "样式模板管理中心",
                    "批量页眉页脚处理",
                    "文档格式批量转换"
                ],
                "updates": [
                    "v1.9.3 - 优化批量处理速度，修复WPS兼容问题",
                    "v1.9.2 - 品牌正式更名KanlorOne WordSuite，新增.doc/.wps格式自动转换支持，优化默认参数与内置模板，修复多项已知问题",
                    "v1.9.1 - 新增统一范围标识管理引擎，图片/表格样式适配横竖页面，优化公文标题识别，新增标题编号替换功能",
                    "v1.9 - 品牌全新升级，重构许可模式为免费功能+注册解锁，全面优化界面交互与日志体验，大幅提升运行性能",
                    "v1.8.0 - 新增模板加密导入导出、文档数据统计、文档属性设置功能，上线全局快捷键与侧边导航拖拽排序",
                    "v1.7.0 - 新增文档属性与数据统计模块，侧边导航栏支持勾选与拖拽排序，优化日志展示与模板管理",
                    "v1.6 - 统一功能命名规范，分栏尺寸持久化记忆，优化日志排版与属性面板体验",
                    "v1.5 - 侧边导航复选框双向状态同步，新增恢复默认按钮，加宽导航栏并统一日志格式",
                    "v1.4 - 拆分系统配置与用户模板存储目录，修复非注册版文件覆盖问题，新增启动快捷键提示",
                    "v1.3 - 上线全套全局快捷键，统计弹窗独立展示，优化文档属性面板双栏布局",
                    "v1.2 - 完善模板管理功能，重构极简日志展示，规范功能默认排序，优化标语编辑交互",
                    "v1.1 - 新增文档多维度统计与属性读写功能，落地侧边导航方案，支持分栏尺寸记忆",
                    "v1.0 - 基础Word批量处理框架正式上线，支持多功能组合、批量文件处理与基础模板管理"
                ],
                "downloads": [
                    {
                        "platform": "Windows 64位",
                        "link": "https://share.weiyun.com/d56f8rp2",
                        "size": "20.09 MB"
                    }
                ]
            },
            {
                id: 2,
                name: "KanlorOne ScreenGuard",
                icon: "📊",
                image: "assets/products/KanlorOne_ScreenGuard.png",
                version: "2.8",
                releaseDate: "2026-07-12",
                description: "一款强大的屏幕时间管理工具，专为儿童护眼与时间控制以及成人专注工作两种场景设计",
                features: ["每日总时长限制（工作日/节假日分别设置）", "托盘常驻，右键菜单快速操作", "", ""],
                functions: ["儿童用屏管理", "工作休息管理", "待办提醒管理", "时长时间管理"],
                updates: ["v2.8 - 新增待办及提醒管理", "v2.7 - 优化开机启动"],
                downloads: [
                    {
                        "platform": "Windows 64位",
                        "link": "https://share.weiyun.com/d56f8rp2",
                        "size": "17 MB"
                    }
                ]
            },
            {
                id: 3,
                name: "KanlorOne PandocGUI",
                icon: "🔐",
                image: "assets/products/KanlorOne_PandocGUI.png",
                version: "1.4",
                releaseDate: "2026-07-12",
                description: "万能文档转换工具Pandoc的图形化版本应用",
                features: ["可视化操作，无需命令"],
                functions: ["参数可视化", "参数建议填充", "更新检测", "过程记录"],
                updates: ["V1.4 - 全面优化界面及参数推荐", "V1.3 - 解决md到docx乱码"],
                downloads: [
                    {
                        "platform": "Windows 64位",
                        "link": "https://share.weiyun.com/d56f8rp2",
                        "size": "9 MB"
                    }
                ]
            },

        ];
