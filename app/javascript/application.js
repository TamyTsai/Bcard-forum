// Entry point for the build script in your package.json
import "@hotwired/turbo-rails" // node_modules 目錄下
import "./controllers" // 會去找controllers下的index.js
// 路徑是資料夾 且 沒有檔名 就會去找該資料夾下的 index檔案（webpack慣例）

import "./editor.js"