(function(window) {
  window.environment = window.environment || {};

  switch (window.location.hostname) {
    case 'localhost':
      window.environment.BASE_URL = 'http://localhost:3000/v1';
      break;
    default:
      window.environment.BASE_URL = 'http://api.luxdgo.com/v1';
      break;
  }
})(this);
