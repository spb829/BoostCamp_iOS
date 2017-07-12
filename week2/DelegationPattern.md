## Delegation Pattern

Delegation Pattern은 특정 클래스가 하는 일 중 일부를 자신의 커스텀 클래스에서 대신 처리하기 위해 사용하는 패턴이다.

## 예시 - UITextFieldDelegate

```swift
open class UITextField: UIControl, UITextInput, NSConding, UIContentSizeCategoryAdjusting {
	...
	weak open var delegate: UITextFieldDelegate?
	...
}
```

먼저 UITextField에 정의된 delegate 프로퍼티를 살펴보면 그 타입은 UITextFieldDelegate이다. 이 delegate로 UITextFieldDelegate 프로토콜을 구현한 어떤 클래스를 지정하면 UITextField가 하는 일 중 일부를 delegate로 지정된 클래스에서 처리하게 된다.

```swift
public protocol UITextFieldDelegate : NSObjectProtocol {
	...
	optional public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
	optional public func textFieldDidBeginEditing(_ textField: UITextField)
	...
}
```

UITextFiledDelegate 프로토콜은 8개의 optional function 으로 되어있으며 delegate에서 함수를 구현하여 텍스트필드의 특정 행동을 처리할 수 있다.

```swift
class ViewController: UIViewController, UITextFieldDelegate {
	
	...
	var textField: UITextField = UITextField()

	...
	override func viewDidLoada() {
		super.viewDidLoad()

		textField.delegate = self
	}

	...

	// 사용자가 키보드에서 Return 키를 눌렀을 때 ViewController에서 구현된 함수에서 처리
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
	}
}
```

위와 같이 ViewController에서 UITextFieldDelegate 프로토콜을 구현하면 textField의 delegate로 ViewController로 지정하여 특정 행동을 대신 처리할 수 있게 된다.