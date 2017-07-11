# Cocoa Touch Framework's Design Pattern

## Introduction
* #### Topic
  * Cocoa Touch Framework는 __**어떤 디자인패턴**__ 에 가깝게 구현이 되었을까?

* #### Framework
  * Cocoa Touch Framework의 디자인패턴에 대해 논하기에 앞서 프레임워크에 대한 개념을 알아보았다.

        "소프트웨어의 구체적인 부분에 해당하는 설계와 구현을 재사용이 가능하게끔 일련의 협업화된 형태로 클래스들을 제공하는 것" - 랄프 존슨
  * 덧붙이자면, 프레임워크란 설계의 기반이 되는 부분을 기술한  확장 가능한 기반 코드와
사용자가 이 코드를 자기 입맛대로 확장하는 데 필요한 라이브러리 이 두 가지 요소가 통합되어 제공되는 형태를 말한다.
  * 사용자는 이를 이용해 일정 수준 이상의 품질을 보장받는 코드를, 비교적 빠른 시간에 완성 및 유지 보수할 수 있는 환경을 제공해주는 솔루션으로

        "기본적인 설계나 필요한 라이브러리는 알아서 제공해 줄꺼니깐 넌 그냥 니가 진짜로 하고 싶은 기능 구현에만 전념해!"
  라는 취지에서 만들어진 물건이란 것이다.
* #### Cocoa Touch Framework
  * Cocoa Framework
    * 애플 환경에서 애플리케이션을 제작하기 위한 도구들의 모음
    * Cocoa가 제공하는 도구 중 가장 대표적인 것이 유저 인터페이스(UI)
    * Mac OS X와 iOS의 많은 애플리케이션들이 비슷한 UI를 가지고 있는 이유는 바로 이 Cocoa에서 제공하는 UI 기능들을 사용하기 때문이다.
  * Cocoa Touch Framework
    * Cocoa Framework는 여러 프레임워크들로 이루어져 있는데, 그 중 Cocoa Touch Frmaework는 터치 입력방식을 사용하는 아이폰이나 아이패드를 위한 프레임워크이다.
    * ![Cocoa Touch Framework](img/Cocoa_Touch.jpg "Cocoa_Touch")


## Design Pattern in Cocoa Framework

### MVC-Pattern-like

  * OSX와 iOS 비교 (본문 중)
    ```
    - Model-View-Controller (MVC)
     MVC모델은 코코아 프레임워크의 근간을 이루는 디자인 패턴이다.
     MVC는 모델과 뷰와 컨트롤러를 각각 분리하여 뷰가 변경되거나 모델이 다른 뷰를 이용해야 할 경우에
     Controller만 수정하면 되기 때문에 변경을 국지화 한다.

    XCode에서도 이 MVC가 적용된 것을 알 수 있다.

    - View는 *.xib 파일을 실행하면 Interface Builder가 실행된다.
     View가 코드에서 분리된 것을 알 수 있을 것이다.
     Model과 Controller는 '프로젝트명AppDelegate'이다. 이 부분은 개발자가 Model과 Controller를
     나눠서 프로그램을 개발해야한다. 한마디로 C코드처럼 절차식 언어로 작성하는 것이 아니라 객체지향 언어와
     같이 객체로 구분하여 서로의 역활에 맡게 동작하도록 하라는 것이다.
    ```
  * MVC Pattern에 대한 내용은 이미 다음에 정리하였다. [DesignPattern.md](./DesignPattern.md)
  * 하지만 Cocoa Framework는 전통적인 MVC Pattern과는 다르다. 구조적, 재사용성 등의 문제로 Apple은 MVC를 조금 개선하여 사용하게 되었다.

### Apple's MVC
  * **기대한 Apple's MVC Pattern**
     ![expected_MVC](img/expected_Cocoa_MVC.png "expected_MVC")
           원래 Controller는 Model과 View를 연결시켜주는 역할을 하므로 서로에 대해 알필요가 없다.
           그중에 가장 재사용 불가능한 것이 Controller이며, 우리도 그걸 알고있다. 따라서 우리는 모든
           특이한 로직을 Model이 아닌 Controller에 넣어야한다.
  * **실제 Apple's MVC Pattern**
     ![real_MVC](img/realistic_Cocoa_MVC.png "real_MVC")

            Cocoa MVC는 View Controller를 덩어리를 작성하도록 만들어버린다. 그 이유는 View들의
            라이프 사이클 안에서 뒤엉키는데 그것들을 분리해내기가 어렵기 때문이라고 말한다. 당신이 Model에
            *비지니스 로직이나 데이터 변환같은 것을 없애는 능력을 가졌을 지라도 대부분의 View에서
            반응하면 액션을 Controller로 보내게 될것이다. 뷰 컨트롤러는 결국 모든 것의 델리게이트(delegate)나
            데이터소스(data source)가 될테고, 종종 네트워크 요청과같은 처리도 하고 있을지 모른다.
  * 결국에 [이러한](img/Cocoa_Touch.jpg) 결과를 낳게 된다.

