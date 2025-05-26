# 01_mongo(기본)

## 자바스크립트 셸을 통한 MongoDB 기본

○ 데이터베이스를tutorial로선정하세요.

```js
use tutorial
```

○ users 컬렉션에username이smith인문서를저장하세요.

```js
db.users.insert({username: "smith"})
```

○ users 컬렉션에username이jones인문서를저장하세요.

```js
db.users.insert({username: "jones"})
```

○ 앞에서저장한모든문서를출력하세요

```js
db.users.find()
```

○ 앞에서저장한문서중하나만출력하세요

```js
db.users.findOne()
```

○ users 컬렉션에서 username 이 "jones"인 문서를 찾아서 출력하세요

```js
db.users.find({username: "jones})
```

○ users 컬렉션에서 username이 "jones" 또는 "smith"인 문서를 찾아서 출력하세요.

```js
db.users.find({$or:[
	{username: "smith"}, {username: "jones"}
]})
```

○ users 컬렉션에서 username이 smith인 문서에 country키가 Canada가 되도록 수정하세요.

```js
db.users.update(
	{username: "smith"}, {$set" {country: "Canada"}}
)
```

○ 앞의 문서가 올바르게 수정되었는지 확인하세요.

```js
db.users.find(
	{username: "smith"}, {$set: {country: "Canada"}}
)
```

○ 앞의 문서가 올바르게 수정되었는지 확인하세요.

```js
db.users.find(
	{username: "smith"}
)
```

○ users 컬렉션에서 username이 smith인 문서를 {country: "Canada"}로 대체하고 확인하세요.

```js
db.users.update(
	{username: "smith"}, {country: "Canada"}
)

db.users.find(
	{country: "Canada}
)
```

○ users 컬렉션에서 country가 Canada인 문서를 {username: "smith", country: "Canada"}로 대체하고 확인하세요.

```js
db.users.update(
	{country: "Canada"}, {$set: {username: "smith", country: "Canada"}}
)

db.users.find(
	{username: "smith"}
)
```

○ users 컬렉션에서 username이 smith인 문서에서 country 키를 삭제하고, 삭제 여부를 확인하세요.

```js
db.users.update(
	{username: "smith"}, {$unset: {country: 1}}
)

db.users.find(
	{username: "smith"}
)
```

○ 데이터베이스 전체 목록을 출력하세요.

```js
show dbs
```

○ 현재 사용 중인 데이터베이스의 컬렉션 목록을 출력하세요.

```js
show collections
```

○ 현재 사용중인 데이터 베이스와 users 컬렉션의 상태를 출력하세요.

```js
db.stats()

db.users.stats()
```

○ users 컬렉션에서 username이 smith인 문서를 삭제하고, 삭제여부를 확인하세요.

```js
db.users.remove({username: "smith"})

db.users.find({username: "smith"})
```

○ users 컬렉션의 모든 문서를 삭제하고, 삭제 여부를 확인하세요.

```js
db.users.remove({})

db.users.find()
```

○ users 컬렉션을 삭제하세요

```js
db.users.drop()
```

---

## 쿼리 작성하기 (기본)
○ 다음 형태의 문서 20,000건을 추가하세요.

```js
use test;
for(let i=0; i<20000; i++){
	db.product.insert({
		num: i,
		name: '스마트폰' + i
	});
}
```

○ product 컬렉션의 전체 문서수를 출력하세요.

```js
db.product.count();
```

○ product 컬렉션의 문서를 num의 내림 차순으로 정렬하여 출력하세요.

```js
db.product.find().sort({num: -1});
```

○ product 컬렉션의 문서를 num의 내림 차순으로 정렬하여 상위 10건을 출력하세요.

```js
db.product.find().sort({num: -1}).limit(10);
```

○ product 컬렉션의 문서를 num의 내림 차순으로 정렬한 상태에서 다음을 처리하세요.

```js
db.product.find().sort({num: -1}).skip(10*(6-1)).limit(10);
```

○ product 컬렉션에서 num이 15미만이거나 19,995 초과인 것을 출력하세요.

```js
db.product.find({$or:[
	{num: {$lt: 15}},
	{num: {$gt: 19995}},
]});
```

○ product 컬렉션에서 name이 '스마트폰10', '스마트폰100', '스마트폰1000' 중에 하나이면 출력하세요.

```js
db.product.find({name:{$in:['스마트폰10', '스마트폰100', '스마트폰1000']}});
```

○ product 컬렉션에서 num이 5보다 작은 문서를 출력하는데, name만 출력하세요. (_id 출력하면 안됨)

```js
db.product.find(
	{num: {$lt: 5}}, {_id: 0, name: 1}
)
```
