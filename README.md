# Formosa訂房網站
+ 此為資展國際(原資策會)期末小組專題，組員人數5人，開發時間一個月
---
### 工作
+ 大致上分為三大區塊(後台/會員/飯店搜尋+下訂)
+ 使用MVC架構
#### 其中負責的部分為:
1. 網站初期架構規劃(draw.io)
2. 資料庫規劃建置(MSSQL/Hibernate)/網站整合
3. 網站整體架構規劃，流程分工安排
4. 飯店空房查詢/條件篩選/地圖
5. 下訂資料匯入資料庫，串接金流API(綠界) 
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



