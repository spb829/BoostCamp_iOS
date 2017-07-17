
## 스레드

* iOS에서 실제로 스레드는 어떻게 사용되고 있는지, Cocoa Touch Framework에는 어떤 경우에 자동으로 새로운 스레드를 만들어주는지 예를 찾아보세요


### 예시1)
```swift
URLSession
```
> 하나의 앱에는 하나의 프로세스가 실행된다. 그리고 그 프로세스 내부에서는 여러개의 스레드가 실행된다.
앱이 기동되면 최초로 메인스레드가 실행된다. 이 메인스레드는 이벤트 루프를 돌며 이벤트가 있을 때마다 함수를 호출시킨다.
앱은 보통 메인스레드로 실행되기 때문에 되도록이면 어플의 작동이 일시적으로 멈추게 해서는 안된다.
> 
> 메인스레드는 앱의 실행과 긴밀한 관련성이 있기 때문에, 
이미지를 불러들인다거나 서버에서 데이터를 받아올 때 메인스레드를 끌어다 사용하면
해당 작업이 끝나기 전까지 앱의 작동이 일시적이 멈출 수 있다.
> 
> 앱의 멈춤현상을 해결하기 위해서 메인스레드가 아닌 다른 스레드를 끌어와 작업시간이 긴 일을 처리하도록 하는데,
이것을 멀티스레드라고 한다. 즉, 메인스레드는 화면처리나 기본적인 어플의 작동을 하도록 하고,
다른 스레드에서는 오래 걸리는 일을 하도록 시키는 것이다.
> 
> 인터넷에서 데이터를 받아오는 객체에는 `URLSession`이 있다. 
이는 스레드를 따로 코드로 작성하여 생성하지 않아도 해당 클래스 내부에서 멀티스레드 작업을 대신한다.
> 
> 스레드에는 우선순위가 있는데, 메인스레드의 우선순위가 가장 높고 다른 스레드는 보통이거나 낮다.
다른 스레드의 우선순위를 지정할 수 있지만, 이들의 우선순위가 높을 수록 메인스레드의 속도가 느려진다는 부작용이 있다.

### 코드
```swift
  var dataTask: URLSessionDataTask?
  
  func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
    dataTask?.cancel()
    
    if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
      urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
      guard let url = urlComponents.url else { return }
      dataTask = defaultSession.dataTask(with: url) { data, response, error in
        defer { self.dataTask = nil }
        if let error = error {
          self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
        } else if let data = data,
          let response = response as? HTTPURLResponse,
          response.statusCode == 200 {
          self.updateSearchResults(data)
          DispatchQueue.main.async {
            completion(self.tracks, self.errorMessage)
          }
        }
      }
      dataTask?.resume()
    }
  }
```