# Formosa訂房網站
+ 此為資展國際(原資策會)期末小組專題，組員人數5人，開發時間一個月
---
### 工作
+ 大致上分為三大區塊(後台/會員/飯店搜尋+下訂)
+ (SpringMVC/SpringBoot/Hibetnate/Jpa/Jsp/Ajax)
#### 其中負責的部分為:
1. 網站初期架構規劃(draw.io)
2. 資料庫規劃建置(MSSQL/Hibernate)/網站整合
3. 網站整體架構規劃，流程分工安排
4. 飯店空房查詢/條件篩選/地圖
5. 飯店收藏
6. 下訂資料匯入資料庫，串接金流API(綠界) 
---
## 一.網站初期架構規劃(draw.io)/資料庫規劃
+ 從首頁開始，抓出大致架構需要的按鈕功能和整體流程規劃，大致分為三區塊(後台/會員/飯店搜尋+下訂)
<div display="flex" width="100%">
<img src="https://user-images.githubusercontent.com/106137198/175570242-4ab90b44-6cdf-424a-a77e-85f78cbf670c.png" height="400px">
<img src="https://user-images.githubusercontent.com/106137198/175573064-bbf86ad9-2691-4952-89db-a00dbc003c49.png" height="400px">
</div>

---

## 二.建Beam/JPA/Hibernate
+ 建立JavaBean，對映關係設定
<div display="flex" width="100%">
<img src="https://user-images.githubusercontent.com/106137198/175576442-fc6ab49a-42f1-4656-a880-295a90d28690.png" height="300px">
<img src="https://user-images.githubusercontent.com/106137198/175576740-0c69ffc5-b472-4e4d-8361-61e68b45a468.png" height="300px">
</div>

> 使用@JsonIgnore或是更改get來控制，避免出現無窮迴圈
---

## 三.從前端Jsp首頁功能開始完成
<img src="https://user-images.githubusercontent.com/106137198/175580357-0881268f-038c-4a68-9e27-34aaaae42fc3.png" height="200px">

> autocompelete日期
<img src="https://user-images.githubusercontent.com/106137198/175602353-fade3dee-9475-4031-bf64-13a01335ee71.png" height="200px">

> datepicker控制日期/不可回填/控制間距
<img src="https://user-images.githubusercontent.com/106137198/175604277-8de0bd91-5597-44bf-b1e5-b979af845120.png" height="400px">

> 從資料庫依照訂單數量篩選TOP4於首頁展示
<img src="https://user-images.githubusercontent.com/106137198/175605228-ef4c941c-c50b-4c6d-8333-83413b1c26cb.png" height="400px">

> 使用Vue.js+D3.js製作的地圖區塊展示+搜尋

---

## 四.首頁日期搜尋空房機制
1. 訂單在匯入資料庫時存成所有日期拼接在一起的字串
    + (ex:選擇5/1~5/3，存入資料庫格式為"5/1,5/2,5/3"，之後檢索就是直接用SQL語法 like %日期%)
2. 首頁搜尋時依照選擇的日期，依序搜尋每天的訂單和飯店房間上限做比對
    + 假設選擇入住日期是5/1~5/3
    + 判斷每個房間的房間數量 減掉5/1,5/2,5/3每天的訂單數量 是否大於0，如為true代表有空房
    + 判斷邏輯比較複雜沒辦法直接用SQL語法撈出Page格式，所以是用List撈出所有資料篩選完再轉成Page傳回前端

---

## 五.標籤搜尋
+ 和日期搜尋一樣，飯店在存入資料庫時的標籤會以"tag1,tag2,tag3,..."的字串儲存
+ 搜尋時依照勾選的條件用模糊查詢達到篩選的效果
    
---

## 六.飯店呈現/房間呈現/評論呈現
+ 就簡單的CRUD
<div display="flex" width="100%">
<img src="https://user-images.githubusercontent.com/106137198/175756241-96910107-5bd5-4145-aebb-c6b304a6618f.png" height="180px">
<img src="https://user-images.githubusercontent.com/106137198/175755953-fa376ac4-f34e-4367-8568-e8d51b210f8e.png" height="180px">
<img src="https://user-images.githubusercontent.com/106137198/175756197-1dce187c-81d3-467b-a068-b1c0cdba7f36.png" height="180px">
</div>

---

## 七.飯店收藏
+ 登入後會在飯店顯示頁面和詳細資訊頁面多出愛心標示，點擊即可新增，資料以「HotelId用","隔開存成字串」的形式存入資料庫
<div display="flex" width="100%">
<img src="https://user-images.githubusercontent.com/106137198/175758770-8051dc8a-0e7d-488a-8607-02070fb1cde8.png" width="350px">
<img src="https://user-images.githubusercontent.com/106137198/175758887-02d5c094-b7f4-415a-92c9-e526bf172a56.png" width="310px">
</div>
<img src="https://user-images.githubusercontent.com/106137198/175758792-838615f1-f33d-43ba-b0f6-344e0edaf2b5.png" width="400px">

 
---

## 八.空房選擇+下訂
<img src="https://user-images.githubusercontent.com/106137198/175756843-07902e67-6dd5-469a-a182-1597cba7a7bf.png" width="50%">

> 依照選擇數量，在右方使用jQuery做了及時的統計更新，如果沒選下訂鈕會變成disabled
<img src="https://user-images.githubusercontent.com/106137198/175756976-5ace657a-dc15-4d18-84ee-11865711d450.png" width="50%">

> 選擇數量/房型/總房價呈現，訂房資訊預設為登入的使用者資料
<img src="https://user-images.githubusercontent.com/106137198/175757124-2be043ab-cf5f-40a4-83e2-59aa82916f0c.png" width="50%">

> 最終確認

---

## 九.金流(綠界)
+ 這邊是使用綠界的Api,只實做了信用卡一次付清，參考:https://www.ecpay.com.tw/Content/files/ecpay_011.pdf
+ 完成付款將訂單資料匯入資料庫
 


