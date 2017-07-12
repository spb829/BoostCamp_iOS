# Delegation Pattern

## Delegation이란?
- 사전적 정의
> 델리게이트 : 대리자, 위임자
무언가를 대신 해주는 것
어떤 객체가 해야하는 일의 일부를 대신 처리한다. 
(완전히 다 대신하는 것은 아니다.)

## Delegation Pattern

Delegation Pattern은 특정 클래스가 하는 일 중 일부를 자신의 커스텀 클래스에서 대신 처리하기 위해 사용하는 패턴으로 UIKit의 UITableViewController, UICollectionViewController, UITextField 등 다양한 클래스에서 사용된다.

- 알아 두어야 할 개념 두가지
    - 처리하라고 시키는 객체, 처리할 객체
    - 처리할 객체가 처리하라고 시키는 객체의 일의 일부를 대신 처리한다.


## 예시 - UITextFieldDelegate
- 처리하라고 시키는 객체 : UITextField
- 처리할 객체 : ViewController

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

UITextField 객체는 중요한 변화(ex: 사용자가 텍스트필드를 눌러서 글쓰기 시작할 때, Return 키를 눌렀을 때 등) 가 있을 때 마다 delegate의 메소드를 호출한다. 사용자는 UITextFieldDelegate에 지정된 함수를 구현함으로서 특정 행동에서 어떠한 처리를 할 수 있게 된다.
`textField.delegate = self` 이 부분이 ViewController를 textField의 대리자로 지정하는 부분이다.(이 부분이 없으면 키보드를 눌러도 `textFieldShouldReturn` 메소드가 실행되지 않는다.)
위와 같이 ViewController에서 UITextFieldDelegate 프로토콜을 구현하면 textField의 delegate로 ViewController로 지정하여 특정 행동을 대신 처리할 수 있게 된다.

## 왜 Delegation을 사용할까?

- 델리게이션을 사용하지 않는다면 어떤 일이 생길까?
    - 택스트 필드의 내용을 일일이 다 객체로 구현해 주어야 한다. 
    - 텍스트 필드가 다 똑같은 일을 하면 문제가 크지 않겠지만, 텍스트 필드가 하는 일은 조금씩 다르다.(알파벳 허용 금지, . 두개 허용 금지 등)
- 각각을 일일이 다 구현해주는 방식보다 프로토콜을 사용하여 정해진 메소드만을 구현하도록 하는 것이 재사용성을 고려할 때 더 좋은 방식이다.  

## Delegation말고 다른 방식은 없을까?




