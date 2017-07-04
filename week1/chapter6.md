
## 6장
> 113 페이지

### 수정 전
```swift
segmentedControl.backgroundColor
= UIColor.whiteColor().colorWithAlphaComponent(0.5)
```

### 수정 후
```swift
segmentedControl.backgroundColor
= UIColor.white.withAlphaComponent(0.5)
```

### 근거
* UIKit의 UIColor 클래스의 메소드 삭제, 프로퍼티 추가
    * greenColor() -> green
        * colorWithAlphaComponent(0.5) -> withAlphaComponent(0.5)