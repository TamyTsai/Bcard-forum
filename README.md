# Bcard論壇網站
![image](https://github.com/user-attachments/assets/a8c1acd9-4fe0-43c1-a991-3efbc278b5e2)

## 關於Bcard論壇網站
- Bcard為一個論壇網站，復刻臺灣知名論壇[Dcard](https://www.dcard.tw/f)
- 在本論壇中，你可以瀏覽會員所發佈的文章，也可以註冊成為會員，自己撰寫文章
- 登入後，你可以自由撰寫文章，還可以收藏他人文章；為他人文章按愛心；追蹤其他使用者，也可以於文章下留言發表你的感想！

<!-- ## 網站地圖（Sitemap）
黃底表示該頁面需要登入後方可使用
![網站地圖](https://github.com/TamyTsai/Bcard-forum/assets/97825677/48a440cb-b5e4-47bd-b6c1-51ae35170ef3) -->

## 實體關聯圖（ERD）
![實體關聯圖](https://github.com/TamyTsai/Bcard-forum/assets/97825677/ae5ff44a-ca00-4b7d-b219-5a82738a7ad2)

## 如何開始
1. 註冊帳號
2. 設定個人資訊
3. 歡迎使用本論壇各種功能！（撰寫文章、收藏文章、為文章按愛心、追蹤別人、文章留言）

<!-- ## 功能
- 會員功能
    - 註冊頁面
        - 輸入ID、常用信箱、密碼、確認密碼後，點擊「註冊」按鈕，即可建立新帳號
    - 登入頁面
        - 輸入常用信箱、密碼後，點擊「登入」按鈕，即可登入本論壇
    - 未登入時，若欲使用文章新增編輯等功能，將跳至登入畫面
    - 未登入時，若欲使用追蹤使用者、收藏文章、為文章按愛心等功能將跳出提醒登入視窗
- 導覽列功能
    - 點擊導覽列左側商標可回到首頁
    - 導覽列右側
        - 未登入時，顯示「登入」與「註冊」按鈕，供進入會員登入及註冊頁面
        - 登入後，顯示「筆」圖示、「小人」圖示與「登出」按鈕
            - 點擊「筆」圖示，進入建立新文章頁面
            - 點擊「小人」圖示，進入個人資訊頁面之首頁：「我的收藏」頁面
            - 點擊「登出」按鈕，將跳出視窗確定是否登出，點擊確定後，頁面跳轉首頁
- 個人資訊頁面功能
    - 登入後方可進入此頁面與此頁面之相關頁面
    - 左側欄位顯示使用者頭貼、ID及卡稱（卡稱有設定才會出現）
    - 點擊ID或卡稱可進入創作者個人頁面
    - 若使用者未設定頭貼，則以預設圖示代替
    - 點擊左側欄位選項，可選擇不同頁面
    - 「我的收藏」頁面
        - 無收藏之文章時，顯示「尚無已收藏之文章」
        - 有收藏之文章時，按照收藏時間順序，由新至舊，顯示收藏之文章
        - 每篇收藏之文章上面顯示文章被收藏之時間
        - 點擊文章標題可進入該篇文章頁面；點擊作者ID或卡稱可進入作者個人頁面
        - 若收藏之文章，嗣後遭文章作者下架，則反灰顯示該篇文章，並顯示文章已下架之相關字眼，且不提供點擊文章標題以進入該文章頁面之功能
    - 「我追蹤的使用者」頁面
        - 無追蹤的使用者時，顯示「尚無已追蹤之使用者」
        - 有追蹤的使用者時，按照追蹤時間順序，由新至舊，顯示使用者，並提供按鈕，供取消追蹤
    - 「我的文章」頁面
        - 尚未建立任何文章時，顯示「尚無文章，趕快來寫一篇吧！」，並提供「建立文章」按鈕，供進入建立文章頁面
        - 有建立的文章時，按照文章建立時間順序，由新至舊，顯示所有自己已建立之文章
        - 每篇文章上面顯示文章建立日期
        - 每篇文章皆提供「筆」圖示及「垃圾桶」圖示，供進入編輯文章頁面及刪除文章
        - 點擊「垃圾桶」圖示刪除文章，會跳出提醒視窗確定是否刪除
        - 文章發佈狀態顯示於文章標題旁，已發佈之文章可於首頁及相關頁面見得
    - 「我的個人資料」頁面
        - 顯示使用者頭貼、ID及卡稱（卡稱有設定才會出現）
        - 若使用者未設定頭貼，則以預設圖示代替
        - 本頁面供編輯以下資訊：
            - 頭貼：點擊「選擇檔案」按鈕可上傳新頭貼
            - 卡稱
            - ID
            - 常用信箱
            - 個人簡介
            - 密碼
        - 修改所有資訊皆需要當前密碼做身份驗證
        - 刪除帳號按鈕供刪除帳號使用，帳號刪除後，由該帳號所建立之文章及該文章下之留言亦一併刪除
- 首頁功能
    - 點擊左側欄位選項，可選擇不同頁面
    - 最新文章頁面
        - 沒有任何已發佈文章時，顯示「這個論壇還沒有任何人發佈文章，趕快來寫第一篇吧!」，並提供「建立文章」按鈕，供進入建立文章頁面
        - 有已發佈文章時，按照文章創建順序，由新至舊，顯示使用者已發佈之文章
    - 熱門文章頁面
        - 沒有任何已發佈文章時，顯示「這個論壇還沒有任何人發佈文章，趕快來寫第一篇吧!」，並提供「建立文章」按鈕，供進入建立文章頁面
        - 有已發佈文章時，按照文章愛心數順序，由多至少，顯示使用者已發佈之文章
    - 每篇文章於以上兩頁面皆顯示以下資訊：作者頭貼、作者ID（及卡稱）、文章建立時間距今多久、文章標題、縮減後之文章內文、文章封面照片（作者有上傳的話）、文章愛心數、留言數、被收藏數
    - 創作者列表頁面
        - 沒有任何已建立之帳號時，顯示「這個論壇還沒有任何使用者，趕快來成為第一個會員吧!」，並提供「註冊」按鈕，供進入會員註冊頁面
        - 有已建立之帳號時，按照使用者帳號建立順序，由新至舊，顯示使用者，且提供追蹤使用者之功能
        - 若已登入，則點擊藍色「追蹤」按鈕可追蹤該名使用者，追蹤後按鈕變為灰色「追蹤中」，再點擊一次可取消追蹤
- 單一文章頁面功能
    - 網址設計為含使用者ID+文章標題
    - 顯示文章標題、作者、作者被追蹤狀態、文章建立時間、內文（含封面照片）、愛心數、留言數、被收藏數、留言
    - 針對自己的文章可進行編輯或刪除
    - 點擊作者之ID或卡稱可進入作者個人頁面
    - 未登入時，使用追蹤、愛心、收藏功能會跳出視窗提醒需先登入，並且不會出現留言輸入框
    - 有登入時可使用追蹤、愛心、留言、收藏功能
    - 點擊藍字「追蹤」，該字樣會變成灰字「追蹤中」，再點擊一次可取消追蹤
    - 於留言輸入框輸入留言內容，點擊「送出」，即可建立留言
    - 留言區按照留言建立順序，由新至舊，顯示所有留言
    - 每篇留言顯示留言者頭貼、ID（及卡稱）、留言內容、留言建立時間
    - 針對自己的留言可進行編輯或刪除
    - 進入留言編輯頁面後，點擊「送出」可更新留言，點擊「取消」則回到該留言對應之文章頁面
    - 留言內容可使用html語法（如連結等）
    - 點擊「垃圾桶」圖示刪除留言，會跳出提醒視窗確定是否刪除
- 文章建立頁面功能
    - 顯示使用者頭貼、ID（及卡稱）、目前時間、封面照片上傳按鈕、標題輸入框、敘述輸入框
    - 敘述輸入框之文字編輯器提供調整字型、顏色、文字粗細及上傳圖檔等功能
    - 填寫對應內容後，點擊「儲存」將文章儲存為草稿，或點擊「發佈文章」將文章發佈公開
- 文章編輯頁面功能
    - 顯示使用者頭貼、ID（及卡稱）、目前時間、封面照片上傳按鈕、標題輸入框、敘述輸入框
    - 敘述輸入框之文字編輯器提供調整字型、顏色、文字粗細及上傳圖檔等功能
    - 如文章為草稿狀態
        - 點擊「儲存」更新文章，點擊「發佈文章」則將文章發佈公開
    - 如文章為已發佈狀態
        - 點擊「儲存」更新文章，點擊「下架」則使文章回到草稿狀態
- 創作者（自己或其他使用者）個人頁面功能
    - 網址設計為含使用者ID
    - 顯示創作者頭貼、ID（及卡稱）、已發佈文章數量、正在追蹤人數、粉絲數量（被多少人追蹤）、個人簡介、所有已發佈文章
    - 若已登入，則點擊藍色「追蹤」按鈕可追蹤該名使用者，追蹤後按鈕變為灰色「追蹤中」，再點擊一次可取消追蹤
    - 若該使用者無已發佈文章，顯示「該使用者目前無已發佈文章！」
    - 若該使用者有已發佈之文章，按照文章建立時間順序，由新至舊，顯示該使用者之已發佈文章
- 成功登入、登出、文章建立成功…等事件發生時，於頁面上方出現一次性提示訊息框框，點擊右上角叉叉可關閉該提醒
- 文章及留言設定為軟刪除，僅記錄刪除時間，讓文章及留言不可見，而不將其由資料庫中刪除
- 於單一文章等頁面之網址文章id部分輸入不存在之文章id時，顯示頁面不存在訊息，並提供「返回首頁」按鈕，供返回首頁（最新文章頁面）-->

## 專案畫面與功能介紹
### 首頁（最新文章）
按文章新舊顯示文章

![首頁（最新文章）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/5ff1e510-d534-4409-a452-367cab7be2b2)

<hr>

### 熱門文章
按文章愛心數多寡顯示文章

![熱門文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/06f7729b-4c17-4e5c-b52e-47b7409ead8d)

<hr>

### 創作者列表
可以看到本論壇已註冊之會員，並追蹤他們！

![創作者列表（已登入）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/ef7cdd60-e91d-4cab-b2a9-3c6e3eb4f143)

<hr>

### 創作者個人頁面
自己或其他使用者的個人頁面，呈現這位用戶的追蹤與被追蹤人數，及發佈了哪些文章

![image](https://github.com/user-attachments/assets/cb3194b1-6bb8-4b8c-a7d1-a32961beb2b2)
![image](https://github.com/user-attachments/assets/e70d1b7e-eaaa-4700-ad6e-444a78fe5527)

<hr>

### 個人資訊首頁（我的收藏）
顯示自己收藏了哪些文章（遭作者下架的文章則無法點擊觀看內文）

![個人資訊首頁（我的收藏）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/949d7f37-b401-4554-8c7c-68334868f905)

<hr>

### 我追蹤的使用者
顯示自己追蹤了哪些人

![我追蹤的使用者](https://github.com/TamyTsai/Bcard-forum/assets/97825677/382af8fd-9242-42f1-89e0-b7a05a14df3a)

<hr>

### 我的文章
顯示自己的文章列表（含未發佈及已發佈）

![我的文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/0aeb04c0-9b26-41ce-afad-4d570d587de8)

<hr>

### 我的個人資料
更改自己的個人資料

![我的個人資料](https://github.com/TamyTsai/Bcard-forum/assets/97825677/704edd4b-90f5-49b7-866b-b48a89a1e63b)

<hr>

### 單一文章頁面
- 如果為自己的文章，則可進行編輯及刪除
- 可以對文章按愛心、收藏文章或追蹤作者

![單一文章頁面](https://github.com/TamyTsai/Bcard-forum/assets/97825677/4024f215-67b4-4579-a2e3-57968215ef1e)

<hr>

### 單一文章頁面（留言區）
如果為自己的留言，則可進行編輯及刪除

![單一文章頁面2（留言區）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/ae167ba3-7384-4693-9bf8-567974205553)

<hr>

### 新增、編輯文章
不只可以上傳文章封面照片，內文也可以再上傳其他圖片

![新增文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/daec8556-ca62-459a-9fcc-1c1f0392a0e6)
![編輯文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/2f93a2a6-fb1e-400a-8817-abb95f413d46)


<!-- ## 畫面
### 首頁（最新文章）
![首頁（最新文章）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/5ff1e510-d534-4409-a452-367cab7be2b2)

### 熱門文章
![熱門文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/06f7729b-4c17-4e5c-b52e-47b7409ead8d)

### 創作者列表
![創作者列表（已登入）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/ef7cdd60-e91d-4cab-b2a9-3c6e3eb4f143)

### 註冊
![註冊](https://github.com/TamyTsai/Bcard-forum/assets/97825677/6e3aeeab-18e9-4308-b614-4581dbd162cf)

### 登入
![登入](https://github.com/TamyTsai/Bcard-forum/assets/97825677/5a1a79f8-006c-432c-9441-64c590257c59)

### 忘記密碼
![忘記密碼](https://github.com/TamyTsai/Bcard-forum/assets/97825677/f4d3baaf-fc01-4731-9913-c20e1878d1a5)

### 系統訊息
![系統訊息](https://github.com/TamyTsai/Bcard-forum/assets/97825677/86d59656-5f9f-45da-bcc4-503d1c8e7df2)

### 404
![404](https://github.com/TamyTsai/Bcard-forum/assets/97825677/a3ddd465-4eb6-4472-af7a-e87cbce05549)

### 個人資訊首頁（我的收藏）
![個人資訊首頁（我的收藏）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/949d7f37-b401-4554-8c7c-68334868f905)

### 我追蹤的使用者
![我追蹤的使用者](https://github.com/TamyTsai/Bcard-forum/assets/97825677/382af8fd-9242-42f1-89e0-b7a05a14df3a)

### 我的文章
![我的文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/0aeb04c0-9b26-41ce-afad-4d570d587de8)

### 我的個人資料
![我的個人資料](https://github.com/TamyTsai/Bcard-forum/assets/97825677/704edd4b-90f5-49b7-866b-b48a89a1e63b)
![我的個人資料2](https://github.com/TamyTsai/Bcard-forum/assets/97825677/9b08378e-c122-4e3b-a59a-9dde520fd99c)

### 單一文章頁面
![單一文章頁面](https://github.com/TamyTsai/Bcard-forum/assets/97825677/4024f215-67b4-4579-a2e3-57968215ef1e)

### 單一文章頁面（留言區）
![單一文章頁面2（留言區）](https://github.com/TamyTsai/Bcard-forum/assets/97825677/ae167ba3-7384-4693-9bf8-567974205553)

### 新增文章
![新增文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/daec8556-ca62-459a-9fcc-1c1f0392a0e6)

### 編輯文章
![編輯文章](https://github.com/TamyTsai/Bcard-forum/assets/97825677/2f93a2a6-fb1e-400a-8817-abb95f413d46)

### 編輯留言
![編輯留言](https://github.com/TamyTsai/Bcard-forum/assets/97825677/e36926fa-e653-449a-95fa-3256fb9a0487) -->


## 安裝
以下皆為於macOS環境運行
### 安裝Ruby
```bash
$ brew install ruby
```
### 安裝Rails v7.1.3.4
```bash
$ gem install rails -v 7.1.3.4
```
### 安裝libvips（處理縮圖）
```bash
$ brew install vips
```
### 下載PostgreSQL
```bash
$ brew install postgresql
```
### 建立資料庫
```bash
$ rails db:create
```
### 建立資料表
```bash
$ rails db:migrate
```
<!-- ### 取得專案
```bash
$ git clone https://github.com/TamyTsai/Bcard-forum.git
```
### 移動到專案內
```bash
$ cd Bcard-forum
``` -->
### 安裝相關套件
```bash
$ bundle install
```
### 啟動rails伺服器及編譯器
```bash
$ bin/dev
```
### 開啟專案
在瀏覽器網址列輸入以下網址即可看到專案首頁
```bash
http://localhost:3000/
```

<!-- ## 主要資料夾及檔案說明
- app—包含應用程式的controlle、model、view、helpers、mailers、channels、和assets
- bin—包含啟動應用程式的 rails指令碼，並且可以包含用於設定、更新、部署或執行應用程式的其他指令碼
- config—包含應用程式路由、資料庫等的設定
- config.ru—用於啟動應用程式的基於 Rack 的伺服器的 Rack 設定
- db—包含目前的資料庫架構以及資料庫migration
- Dockerfile—Docker 的設定檔
- Gemfile、Gemfile.lock—這些檔案供指定 Rails 應用程式所需的 gem 相依性，這些檔案由 Bundler gem 使用
- lib—應用程式的延伸模組
- log—應用程式記錄檔
- public—包含靜態檔案和編譯的資源。當應用程式正在執行時，此目錄會原樣公開
- Rakefile—此檔案找出並載入可從命令列執行的任務。任務定義在 Rails 的各個元件中定義
- README.md—應用程式的簡要說明手冊
- storage—磁碟服務的 Active Storage 檔案
- test—單元測試、固定裝置和其他測試裝置
- tmp—暫存檔案（例如快取和 PID 檔案）
- vendor—所有第三方程式碼放置處
- .dockerignore—此檔案告訴 Docker 哪些檔案不應複製到容器中
- .gitattributes—此檔案會定義 git 儲存庫中特定路徑的元資料。git 和其他工具可以使用此元資料來增強其行為
- .gitignore—此檔案告訴 git 它應該忽略哪些檔案（或模式）
- .ruby-version—此檔案包含預設的 Ruby 版本 -->

<!-- ## 專案技術
- HTML
- CSS
    - RWD
    - Font Awesome v6.5.2
    - Bulma v1.0.1
    - Tailwind
- JavaScript
    - ES6
    - AJAX
    - Stimulus.js v3.2.2
- Ruby v3.0.0
    - Rails v7.1.3.4
    - turbolinks v5.2.1
    - Active Storage v6.1.7.7
    - image processing v1.12.2
    - libvips v8.15
    - Froala editor v4.2.0
    - devise v4.9.4
    - aasm v 5.5.0
    - friendly id v5.5.1
    - babosa v2.0.0
    - paranoia v2.6.3
    - axios v1.7.2
- PostgreSQL v1.5.6
- node v22.2.0
- yarn v1.22.22
- webpack v5.92.1 -->

## 專案技術
- 前端：HTML、Bulma、Tailwind CSS、Stimulus.js
- 後端：Ruby on Rails
- 資料庫：PostgreSQL
- 版本控制：Git

<!-- - 前端語言：HTML、CSS、JavaScript-->
<!-- - 後端語言：Ruby-->
<!-- - 佈署-->

## 使用技術詳細說明
- 以HTML、CSS、JavaScript及Ruby撰寫，為動態網頁
- 設計模式（design pattern）採用MVC架構
- 圖示部分使用Font Awesome，以方便控制大小顏色等設定
- 使用Bulma及Tailwind CSS設計頁面
- 使用ES6使JavaScript語法變得簡潔（箭頭函式、以let定義變數等）
- 追蹤、愛心、收藏等功能運用AJAX技術，提升使用者體驗
- 前端無複雜邏輯，故使用輕量化Stimulus框架
- 使用Rails框架製作網頁
- 前端檔案中，CSS檔案以Asset Pipeline打包，JavaScript檔案以Webpack打包
- 使用includes與with_attached語法，解決資料庫撈資料時的N+1問題
- 使用Active Storage處理圖檔上傳功能，並使用image processing及libvips處理上傳後之圖檔（libvips較ImageMagick快上10倍，且消耗的記憶體為1/10）
- 使用Froala editor製作文章之文字編輯器
- 使用devise套件製作會員系統功能，並客製化
- 使用aasm（act as state machine）有限狀態機控制文章狀態，將低資料受非預期修改之機率
- 使用friendly id套件，美化網址顯示，並達避免洩漏過多資訊之效果；另使用babosa套件，讓文章標題可以中文顯示在網址中
- 使用paranoia套件，讓文章及留言之刪除功能為軟刪除
- 使用axios串接API
- 使用PostgreSQL資料庫儲存資料

## 聯絡作者
你可以透過email與我聯絡：tamy8677@gmail.com

<i>最後更新：2024.7.9</i>
