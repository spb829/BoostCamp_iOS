# Swift

## Introduction

* ### Topic

  * 이미 알고있던 언어와 Swift와의 다른 점에 대해 정리해봅시다봅시다.
    * 기존의 언어에 없던 기능/문법
    * 기존의 언어에서 불편했던 점이 어떻게 해결되었을까?
    * 등등
  * Swift의 특징을 살릴 수 있는 프로그래밍 방법엔 무엇이 있을까요?
  * 제한시간 : 60분


## Swift

> Swift는 C 언어 그리고 Objective-C 언어의 좋은 점들을 취합한 것을 기반으로 C 언어 호환성 에 대한 제약 없이 주로 iOS와 OS-X 앱을 개발 하기 위한 언어다. Swift는 안전한 프로그래밍 패 턴을 채용했고 프로그래밍을 더 쉽고, 유연하게 만들었다.

![Swift](Images/Swift.png)

* ### 특징

  > 애플은 Swift를 위해 현존하는 진보한 컴파일러, 디버거, 프레임워크 기반의 토대를 만들었다.
  >
  > ARC(Auto Reference Counting)로 메모리 관리를 단순화 했고 Foundation(Apple Foundation Framework)과 코코아의 견고한 기초를 기반으로 만들어진 프레임워크 스텍은 최신화와 표준화의 결과물이다.
  >
  > Objective-C는 블록 방식 코딩, 문자 집합, 모듈, 혼란없는 최신 언어 기술 프레임워크 적용 가능 등을 지원하도록 발전해왔다.
  >
  > 이전 세 대의 언어인 Objective-C의 단점을 보완하며 새로이 설계된 Swift는 같은 LLVM컴파일러로 빌드되며 같은 런타임을 사용한다.
  >
  > 클로저, 다중 리턴 타입, 네임스페이스, 제네릭스, 타입 인터페이 스 등 Objective-C에는 없었던 현대 프로그래밍 언어가 갖고 있는 기능을 많이 포함시켰으며, 이 에 따라 일정한 성능향상을 보이고 있다.
  >
  > 스위프트는 빠른 성능을 위해 Compile-time method binding, Strong typing and compile time optimization, Memory layout optimization 기술을 적용해 설계 되었다.

## C++ VS Swift

### 

* 스위프트는 인터프리터로 실행 가능!
  * c++과 스위프트 둘 다 컴파일언어지만, 스위프트는 인터프리터로 바로 실행이 가능하다.
스위프트는 인터렉티브 플레이그라운드가 존재하는데 이걸 인터프리터 기반이라고 볼 수 있다.
이렇게 좌측화면에서 코딩을 하면 우측에 화면에 한줄 씩 바로 결과를 확인할 수 있어서 
반복적인 디버깅 장업을 비쥬얼적인 형태로 바로 볼 수 있어서 빠르게 결과를 얻는데 도움을 준다.

* C++에서는 메모리 주소를 가리키기 위해 포인터를 사용했다.
  * Swift에서 레퍼런스 타입의 인스턴스를 가리킬 때 사용되는 상수/변수는 포인터와 비슷하지만,
 메모리 주소를 직접적으로 가리키는 것도 아니고, 별표(*)를 붙이지 않아도 된다.
 
 * 스위프트는 헤더 파일을 사용하지 않는다.
   * C++은 전처리를 위해 헤더파일과 소스파일이 분리되어있다.
   * 헤더파일안에는 함수의 원형과 전역변수들의 선언들이 있고, 이것들을 사용하기위해 파일들을 읽어온다.
   * 그러나 스위프트에서는 전처리를 위한 헤더파일을 사용하지 않는다.
   * 하나로 통합된 스위프트 파일 내에서 함수와 전역변수, 클래스와 구조체를 선언하고 자유롭게 사용할 수 있다.


### 그밖의 비교
  * 스위프트는 신생언어라 써드파티 지원이 약하다
    * c++ 은 네트워크나 그래픽 사용자 인터페이스 같은 걸 사용하기 용이
    * 프로그래밍에서의 서드파티란 프로그래밍을 도와주는 Plug_in 이나 library 등을 만드는 회사


