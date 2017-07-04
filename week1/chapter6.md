
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
*


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
*


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
*


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
*


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
*


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
*


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
*


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
*


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

