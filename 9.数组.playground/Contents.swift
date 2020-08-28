import UIKit

/*:
## 数组的介绍
* 数组是一堆有序的由相同类型元素构成的集合
* 数组中的元素是有序的，可重复出现
* Swift用 Array 表示数组，是一个泛型集合
### 与 OC 数组的区别
* Array是一个结构体，而不是一个类
* 可以放普通类型
## 数组的初始化
数组分为可变数组和不可变数组
* 使用 let 修饰的数组是不可变数组
* 使用 var 修饰的数组是可变数组
*/
// 定义一个可变数组，必须初始化才能使用
var array1: [String] = [String]()

// 定义一个不可变数组
let array2: [Any] = ["zhangsan",18]

//: 声明一个Array类型的时候可以使用下列的语句
var stuArray1: Array<String>
//语法糖
var stuArray2: [String]

//: 声明的数组需要进行初始化才能使用，数组类型往往是在声明的同时进行初始化的
//定义直接初始化
var array = ["zhangsan","lisi","wangwu"]
//先定义，后初始化
var array3: Array<String>
array3 = ["zhangsan", "lisi","wangwu"]

/*:
### 对数组的基本操作
1. 获取长度
*/
print("array.count ===",array.count)
//: 2. 判空
print(array.isEmpty)
//: 3.添加数据
array3.append("zhaoliu")
print("追加一个元素 zhaoliu",array3)
//: 4. 插入元素
array3.insert("haojian", at: 0)
print("插入一个元素 haojian",array3)
//: 5. 删除元素
array3.removeFirst()
print("删除第一个元素 haojian",array3)
//: 6.修改元素
array3[0] = "wangqi"
print("修改第一个元素为 wangqi",array3)
//: 7. 取值
print("取数组第一个元素",array3.first ?? "aaa")
//: 8.倒序
array3.reverse()
print("数组倒序：",array3)
//:### 数组的遍历
//普通遍历
for i in 0..<array3.count {
	print("普通数组遍历第" + (i + 1).description + "个元素是",array3[i])
}
//for in 方式
var times: Int = 0;
for item in array3 {
	times = times + 1
	print("for in 方式遍历第" + times.description + "个元素是:",item)
}
//设置遍历的区间
var times1: Int = 0;
for item in array3[0..<2] {
	times1 = times1 + 1
	print("遍历区间 0-2 第" + times1.description + "个元素是：",item)
}
//元组方式遍历
let names = ["zhangsan","lisi","wangwu"]
for (index, name) in names.enumerated() {
	print("元组方式遍历第" + index.description + "个元素是：",name)
}
//数组的合并 注：只有相同类型的数组才能合并
var ary = ["zhangsan","lisi","wangwu"]
var ary1 = ["zhaoliu","wangqi"]
var ary2 = ary + ary1;
print("合并数组 ary 和 ary1的元素为：",ary2)

//虽然不报错，但是不建议一个数组中存放多种类型的数据
var ary3: [Any] = [2,3.0,"zhangsan"]
var ary4: [Any] = ["lisi",true]
var ary5: [Any] = ary3 + ary4
print("合并数组 ary3 和 ary4的元素为：",ary5)




