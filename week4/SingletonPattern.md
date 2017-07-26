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

## Conclusion
* ### Summary
  * ####
    *

## References
* [싱글턴 패턴 - 위키백과](https://ko.wikipedia.org/wiki/%EC%8B%B1%EA%B8%80%ED%84%B4_%ED%8C%A8%ED%84%B4)
* [Singleton Pattern in Swift](http://koreyhinton.com/blog/singleton-pattern-in-swift.html)
* [아론 힐리가스의 iOS 프로그래밍: 9장](http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186697153)
