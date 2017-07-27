## HTTP

* HTTP(HyperText Transfer Protocol)는 WWW 상에서 클라이언트와 서버 사이에 이루어지는 요청/응답(request/response) 프로토콜.
* TCP와 UDP를 통하여 80번 포트를 사용.

* ### Methods

![images/HTTP_Methods.png](images/HTTP_Methods.png)

  * HTTP Method - REST API
    * POST - CREATE
    * PUT - UPDATE
    * GET - READ
    * DELETE - DELETE

* ### HTTP Message

  * ASCII로 인코딩된 텍스트 정보로 구성되며, 여러 줄에 걸쳐 만들어진다.
  * HTTP/1.1과 프로토콜 초기 버전에서, 이 메시지들은 연결을 통해 직접 전달되었으나, HTTP/2에서는 최적화와 더 나은 성능을 이끌어내도록 인간이 읽을 수 있는 메시지가  HTTP 프레임으로 나누어진다.

![images/HTTPMsgStructure.png](images/HTTPMsgStructure.png)