## JAVA

* ### 특징
  * 객체 지향을 적극적으로 사용하며 저수준 작업들을 자동으로 처리해 주는 고수준 언어이고, 심지어 다른 고수준 언어들에 비해 빠른 편이다.
  * 바이트 코드인 클래스 파일을 생성하고, 이 파일을 일종의 에뮬레이터인 Java 가상 머신(JVM)이 해석하여 실행한다.
  * 태생적으로 타고난 장점으로 플랫폼에 독립적인 언어지만 동시에 메모리 관리에 타고난 약점을 가지게 되었다.


## Discussion

* ### Topic

  * #### 기존의 언어에 없던 기능/문법

  * #### 기존의 언어에서 불편했던 점이 어떻게 해결되었을까?

  * ### Swift의 특징을 살릴 수 있는 프로그래밍 방법은?

* ### POP (Protocol Oriented Programing)
  * 불변
C++ :
```C++
class Puter {
void compute(obj *ptr);
void compute(const Obj *ptr);
void compute(Obj * const ptr);
void compute(const Obj * const ptr);
void compute(const Obj * const ptr) const;
};
```


```swift
var dateString = formatter.stringFromDate(date)
// vs
let dateString = formatter.stringFromDate(date)
```

* 옵셔널 : 타입 세이프한 언어이다.컴파일시에 nil 체크를 수행함으로써 잠재적인 에러를 탐지할 수 있다.

* 문자열 :  "+="를 사용하여 문자열을 쉽게 연결하고, "isEqualToString :" 대신 "=="을 사용하여 문자열을 비교할 수 있다.

* generic : 제네릭을 제공한다.


* OOP의 장점
    * 캡슐화 : 속성과 속성을 제어하는 행위를 모아 은닉할 수 있다.
    * 접근제어 : private, protected, public키워드를 이용해 접근을 제어할 수 있다.
    * 추상화 : 객체의 공통 속성과 행위를 추출할 수 있다.
    * 다형성 : 하나의 형태를 사용하여 객체를 여러 타입으로 사용할 수 있다.
    * 상속 : 상위 클래서의 속성과 행위를 그대로 물려받을 수 있다.

* OOP의 단점
    * 암시적 공유 : 의도하지 않았는데, 상속했다는 이유로 모든 속성과 행위를 공유한다.
    * 단일체 : 단 하나의 부모만 존재한다. 추가적인 기능 구현으로 클래스의 덩치가 무한대로 커질 수 있다.
    * 클래스 타입 관계 문제 : 복잡한 상속 구조를 지닌 클래스 참조 또는 연산을 수행할 때 임의 클래스의 올바른 타입을 얻기 위해 down-cast 해야 한다.

* Mixin Pattern
    * Mixin 패턴은 상속이 아닌 포함의 구조를 가진다.
    * Mixin 패턴의 장점은 복잡한 상속 구조의 애매함을 피할 수 있으며 행위를 분리함으로써 명확하고 다양한 인터페이스를 사용할 수 있다.

* Swift에서 제공하는 POP
    * Protocol extension
    * Swift는 기능을 분리하여 Protocol extension 을 생성한다.
    * Protocol extension 간에 연관성이 없기 때문에 암시적 공유가 발생하지 않는다.
    * Protocol은 Value Type이기 때문에 연산을 할 때 down-cast가 필요하지 않다.

## References

* [Go vs Swift vs C++ microbenchmark](http://lionet.livejournal.com/137511.html)
* [COMPARISON OF MODERN C++ AND APPLE’S SWIFT PROGRAMMING LANGUAGE SYNTAX](https://blog.michaelckennedy.net/2014/12/08/comparison-of-modern-c-and-apples-swift-programming-language-syntax/)
* [BenchmarkInMultipleLanguages](https://github.com/spb829/BenchmarkInMultipleLanguages)
* [Java vs Swift detailed comparison as of 2017 - Slant](https://www.slant.co/versus/112/6521/~java_vs_swift)
* [10 things you should know about Apple's Swift](http://www.javaworld.com/article/2456964/java-ios-developer/10-things-you-should-know-about-apples-swift.html)
