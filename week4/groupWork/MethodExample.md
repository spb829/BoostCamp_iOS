## 예시

### HTTP GET http://openapi.naver.com/v1/search/book_adv.json/d_title={query}

Content-Type -> application/json; charset=UTF-8

```json
[
	"books": [
				{
					"title": "adf",
					"author": "dadong",
					"publish_date": "2017-06-05"
				},
				{
					"title": "abc",
					"author": "kim",
					"publish_date": "2016-07-07"
				}
			]
]
```

### HTTP POST http://api.book.com/v1/book

```json
body
{
	"title": "adf",
	"author": "dadong",
	"publish_date": "2017-06-05"
}
```

### HTTP PUT http://api.book.com/v1/book/1

```json
body
{
	"author": "kimdadong"
}
```

### HTTP DELETE http://api.book.com/v1/book/1