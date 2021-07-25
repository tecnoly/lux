(function(window) {
  window.environment = window.environment || {};

  switch (window.location.hostname) {
    case 'localhost1':
      window.environment.BASE_URL = 'http://localhost:3000/api';
      break;
    default:
      window.environment.BASE_URL = 'http://api.luxdgo.com/v1';
      break;
  }
})(this);
