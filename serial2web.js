/*
 * From https://itp.nyu.edu/physcomp/labs/labs-serial-communication/lab-serial-communication-with-node-js/#content
 * We need HelloWorld.ino or serial2key.ino on the arduino side.
 */
var serialport = require('serialport'),// include the library
   SerialPort = serialport.SerialPort, // make a local instance of it
   // get port name from the command line:
   // portName = process.argv[2];
   portName = "/dev/cu.usbmodemfa131";
// Then you open the port using new() like so:

var latestData = 0;
var servi = require('servi');

var myPort = new SerialPort(portName, {
   baudRate: 9600,
   // look for return and newline at the end of each data packet:
   parser: serialport.parsers.readline("\r\n")
 });

myPort.on('open', showPortOpen);
myPort.on('data', saveLatestData);
myPort.on('close', showPortClose);
myPort.on('error', showError);

// Write the callback functions for these events like so:

function showPortOpen() {
   console.log('port open. Data rate: ' + myPort.options.baudRate);
}

function saveLatestData(data) {
   console.log(data);
   latestData = data;
}

function showPortClose() {
   console.log('port closed.');
}

function showError(error) {
   console.log('Serial port error: ' + error);
}

// $ node index.js portname -- I've changed it to serial2web.js and arduino port

var app = new servi(false); // servi instance
app.port(8080);             // port number to run the server on

// configure the server's behavior:
app.serveFiles("public");     // serve static HTML from public folder
app.route('/data', sendData); // route requests for /data to sendData()
// now that everything is configured, start the server:
app.start();

function sendData(request) {
  // print out the fact that a client HTTP request came in to the server:
  console.log("Got a client request, sending them the data.");
  // respond to the client request with the latest serial string:
  request.respond(latestData);
}
//
