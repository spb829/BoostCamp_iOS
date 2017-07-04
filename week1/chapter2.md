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
* Swift3 syntax change

>> 91 페이지

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