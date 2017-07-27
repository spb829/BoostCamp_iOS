# Singleton Pattern

## Introduction
* #### Singleton Pattern?
  > 소프트웨어 디자인 패턴에서 싱글턴 패턴(Singleton pattern)을 따르는 클래스는, 생성자가 여러 차례 호출되더라도 실제로 생성되는 객체는 하나이고 최초 생성 이후에 호출된 생성자는 최초의 생성자가 생성한 객체를 리턴한다. 이와 같은 디자인 유형을 싱글턴 패턴이라고 한다. 주로 공통된 객체를 여러개 생성해서 사용하는 DBCP(DataBase Connection Pool)와 같은 상황에서 많이 사용된다.

## Singleton Pattern In Swift
* 일반적인 방법
  > 싱글턴 패턴을 구현하기 위해서는 객체는 오로지 하나만 생성되고 이후에는 해당 객체가 리턴되는 방식이여야한다.
  >
  > 기존 Objective-C에서는 GCD에서 제공하는 dispatch_once를 활용하여 단 한번만 실행되는 코드 블록을 지정하는 방법으로 싱글턴 패턴을 구현하였다.
  >
  > 이 방식은 Thread-Safe 하며, OS가 모든 것을 관리해준다는 장점을 가지며 이를 Swift에서 그대로 구현하면 다음과 같다.

  ``` Swift
  class SingletonExample {
    class var sharedInstance: SingletonExample {
      struct Static {
        static var onceToken: dispatch_once_t = 0
        static var instance: SingletonExample? = nil
      }
      dispatch_once(&Static.onceToken) {
        Static.instance = SingletonExample()
      }
      return Static.instance!
    }
  }
  ```

* Swift 1.2버전 이후
  > “The lazy initializer for a global variable (also for static members of structs and enums) is run the first time that global is accessed, and is launched as ‘dispatch_once’ to make sure that the initialization is atomic. This enables a cool way to use ‘dispatch_once’ in your code: just declare a global variable with an initializer and mark it private.”
  >
  > \- Apple's Swift Blog
  >

  > 위의 애플 블로그의 글을 통해 알 수 있듯이 글로벌 변수를 private으로 선언하게 되면 'dispatch_once' 가 보장됨을 알 수 있다.
  >
  > 또한 스위프트 1.2버전 이후에 class 내에서 static variable을 지원하게 되면서 위의 코드를 다음과 같이 쉽게 만들 수 있게 되었다.

  ``` Swift
  class SingletonExample {
    static let sharedInstance = SingletonExample()
  }
  ```

  > 이후에 해당 객체를 필요한 경우에 호출하여 편하게 사용할수 있다.

## Refactoring Sigleton Usage un Singleton
보통의 싱글톤은 널리 권장되지 않는다. 그 이유로는 싱글톤 사용에서는 테스트가 어렵거나 불가능하고, 묵시적으로 다른 클래스에서 사용하면 코드베이스가 헝클어져버린다. 또, 싱글톤은 코드의 재사용도 어렵게 만든다. 오랫동안 싱글톤은 전역변수나 가변 상태의 변형에 지나지 않는다고 생각해왔다. 적어도 많은 사람들은 이 방법이 나쁜 방법이라는 것 정도는 인지 하고 있다.

그러나, 때로는 싱글톤은 피할 수 없는, 필요한 독이기도 하다.
이것을 어떻게 깔끔하고 모듈화되고 테스트 용이하게 스위프트에서 사용할 수 있을까?


### Singleton is Everywhere

> 애플 플랫폼에서 싱글톤은 Cocoa와 Cocoa Touch 프레임워크 어디에나 있다. UIApplication.shared, FileManager.default, NotificationCenter.default, UserDefaults.standard, URLSession.shared 등이 있다. 또한 이 디자인 패턴은 Cocoa Core Competencies 가이드의 한 섹션으로 나와있다.

> 여러분이 묵시적으로 저 싱글톤(혹은 여러분의 싱글톤)을 참조할때 여러분의 코드를 변경하는데 드는 노력이 증가할 것이다. 싱글톤을 사용하는 클래스에서 싱글톤을 변경하거나 목(mock) 할 수 있는 방법이 없기 때문에 여려분의 코드를 테스트하기 어려워지거나 불가능해진다. 아래는 iOS 앱에서 일반적으로 볼 수 있는 것이다.

```swift
class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let currentUser = CurrentUserManager.shared.user
        if currentUser != nil {
            // do something with current user
        }

        let mySetting = UserDefaults.standard.bool(forKey: "mySetting")
        if mySetting {
            // do something with setting
        }

        URLSession.shared.dataTask(with: URL(string: "http://someResource")!) { (data, response, error) in
            // handle response
        }
    }
}
```
> 이것이 묵시적인 참조이다(클래스 안에서 직접 싱글톤을 사용한다). 더 나아지게 할 수 있는데, 스위프트로 가볍고 쉬우며 의존성을 줄이는 방법이 있다. 또한 스위프트로 우아하게 만들 수도 있다.

### 의존성 주입
> 짧게 말해, 답은 의존성 주입이다. 이 원리는 여러분의 함수와 클래스를 모든 입력이 명시적으로 되게 설계하는 방법이다. 위의 코드를 의존성 주입을 사용하여 리팩토링 한다면 아래처럼 생겼을 것이다.

```swift
class MyViewController: UIViewController {

    let userManager: CurrentUserManager
    let defaults: UserDefaults
    let urlSession: URLSession

    init(userManager: CurrentUserManager, defaults: UserDefaults, urlSession: URLSession) {
        self.userManager = userManager
        self.defaults = defaults
        self.urlSession = urlSession
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let currentUser = userManager.user
        if currentUser != nil {
            // do something with current user
        }

        let mySetting = defaults.bool(forKey: "mySetting")
        if mySetting {
            // do something with setting
        }

        urlSession.dataTask(with: URL(string: "http://someResource")!) { (data, response, error) in
            // handle response
        }
    }
}
```
> 이 클래스는 이제 더이상 모든 싱글톤에 묵시적으로 의존하지 않는다. 이것은 명시적으로 CurrentUserManager, UserDefault, URLSession에 의존한다. 그러나 이런 의존성들이 이것들이 싱글톤이라는 것을 이 클래스는 전혀 모른다. 이런 세부사항들은 기능이 바뀌지 않은채 문제가 없다. 뷰컨트롤러는 단이 이 오브젝트의 인스턴스가 존재한다는 사실만 알고있고, 호출 시점에서 싱글톤을 담아 보낼 수 있다.


## References
* [싱글턴 패턴 - 위키백과](https://ko.wikipedia.org/wiki/%EC%8B%B1%EA%B8%80%ED%84%B4_%ED%8C%A8%ED%84%B4)
* [Singleton Pattern in Swift](http://koreyhinton.com/blog/singleton-pattern-in-swift.html)
* [아론 힐리가스의 iOS 프로그래밍: 9장](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186697153)
