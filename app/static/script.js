  // static/script.js
  var socket = io();

  function sendMsg() {
    let msg = document.getElementById("msg").value;
    socket.send(msg);
  }

  socket.on('message', function(msg) {
    let li = document.createElement("li");
    li.innerText = msg;
    document.getElementById("messages").appendChild(li);
  });