module.exports = {
  'Demo test' : function (browser) {
    console.log('hhhhhh')
    browser
      .url("https://www.google.com")
      // ...
      .pause(10000)
  }
};