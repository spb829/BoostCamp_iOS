# 디자인 패턴
## 디자인 패턴이란?

- 개발할때 자주 나타나는 문제들을 해결하기 위한 방법 중 하나. 과거에 자주 발견된 경험들을 축적하여 이름을 붙이고 이후에 재사용하기에 좋은 형태로 규약을 묶어 정리한 것이다. 

-  소프트웨어를 개발하다 보니 구현 코드는 달라도 유사한 문제가 발생하는데, 그 때 패턴을 사용하게 되고, 개발 관련자들 사이에 의사소통 도구로 사용된다.

- 디자인 패턴의 예시
    - MVC, MVVM, MVP (iOS 아키텍쳐 패턴)
    - 빌더 패턴, 팩토리 메서드 패턴, 프로토타입 패턴, 싱글턴 패턴(Gang of four 패턴)

- 이 뒤로 보게 될 MVC, MVVM, MVP는 iOS 아키텍쳐 패턴에 대한 내용이다.
- 구조적인 것만 디자인 패턴은 아니다.(디자인 패턴이 아키텍쳐 패턴보다 훨씬 넓은 개념)


# MVVM이란?

### 탄생 배경
- MVVM은 마이크로소프트에서 탄생한 개념으로 기존의 MVC, MVP 모델의 단점을 개선하고, User Interface의 Event Driven Programming을 간소화하기 위하여 개발되었다.
Presentation Design Pattern의 변형

### 주 목적
- View의 의존성을 완전히 제거
- MVC에서는 View와 Model, Controller간의 의존성이 존재하며, MVP에서는 View와 Presenter간의 의존성이 존재
- Data Binding을 통해 View와 ViewModel을 연결
- property 수준에서의 연결
- Unit Test에 용이

### 구성 요소
- View, Model은 기존의 MVC, MVP와 동일
- ViewModel
    - View의 추상화
    - View와 독립적인 상태

### 단점
- 마이크로소프트에서 개발했기 때문에 다른 플랫폼에서 binding을 구현하기 위해선 번거로운 작업을 따로 거쳐야한다.
- Cocoa 프레임워크는 주로 ReactiveCocoa를 통해 구현