## Conclusion
* #### 개선된 MVC Pattern
  * Apple의 문서를 참고하였을때 Apple이 지향하는 MVC Pattern은 **기존의 MVC모델에서 개선된 형태의 모델**이다.
  * 전통적인 MVC를 개선한 Apple이 기대했던 MVC는 본문에서 보는바와 같이 뷰와 모델이 완전히 분리되어 있으며, 컨트롤러가 중간에서 데이터와 액션을 중재한다.
  * 이를 볼때 Apple이 기대한 MVC Pattern은 controller가 독립적으로 데이터를 주고 받는 것을 볼 때 **MVP Pattern** 에 조금더 가깝다고 생각한다.
  * 그러나 실제 Apple의 MVC 패턴은 본문에서 보는것과 같이 뷰와 컨트롤러가 서로 붙어있고, 거의 대부분의 처리를 하는 것을 봤을 때 기존에 존재하는 MVC, MVP, MVVM와는 거리가 있다고 생각한다.
  * 뷰가 모델로부터 직접 데이터를 얻어오는 것이 아니라, 컨트롤러를 통해 간접적으로 데이터를 얻어오는 방식으로 동작한다.

        이와 같은 MVC패턴을 [“Passive View”](https://medium.com/nspoons/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-architecture-%ED%8C%A8%ED%84%B4-part-1-%EB%AA%A8%EB%8D%B8-%EB%B7%B0-%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC-model-view-controller-881c6fda24d9)라고 부른다.

        이를통해 모델과  뷰의 재사용성을 향상시킬 수 있다. 대신 컨트롤러가 중간에서 모델과 뷰의 상태를 동기화 시키는 역할을 담당한다.

* #### Discussion between Patterns
  * 여기에 완벽한 해답은 없고 아키텍처를 선택하는게 당신의 특별한 상황에서 문제의 비중을 등가교환하게 된다는걸 알게되었음을 의심하지 않는다.
  * 그러므로 한 앱에 다른 아키텍처를 섞어 사용하는것은 자연스러운 일이다. 예를들어 MVC로 시작했지만 어떤 한 화면에서만 MVC로 관리하기 어려워지는 상황이 생기면 그 부분만 MVVM으로 바꿀 수 있다. 이런 아키텍처들은 서로 잘 공존할 수 있기때문에, 다른 화면이 MVC 골격으로 잘 동작하면 바꿀 필요가 없다.

* #### And more.
  * 하지만 실제 iOS의 코코아 터치 프레임워크의 로직을 분석해봤을때, View와 ViewController가 하나의 모듈로써 동작하는 형태의 모델을 가지고 있으며, 이를 분리하기 위해서는 Apple이 지향하는 모델링과는 다른 방식으로 설계를 하는 방법도 공부를 해둬야할거같다.

## 참고자료
* [iOS와 디자인 패턴](http://10apps.tistory.com/153)
* [Introducing iOS Design Patterns in Swift](https://www.raywenderlich.com/86477/introducing-ios-design-patterns-in-swift-part-1)
* [(번역) iOS 아키텍쳐 패턴들](http://blog.canapio.com/43)
* [Cocoa, 그리고 Framework](http://pole2win.tistory.com/entry/Objective-C-cocoa-core-foundation)
* [프레임워크란?](http://jokergt.tistory.com/89)
* [애플 cocoa란 무엇인가??](http://m.blog.naver.com/web4click/110167390575)
* [5 iOS Architectures in 5 minutes](http://slides.com/borlov/arch/fullscreen#/)
* [OSX와 iOS 비교](http://blog.naver.com/PostView.nhn?blogId=huns21&logNo=120193330920&parentCategoryNo=&categoryNo=&viewDate=&isShowPopularPosts=false&from=postView)
* [안드로이드 Architecture 패턴 Part 1: 모델 뷰 컨트롤러 (Model-View-Controller)](https://medium.com/nspoons/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-architecture-%ED%8C%A8%ED%84%B4-part-1-%EB%AA%A8%EB%8D%B8-%EB%B7%B0-%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC-model-view-controller-881c6fda24d9)
