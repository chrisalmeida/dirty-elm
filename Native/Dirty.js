// runtime window attributes for example
window.apiBaseUrl = "https://wherever.com"
window.csrfToken = "9283ui4n2k3ned09myCsrfToken"

var _chrisalmeida$dirty_elm$Native_Dirty = function () {
    
    function getApiBaseUrl () {
        if (window.apiBaseUrl && typeof window.apiBaseUrl === "string") {
          return window.apiBaseUrl
        } else {
            return ""
        }
    }

    function getCsrfToken () {
        if (window.csrfToken && typeof window.csrfToken === "string") {
            return window.csrfToken
        } else {
            return ""
        }
    }


    return {
      getCsrfToken: getCsrfToken,
      getApiBaseUrl: getApiBaseUrl
    }
}();
