# Swift 예제코드 바로잡기

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
