# Swift 예제코드 바로잡기

## 4장
> 83 페이지

### 수정 전
```swift
if let text = textField.text where !text.isEmpty {
    celsiusLabel.text = text
}
else {
    celsiusLabel.text = "???"
}```

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
