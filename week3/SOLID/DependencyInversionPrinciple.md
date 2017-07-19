# The Dependency Inversion Principle

***A. High level modules should not depend upon low level modules. Both should depend upon abstractions.***
***하이 레벨 모듈은 로우레벨 모듈에 의존해서는 안된다. 둘 다 추상에 의존해야 한다.***

***B. Abstractions should not depend upon details. Details should depend upon abstractions.***
***추상은 상세를 의존해서는 안된다. 상세는 추상을 의존해야 한다.***

DIP는 재사용성을 위한 중요한 원칙이다. DIP는 OCP(Open-Closed Principle)과 비슷한 접근을 가진다. 깨끗한 구조를 가지기 위해서는 의존성을 해제해야 한다.

```swift
class Handler {
	let fm = FilesystemManager()

	func handle(string: String) {
		fm.save(string: String)
	}
}

class FilesystemManager {
	func save(string: String) {
		
	}
}
```

FilesystemManager 클래스는 로우 레벨의 모듈로 다른 프로젝트에서 재사용하기 매우 편리하다. 문제는 하이 레벨 모듈인 Handler이다. Handler는 FilesystemManager와 강하게 결합되어 있기 때문에 재사용성이 좋지 않다. 

여기서 의존성을 해제하기 위해 Storage 프로토콜을 사용할 수 있다. 이 방법에서 Handler는 이 abstract protocol을 사용하여 어떤 종류의 storage든 사용할 수 있게 된다. 이렇게 접근하면 우리는 쉽게 filesystem을 교쳉할 수 있다.

```swift
class Handler {
	let storage: Storage

	init(storage: Storage) {
		self.storaga
	}

	func handle(string: String) {
		storage.save(string: string)
	}
}

protocol Storage {
	func save(string: String)
}

class FilesystemManager: Storage {
	func save(string: String) {
		// Save file
	}
}

class DatabaseManager: Storage {
	func save(string: String) {

	}
}
```

이 원칙은 테스팅에도 매우 유용하다. 우리는 쉽게 Storage 프로토콜을 구현한 클래스를 사용하고 테스팅 할 수 있다.

```swift
class StubStorage: Storage {
	var isSavedCalled = false

	func save(string: String) {
		isSavedCalled = true
	}
}

class HandlerTests {
	func test_Handle_IsSaveCalled() {
		let handler = Handler()
		let stubStorage = StubStorage()

		handler.handle(string: "test", storage: stubStorage)

		XCTAssertTrue(stubStorage.isSavedCalled)
	}
}
```