# Swift 예제코드 바로잡기

## 2장(영문판 pdf)
> 81 페이지

### 수정 전
```swift
var str = " Hello, playground"
```

### 수정 후
```swift
var greeting = " Hello, playground"
```

### 근거
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage


> 88 페이지

### 수정 전
```swift
var if let r1 = reading1, r2 = reading2, r3 = reading3 {
	let avgReading = (r1 + r2 + r3) / 3
} else {
	let errorString = "Instrument reported a reading that was nil."
}
```

### 수정 후
```swift
var if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
	let avgReading = (r1 + r2 + r3) / 3
} else {
	let errorString = "Instrument reported a reading that was nil."
}
```

### 근거
* Syntax of multiple 'if let' statement has been changed in Swift3


> 91 페이지

### 수정 전
```swift
for var i = 0; i < countingUp.count; ++i {
	let string = countingUp[i]
}
```

### 수정 후
```swift
for i in 0 ..< countingUp.count {
    let countingValue = countingUp[i]
}
```

### 근거
* C-style for statement has been removed in Swift 3
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage


> 94 페이지

### 수정 전
```swift
enum PieType {
	case Apple
	case Cherry
	case Pecan
}
```

### 수정 후
```swift
enum PieType {
	case apple
	case cherry
	case pecan
}
```

### 근거
* Naming convention of Enumeration has been changed in Swift3
	* UpperCamelCase -> LowerCamelCase

## 3장
> 54페이지

### 수정 전
```swift
firstView.backgroundColor = UIColor.blueColor()
...

secondView.backgroundColor = UIColor.greenColor()
```

### 수정 후
```swift
firstView.backgroundColor = UIColor.blue
...

secondView.backgroundColor = UIColor.green
```

### 근거
* UIKit의 UIColor 클래스의 메소드 삭제, 프로퍼티 추가
	* blueColor() -> blue, greenColor() -> green

## 4장
> 83 페이지

### 수정 전
```swift
if let text = textField.text where !text.isEmpty {
    celsiusLabel.text = text
}
else {
    celsiusLabel.text = "???"
}
```

### 수정 후
```swift
if let text = textField.text, !text.isEmpty {
    celsiusLabel.text = text
}
else {
    celsiusLabel.text = "???"
}
```

