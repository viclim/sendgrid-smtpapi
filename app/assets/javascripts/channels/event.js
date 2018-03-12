function hashify(data) {
}

function subscribe(id) {
  App.event = App.cable.subscriptions.create({ channel: "EventChannel", mail_id: id }, {
    received: function(data) {
      const tr = document.createElement('tr');
      const tds = [
        document.createElement('td'),
        document.createElement('td'),
        document.createElement('td')
      ];
      tds[0].innerHTML = data.event;
      tds[1].innerHTML = data.mail_id;
      tds[2].innerHTML = JSON.stringify(data);
      tds.forEach(function(td) {
        tr.append(td);
      });
      const tbody = document.querySelector("#events > .table > tbody");
      if (!tbody) {
        window.location.reload();
        return;
      }
      tbody.append(tr);
    }
  });
}
