# Thread

## Introduction
* #### Topic
  * 스레드에 대해 알아보고, 스레드가 필요한 이유에 대해 논의하고, 주된 논의 내용과 결론을 요약해주세요.

* #### Thread
  > 스레드(thread)는 어떠한 프로그램 내에서, 특히 프로세스 내에서 실행되는 흐름의 단위를 말한다. 일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 멀티스레드(multithread)라고 한다.
* #### Process
  > 프로세스(process)는 컴퓨터에서 연속적으로 실행되고 있는 컴퓨터 프로그램을 말한다. 종종 스케줄링의 대상이 되는 작업(task)이라는 용어와 거의 같은 의미로 쓰인다. 여러 개의 프로세서를 사용하는 것을 멀티프로세싱이라고 하며 같은 시간에 여러 개의 프로그램을 띄우는 시분할 방식을 멀티태스킹이라고 한다. 프로세스 관리는 운영 체제의 중요한 부분이 되었다.

## Thread
* #### Process Vs. Thread
  * 스레드는 프로세스의 **구성원** 이다.
  * 멀티프로세스와 멀티스레드는 양쪽 모두 여러 흐름이 동시에 진행된다는 공통점을 가지고 있다. 하지만 멀티프로세스에서 각 프로세스는 독립적으로 실행되며 각각 별개의 메모리를 차지하고 있는 것과 달리 멀티스레드는 프로세스 내의 메모리를 공유해 사용할 수 있다. 또한 프로세스 간의 전환 속도보다 스레드 간의 전환 속도가 빠르다.
  * 멀티스레드의 다른 장점은 CPU가 여러 개일 경우에 각각의 CPU가 스레드 하나씩을 담당하는 방법으로 속도를 높일 수 있다는 것이다. 이러한 시스템에서는 여러 스레드가 실제 시간상으로 동시에 수행될 수 있기 때문이다.
  * 멀티스레드의 단점에는 각각의 스레드 중 어떤 것이 먼저 실행될지 그 순서를 알 수 없다는 것이 있다.

* #### Type of Thread
  * 스레드를 지원하는 주체에 따라 2가지로 나눌 수 있다.
  * #### 사용자 레벨 스레드 (User-Level Thread)
    * 커널 영역의 상위에서 지원 (사용자 레벨의 라이브러리를 이용)
    * 속도가 빠르다.
    * 하나의 스레드가 중단되면 나머지 모든 스레드 역시 중단되는 단점이 존재
      > 이는 커널이 프로세스 내부의 스레드를 인식하지 못하며 해당 프로세스를 대기 상태로 전환시키기 때문이다.

  * #### 커널 레벨 스레드 (Kernel-Level Thread)
    * 운영체제가 지원하는 스레드 기능으로 구현 (커널이 직접 관리)
    * 한 스레드의 중단이 다른 스레드에 영향을 끼치지 않는다.
    * 사용자 스레드에 비해 느리다.

## Discussion
* #### 스레드의 이점
  * 생성, 종료, context switching 비용이 적어 경제적
  * 리소스 공유를 통한 향상된 통신가능
    * 즉, Process와는 다르게 Kernel의 간섭 없이 Thread 간의 빠르게 정보교환을 할 수 있다.
    * Process의 경우 IPC따위를 통해야 하기 때문에 복잡하다.
  * 마지막으로 멀티프로세서 환경에서 매우 유용하다.
    * 각각의 Thread는 다른 프로세서에서 병렬적으로 동작할 수 있다.
* #### 스레드를 사용하는 이유
  * 다중 프로세스와 달리 다중 스레드(멀티스레드)는 같은 메모리 공간을 공유하므로 특히 같은 작업을 동시에 처리하기 위해서 사용 (특히 웹서버)
  * 따라서 다중 프로세스에 비하여 메모리 공간활용이 용이하다.
  * 동시에 여러 개의 하드웨어를 제어하기 위해서.
  * 결국 궁극적인 이유로는 적절히 작업을 배분하여 동시에 처리함으로써 작업 속도를 높이기 위함이다.

## Conclusion
* ### Summary
  * #### Process & Thread
    * 공통점 : Thread와 Process는 스케줄링의 단위가 된다(context switch). 그리고 각각은 logical control flow인 PC를 가지며 동시에 동작한다.
    * 차이점 : Thread는 code, data를 공유하지만 Process는 그렇지 않다. 그리고 생성과 context switching, 종료의 관점에서 Thread가 훨씬 비용이 적게 든다.
  * #### 2가지 레벨의 스레드
    * User-Level Thread
      * 커널의 축소판격인 라이브러리를 통해 스레드를 관리
      * 하나의 스레드가 중단되면 나머지 모든 스레드 역시 중단
      * 속도가 빠르다.
    * Kernel-Level Thread
      * System call을 통해서 스레드를 관리 (커널이 직접 관리)
      * 한 스레드의 중단이 다른 스레드에 영향을 끼치지 않는다.
      * 속도가 느리다.

  * 스레드를 사용하는 궁극적인 이유로는 적절히 작업을 배분하여 동시에 처리함으로써 **작업 속도를 높이기 위함** 이다.

## References
* [위키백과 - 스레드](https://ko.wikipedia.org/wiki/%EC%8A%A4%EB%A0%88%EB%93%9C)
* [Thread 프로그램을 해야하는 이유](https://kldp.org/node/31480)
* [Thread의 장단점](http://knightbw.tistory.com/34)
* [스레드의 개념과 원리](http://www.jiniya.net/wp/archives/5856)


## 예시 1)

* iOS에서 실제로 스레드는 어떻게 사용되고 있는지, Cocoa Touch Framework에는 어떤 경우에 자동으로 새로운 스레드를 만들어주는지 예를 찾아보세요

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

## 예시 2)

```swift
vImage 관련 함수
```

> vImage는 mac OS 에서 나오게 된 고성능 이미지 처리 프레임 워크이다.
> 주로 mac OS에서 사용되는 함수이지만 iOS에서도 호출할 수 있다.
>
> 고해상도의 이미지를 주로 다루기 때문에 vImage 프레임워크의 함수는 대부분 멀티스레딩을 지원한다.
> 이에 대해 개발자가 원한다면 멀티스레딩을 하지 않도록 조정할 수 있다.

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

## iOS 에서의 멀티스레딩

* iOS에서 멀티스레딩을 하기 위한 옵션으로는 3가지가 있다.
  * NSThread
  * GCD(Grand Central Dispatch)
  * NSOperation

* NSThread
  * 스레드를 직접적으로 생성하고 컨트롤 할 수 있다.
  * 주로 스레드에 대해 세밀한 제어가 필요할 때 주로 사용한다.
  * 직접적으로 스레드를 다루는 하위 시스템과의 인터페이스가 필요한 경우에 사용한다.
 
* GCD
   * 동시성을 구현하기 위한 기술 중 하나이다.
   * NSThread에 비해 좀 더 사용하기에 편리하다.
   * 간단한 작업만으로도 백그라운드 스레드에서 작업하거나, 우선순위를 다르게 해서 task를 멀티코어에서 동시 작업할 수 있도록 할 수 있다.
   * 사용하기에 상대적으로 쉽기 떄문에 많이 사용한다.
  
* NSOperation
   * Cocoa API layer 를 사용중인 경우에 사용하는 것이 좋을 수 있다.
   * 조금 더 복잡한 작업이 필요한 경우에 사용하는 것이 좋다.
   * 서브클레싱, 취소 등의 기술을 지원한다.
   * NSOperation는 GCD 기술을 사용하여 구현한 것이다.