### 근거
* [optional Binding 에서 where절 제거 -> comma로 문법적 모호성 제거](https://github.com/apple/swift-evolution/blob/master/proposals/0099-conditionclauses.md)

> 84 페이지

### 수정 전
```swift
@IBOutlet var textField : UITextField!
```

### 수정 후
```swift
@IBOutlet var fahrenheitTextField : UITextField!
```

### 근거
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage



### 수정 전
```swift
@IBAction func dismissKeyboard(sender : AnyObject) {
    textField.resignFirstResponder()
}
```

### 수정 후
```swift
@IBAction func dismissKeyboard(sender : AnyObject) {
    fahrenheitTextField.resignFirstResponder()
}
```

### 근거
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage


> 86 페이지

### 수정 전
```swift
var celsiusValue : Double? {
  if let value = fahrenheitValue {
    return (value - 32) * (5/9)
  }
  else {
    return nil
  }
}
```

### 수정 후
```swift
var celsiusValue : Double? {
        if let fahrenheitValue = fahrenheitValue {
            return (fahrenheitValue - 32) * (5/9)
        }
        else {
            return nil
        }
}
```

### 근거
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage


> 88 페이지

### 수정 전
```swift
let numberFormatter: NSNumberFormatter = {
    let nf = NSNumberFormatter()
    nf.numberStyle = .DecimalStyle
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
}()

```
### 수정 후
```swift
let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 1
    return numberFormatter
}()
```

### 근거
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage
* Foundation의 NSNumberFormatter -> NumberFormatter 스위프트 3에서 변경
* Enum의 case 명명법 변경
	* UpperCamelCase -> lowerCamelCase

>91 페이지

### 수정 전
```swift

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  print("Current text : \(textField.text)")
  print("Replacement text : \(string)")
  return true
}
```

### 수정 후
```swift

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  print("Current text : \(String(describing: textField.text))")
  print("Replacement text : \(string)")
  return true
}
```
### 근거
* Using optionals in string interpolation can yield unexpected results


>  92 페이지

### 수정 전
```swift

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
  let replacementTextHasDecimalSeparator = string.rangeOfString(".")

  if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
    return false
  }
  else {
    return true
  }
}
```

### 수정 후
```swift

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
  let replacementTextHasDecimalSeparator = string.range(of: ".")

  if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
    return false
  }
  else {
    return true
  }
}
```
### 근거
* Swift API Design Guidelines
	* Promote Clear Usage
		* Omit needless words
	* Strive for Fluent Usage
		* Prefer method and function names that make use sites form grammatical English phrases.

## 5장

## 6장
> 114 페이지

### 수정 전
```swift
segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
```

### 수정 후
```swift
segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
```

### 근거
* UIKit의 UIColor 클래스의 메소드 삭제, 프로퍼티 추가
    * greenColor() -> green
        * colorWithAlphaComponent(0.5) -> withAlphaComponent(0.5)
* Swift API Design Guidelines
    * Naming
        * Promote Clear Usage


> 115 페이지

### 수정 전
```swift
let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
let trailingConstraint = segmenedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
```

### 수정 후
```swift
let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
let leadingConstraint = segemtedControl.leadingAnchor.constraint(equalTo: view,leadingAnchor)
let trailingConstraint = segmentedContrl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
```

### 근거
* Swift API Design Guidelines
    * Strive for Fluent Usage
        * Prefer method and function names that make use sites form grammatical English phrases.


> 115 페이지

### 수정 전
```swift
func constraintEqualToAnchor(anchor: NSLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint!
```

### 수정 후
```swift
func constraint(equalTo anchor: NSLayoytanchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint
```

### 근거
* Swift API Design Guidelines
    * Strive for Fluent Usage
        * Prefer method and function names that make use sites form grammatical English phrases.


> 116 페이지

### 수정 전
```swift
topConstraint.active = true
leadingConstraint.active = true
trailingConstraint.active = true
```

### 수정 후
```swift
topConstraint.isActive = true
leadingConstraint.isActive = true
trailingConstraint.isActive = true
```

### 근거
* bool값을 리턴하는 active 함수 변경
    * active -> isActive
* Swift API Design Guidelines
    * Strive for Fluent Usage
        * Prefer method and function names that make use sites form grammatical English phrases.


> 118 페이지

### 수정 전
```swift
let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
```

### 수정 후
``` swift
let topConstraint = segmentedContrl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
```

### 근거
* Swift API Design Guidelines
    * Promote Clear Usage
        * Omit needless words.
    * Strive for Fluent Usage
        * Prefer method and function names that make use sites form grammatical English phrases.


> 119 페이지

### 수정 전
```swift
let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
```

### 수정 후
```swift
let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
```

### 근거
* Swift API Design Guidelines
    * Promote Clear Usage
        * Omit needless words.
    * Strive for Fluent Usage
        * Prefer method and function names that make use sites form grammatical English phrases.


> 120 페이지

### 수정 전
```swift
NSLayoutAttribute.Left
NSLayoutAttribute.Right
NSLayoutAttribute.Leading
NSLayoutAttribute.Trailing
NSLayoutAttribute.Top
NSLayoutAttribute.Bottom
NSLayoutAttribute.Width
NSLayoutAttribute.Height
NSLayoutAttribute.CenterX
NSLayoutAttribute.CenterY
NSLayoutAttribute.FirstBaseline
NSLayoutAttribute.LastBaseline

NSLayoutAttribute.LeadingMargin
```

### 수정 후
```swift
NSLayoutAttribute.left
NSLayoutAttribute.right
NSLayoutAttribute.leading
NSLayoutAttribute.trailing
NSLayoutAttribute.top
NSLayoutAttribute.bottom
NSLayoutAttribute.width
NSLayoutAttribute.height
NSLayoutAttribute.centerX
NSLayoutAttribute.centerY
NSLayoutAttribute.firstBaseline
NSLayoutAttribute.lastBaseline

NSLayoutAttribute.leadingMargin
```

### 근거
* Coding convention of enumeration has been changed in Swift3
    * UpperCamelCase -> LowerCamelCase


> 120 페이지

### 수정 전
```swift
attribute: .Width
attribute: .Equal
attribute: .Height
```

### 수정 후
```swift
attribute: .width
attribute: .equal
attribute: .height
```

### 근거
* Coding convention of enumeration has been changed in Swift3
    * UpperCamelCase -> LowerCamelCase


> 122 페이지

### 수정 전
```swift
segmentedControl.addTarget(self,
                        action: "mapTypeChanged:",
                        forControlEvents: .ValueChanged)
```

### 수정 후
```swift
segmentedControl.addTarget(self,
                        action: #selector(MapViewController.mapTypeChanged(_:))
                        for: .valueChanged)
```

### 근거
* Coding convention of enumeration has been changed in Swift3
    * UpperCamelCase -> LowerCamelCase
* Compile-time checked selectors
    * Swift 2.2 deprecates using strings for selectors and instead introduces new syntax: #selector
        * check your code at compile time to make sure the method you want to call actually exists


> 122 페이지

### 수정 전
```swift
func mapTypeChnaged(segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
        mapView.mapType = .Standard
    case 1:
        mapView.mapType = .Hybrid
    case 2:
        mapView.mapType = .Satellite
    default:
        break
    }
}
```

### 수정 후
```swift
func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
        mapView.mapType = .standard
    case 1:
        mapView.mapType = .hybrid
    case 2:
        mapView.mapType = .satellite
    default:
        break
    }
}
```

### 근거
* Coding convention of enumeration has been changed in Swift3
    * UpperCamelCase -> LowerCamelCase
* 전달인자 레이블 간소화
    * segControl이 외부에서 보이지 않도록 변경
