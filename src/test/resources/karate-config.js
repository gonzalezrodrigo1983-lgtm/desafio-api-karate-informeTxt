function fn() {
  var config = {
    baseUrl: karate.properties['baseUrl'] || 'https://dummyjson.com'
  };
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  return config;
}
