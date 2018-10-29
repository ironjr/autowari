var himawari = require('../index');

himawari({
  zoom: 5,
  date: 'latest',
  success: function () {
    console.log("Complete!");
    process.exit();
  },
  chunk: function (info) {
    console.log('COMPLETE', (info.part+'/'+info.total), '(' + ((info.part / info.total)*100).toFixed(0)+'%' + ')');
  }
});
