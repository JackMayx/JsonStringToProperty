# JsonStringToProperty
JSONString一键转Model实例模型，妈妈再也不用担心实例属性多而烦恼了~~~~~~~

![image](https://github.com/JackMayx/JsonStringToProperty/blob/master/WechatIMG93.jpeg)
![image](https://github.com/JackMayx/JsonStringToProperty/blob/master/WechatIMG91.jpeg)



支持class/struct   支持继承和实现协议



```
{
    "resultcode":"200",
    "reason":"Success",
    "result":{
        "data":[
            {
                "id":"45",
                "title":"秘制红烧肉",
                "tags":"家常菜;热菜;烧;煎;炖;红烧;炒锅",
                "imtro":"做红烧肉的豆亲们很多，大家对红烧肉的热爱更不用我说，从名字上就能反映出来。一些高手们对红烧肉的认识更是令我佩服，单单就红烧肉的做法、菜谱都看得我是眼花缭乱，口水横流。单纯的红烧肉我平时还真没做过，再不抓紧时间做一回解解馋，不是对不起别人，而是太对不起我自己了！ 这道菜的菜名用了秘制二字来形容，当然是自己根据自己多年吃货的经验想象出来的，我不介意把自己的做法与大家共享，只为大家能同我一样，吃到不同口味的红烧肉。不同的人们根据自己的习惯都有不同的做法，味道也不尽相同。我的秘制的关键就是必须用玫瑰腐乳、冰糖和米醋这三种食材，腐乳和冰糖可以使烧出来的肉色泽红亮，米醋能解腻，令肥肉肥而不腻，此法烧制的红烧肉软糯中略带咸甜，的确回味无穷！",
                "ingredients":"五花肉,500g",
                "burden":"玫瑰腐乳,适量;盐,适量;八角,适量;草果,适量;香叶,适量;料酒,适量;米醋,适量;生姜,适量",
                "steps":[
                    {
                        "img":"http://img.juhe.cn/cookbook/s/1/45_0824e37faf00b71e.jpg",
                        "step":"1.将五花肉煮至断生状态"
                    }
                ]
            }
        ],
        "totalNum":"306",
        "pn":"1",
        "rn":"3"
    },
    "error_code":0
}

```


class:


```
class StepsList {

	var step: String?

	var img: String?

	required init() {}

}

class DataList {

	var steps: StepsList?

	var ingredients: String?

	var id: String?

	var title: String?

	var imtro: String?

	var tags: String?

	var burden: String?

	required init() {}

}

class ResultMap {

	var pn: String?

	var rn: String?

	var totalNum: String?

	var data: DataList?

	required init() {}

}

class FoodModel {

	var result: ResultMap?

	var error_code: Int = 0

	var reason: String?

	var resultcode: String?

	required init() {}

}

```

struct:

```
struct StepsList: KakaJSON {

	var img: String?

	var step: String?

	

}

struct DataList: KakaJSON {

	var ingredients: String?

	var burden: String?

	var id: String?

	var title: String?

	var tags: String?

	var steps: StepsList?

	var imtro: String?

	

}

struct ResultMap: KakaJSON {

	var data: DataList?

	var pn: String?

	var rn: String?

	var totalNum: String?

	

}

struct FoodModel: KakaJSON {

	var reason: String?

	var result: ResultMap?

	var resultcode: String?

	var error_code: Int = 0

	

}



```


