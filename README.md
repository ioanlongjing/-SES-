SJU Smart Embedded Systems 期中考
=================================

因為要目前溫度, 用GY-80 連接到Intel Galileo Gen II （接線圖如附圖）

之後用Node.JS 接收Galileo Gen II 傳來的東西

最後把資料扔到iOS 的APP 裡


### `前置作業`


`Node.JS`
  - Node.JS [Download](https://nodejs.org/)

`Arduino`
  - Arduino [Download](http://www.arduino.cc/en/Main/Software)

`Lib`
  - Adafruit Sensor Libraray [Download](https://github.com/adafruit/Adafruit_Sensor)

`Unified`
  - Adafruit BMP085 Unified [Download](https://github.com/adafruit/Adafruit_BMP085_Unified)
 
 `Mac 安裝網頁伺服器`
  - $ npm install servi

 `Node.js`
  - node serial2web.js 
  #修改/dev/"cu.usbmodemXXX", 就能以port 8080 傳給Web Client


