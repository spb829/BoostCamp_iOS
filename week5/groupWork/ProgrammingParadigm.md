## Discussion

* ### POP (Protocol Oriented Programing)

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
