// example settings
window.apiBaseUrl = "https://wherever.com"
window.csrfToken = "9283ui4n2k3ned09myCsrfToken"
if (window.localStorage.getItem("testKey") != null) {
  window.localStorage.removeItem("testKey")
}

// native module
var _chrisalmeida$dirty_elm$Native_Dirty = function () {
     
    function getApiBaseUrl() {
      return _elm_lang$core$Native_Scheduler.nativeBinding(function(cb){
        if (window.apiBaseUrl && typeof window.apiBaseUrl === "string"){
          cb(_elm_lang$core$Native_Scheduler.succeed(window.apiBaseUrl))
        } else {
           cb(_elm_lang$core$Native_Scheduler.succeed(""))
        }
      })
    }

    function getCsrfToken() {
      return _elm_lang$core$Native_Scheduler.nativeBinding(function(cb){
        if (window.csrfToken && typeof window.csrfToken === "string"){
          cb(_elm_lang$core$Native_Scheduler.succeed(window.csrfToken))
        } else {
           cb(_elm_lang$core$Native_Scheduler.succeed(""))
        }
      })
    }

    function setItemLS(key, value) {
      return _elm_lang$core$Native_Scheduler.nativeBinding(function(cb) {
        window.localStorage.setItem(key, value)
        cb(_elm_lang$core$Native_Scheduler.succeed(key));
      });
    }

    function getItemLS(key) {
      return _elm_lang$core$Native_Scheduler.nativeBinding(function(cb) {
        var item = window.localStorage.getItem(key)
        if (item != null && typeof item === "string") {
          cb(_elm_lang$core$Native_Scheduler.succeed(item));
        } else {
          cb(_elm_lang$core$Native_Scheduler.succeed(""));
        }
      });
    }

    function removeItemLS(key) {
      return _elm_lang$core$Native_Scheduler.nativeBinding(function(cb) {
        window.localStorage.removeItem(key)
        cb(_elm_lang$core$Native_Scheduler.succeed(""));
      });
    }


    return {
      getCsrfToken: getCsrfToken,
      getApiBaseUrl: getApiBaseUrl,
      setItemLS: F2(setItemLS),
      getItemLS: getItemLS,
      removeItemLS: removeItemLS
    }
}();
