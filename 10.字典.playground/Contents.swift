import UIKit

/*:
### 字典的介绍
* 字典是由键值 key:value 对组成的集合
* 字典中的元素之间是无序的
* 字典是由两部分集合构成的，一个是键集合，一个是值集合
* 字典是通过访问键间接访问值的
* 键集合是不能有重复元素的，而值集合是可以重复的
* Swift 中的字典类型是 Dictionary, 也是一个泛型集合
### 字典的初始化
1. Swift 中的可变和不可变字典
* 使用 let 修饰的字典是不可变字典
* 使用 var 修饰的字典是可变字典
*/
// 定义一个可变字典
var dict1: [String:Any] = [String: Any]()

//定义一个不可变字典
let dict2:[String: Any] = ["name":"zhangsan","age": 18]

//: 在声明一个 Dictionary 类型的时候可以使用下面的语句之一
var dict3: Dictionary<Int, String>
var dict4: [Int: String]
//:声明的字典需要进行初始化才能使用，字典类型往往是在声明的同时进行初始化的
//声明字典的同时，进行初始化
var dict:[String : Any] = ["name":"zhangsan","age":18]
//Swift 中任意类型用 Any 表示
var dict5 : Dictionary<String,Any>
dict = ["name":"zhangsan","age":18]
//: ### 字典的基本操作
//: 1. 获取长度
print("获取字典的长度：",dict.count)
//: 2.判空
print("判断字典为空：",dict.isEmpty)
//: 3.添加数据
dict["height"] = 1.80
dict["weight"] = 70.0
print("dict 添加值：height 和 weight",dict)
//: 4.删除字段
dict.removeValue(forKey: "height")
print("dict 删除值 height",dict)
//: 5.修改字典
//方式一
dict["name"] = "lisi"
print("修改 dict name值为 lisi：",dict)
//方式二
dict.updateValue("lisi", forKey: "name")
print("修改 dict name值为lisi的第二种方式",dict)
//: 6.查询字典
print("读取字典 dict 的name的值：",dict["name"] ?? "")

//: ### 字典的遍历
//: 1.遍历字典中所有的值
for value in dict.values {
	print("遍历字典 dict 的所有的值",value)
}
//: 2. 遍历字典中所有的键
for key in dict.keys {
	print("遍历字典 dict 的所有键",key)
}
//: 3. 遍历所有的键值对
for (key, value) in dict {
	print("遍历字典 dict 的所有键值对","\(key) --- \(value)")
}
//: 4. 枚举方式遍历
//输出的不是 key-value,而是索引和（key: value）
for (index, value) in dict.enumerated() {
	print("枚举方式遍历：","\(index) -- \(value)")
}

//: ### 字典的合并
var dict6: [String : Any] = ["name" : "zhangsan", "age" : 20]
var dict7: [String : Any] = ["height" : 1.80, "phoneNum" : "1888888888"]
//字典合并不能像数组那样直接用 +
for (key, value) in dict7 {
	dict6[key] = value
}
print("合并字典 dict6 和 dict7,dict6 == ：",dict6)




