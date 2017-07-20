# 두 단계 초기화 패턴 & 응답 체인 패턴

## 두 단계 초기화 패턴
* Two-Phase Initialization

### 객체 중심 언어에서의 초기화
* 객체가 기본이 되는 객체 중심 언어에서는 **생성자와 객체 초기화가 매우 중요하다.**
* #### 안전한 객체
  * 객체 인스턴스 메모리 할당 검증
  * 객체 내부 리소스를 초기화
* 안전한 객체를 사용함으로써 안전한 프로그램을 설계할 수 있다.


### 초기화 과정
* 코코아 프레임워크의 객체들을 포함해서 NSObject에서 상속받은 모든 클래스의 인스턴스가 만들어지기까지는 두 단계(two-phase)에 걸쳐서 초기화가 이루어진다.

* 1 단계 : 메모리 공간 할당
  * 해당 클래스에 alloc 메시지를 보내서 힙 공간에 객체 인스턴스 메모리 공간을 할당한다.
* 2 단계 : Initialization
  * 객체 인스턴스에 init 메시지를 보내서 객체 인스턴스 속성, 내부에 필요한 객체나 값을 초기화한다.
* Objective-C 예시
  ```c
  Pen *aPen = [[Pen alloc] init];
  ```
  * Pen 클래스에 alloc 메시지를 보내고 init을 호출하는 두 단계를 거친다.
* > Swift의 두 단계 이니셜라이저 과정은 Objective-C의 초기화와 유사하다. 주된 차이점이라면 일 단계에서 Objective-C는 0또는 nil 값을 모든 속성에 할당하는데, Swift의 초기화 과정은 사용자 초기 값을 설정하도록 하게 하여 더 유연해지며, 0 또는 nil이 기본 값으로 유효하지 않은 타입에 대처할 수 있다.

### 지정 초기화 메서드
* Designated Initializer
* 클래스의 주 이니셜라이저는 지정 이니셜라이저로, 클래스의 모든 속성을 완전히 초기화한다. 적합한 슈퍼클래스 이니셜라이저를 호출하여 초기화 과정을 부모클래스로 연쇄하도록 한다.
* 모든 클래스는 하나 이상의 지정 이니셜라이저를 가진다. 지정 이니셜라이저는 깔때기를 통해 초기화 과정의 연쇄를 슈퍼클래스로 진행시킨다.
* Swift Code
  ```swift
  init(parameters) {
    statements
  }
  ```

### 편의 초기화 메서드
* Convenience Initializer
* 편의 이니셜라이저는 호출하는 지정 이니셜라이저 인자에 기본 값으로 설정할 수 있다. 또한 특정 쓰임새나 입력 값 타입을 위한 클래스의 인스턴스를 생성하기 위해 편의 이니셜라이저를 정의할 수 있다.
* 만약 클래스에 편의 이니셜라이저를 쓸 필요가 없다면 사용하지 않아도 된다. 일반적인 이니셜라이저 패턴을 단축할 때 만든 편의 이니셜라이저는 시간을 단축시키거나 클래스의 이니셜라이저 의도를 명확하게 만들 수 있다.
* Swift Code
  ```swift
  convenience init(parameters) {
    statements
  }
  ```

### 네 가지 원칙
* 1. 지정 이니셜라이저는 클래스에 도입된 모든 속성이 슈퍼클래스 이니셜라이저에 위임되기 전에 초기화되는지 확실하게 해야한다.
    * 객체를 위한 메모리는 저장 속성의 초기 상태가 알려져야 완전히 초기화 되었다고 간주한다. 이 규칙에 만족하기 위해선 지정 이니셜라이저는 모든 클래스의 자기 속성이 연쇄를 위로 올리기 전에 초기화되어야 한다.

* 2. 지정 이니셜라이저는 상속받은 속성에 값을 할당하기 전에 슈퍼 클래스 이니셜라이저로 위임해야 한다. 그렇지 않으면 지정 이니셜라이저에 새로운 값은 슈퍼클래스의 초기화로부터 덮어씌여질 것이다.

* 3. 편의 이니셜라이저는 특정 속성에 값을 할당하기 전에 다른 이니셜라이저에 위임해야 하며, 같은 클래스에 정의된 속성을 포함해야 한다. 그렇지 않으면 클래스의 지정 이니셜라이저에 의해 편의 이니셜라이저의 새로운 값이 덮어씌여질 것이다.

* 4. 이니셜라이저는 인스턴스 메소드를 호출할 수 없으며 인스턴스 속성의 값을 읽을 수 있거나 초기화 첫 단계가 완료될 때까지 값으로 self로 참조한다.

* 클래스 인스턴스는 일 단계가 끝나기 전까지 완전히 유효하지 않다. 속성은 접근만 가능하고 메소드는 호출만 가능하다면 클래스 인스턴스는 일단계가 끝나며 유효하게 된다.

### 초기화 연쇄
* Initializer Chaining
* 지정 이니셜라이저와 편의 이니셜라이저의 관계를 간단하게 하기 위해 Swift는 다음 세가지 규칙을 적용하였다.
  * 규칙 1. 지정 이니셜라이저는 직접 관련있는 슈퍼클래스로부터 지정 이니셜라이저를 호출해야 한다.
  * 규칙 2. 편의 이니셜라이저는 같은 클래스에서 다른 이니셜라이저 호출해야 한다.
  * 규칙 3. 편의 이니셜라이저는 지정 이니셜라이저로 끝맺어야 한다.
![init_chain](images/init_chain.png)
* 요약
  * 지정 이니셜라이저는 항상 위로 위임을 한다.
  * 편의 이니셜라이저는 항상 가로질러 위임한다.

--------

## 응답 체인 패턴
* Chain of Responsibility

- UIApplication  객체 : app event queue에 들어온 이벤트를 처리한다.


#### 어플리케이션이 받는 event
- UIControl Actions : Action, target pattern을 사용하여 등록된 action
- User event : touch, shake 등 유저가 발생시킨 이벤트
- System events : low memory, rotation 등의 이벤트

#### UIControl Actions

touch가 아닌 Action

> application이 first responder에게 호출을 전달하고, first responder가 system을 처리하지 못하면 responder-chain을 따라 적절한 responder를 찾는다.

touch Action

> system touch 감지

> -> Application

> -> _touchesEvent  내부 메소드에서 touch event  이벤트를 받는다

> -> 이 이벤트를 sendEvent를 사용하여 UIWindow에 전달

> -> hit tes 진행(touch가 뷰의 범위내에 있는지 확인)

> -> 이 hit test는 최상위 뷰에 도달할때 가지 계속적으로 호출된다.

> 마지막 최상위 뷰에 윈도우가 이벤트를 보낸다


#### 이벤트를 받은 경우 처리 방법 3가지
1. 뷰가 이벤트에 해당하는 메소드를 구현하지 않으면 다음 responder에 전달.
2. 이벤트를 받아 처리하고 superview가 이 이벤트를 받을 수 있도록 super를 호출
3. 위의 메소드를 받고 다음 reponder이 처리 못하도록 한다.

![responder_chain](images/responder_chain.png)

## References
* [[Swift]Initialization 정리](http://minsone.github.io/mac/ios/swift-initialization-summary)
* [Cocoa 와 Cocoa touch responder chain 이해하기
](https://medium.com/@audrl1010/cocoa-%EC%99%80-cocoa-touch-responder-chain%EC%97%90-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-5121d8d707d2)
