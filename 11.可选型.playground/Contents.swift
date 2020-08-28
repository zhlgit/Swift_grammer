import UIKit

/*:
 ## 可选类型的介绍
* 可选类型是 Swift 中比较晦涩难懂的一个知识点
* 先了解定义，多利用 Xcode 的提示来使用
* 随着学习的深入，慢慢理解其中的原理和好处
### 概念
* 在 OC 中，如果一个变量暂时不使用，可以赋值为 0（基本属性类型）或者赋值为 nil(对象类型)
* 在 Swift 中，nil 也是一个特殊的类型，与 int、String一样，又因为 Swift 是强类型语言，因此不能直接将 nil 赋值给其他类型的数据
* 开发中碰到 nil 在所难免，因此推出了可选类型
### 可选类型的取值：
* nil
* 有值
## 定义可选类型
### 定义一个可选类型有两种写法
*/
//写法一：定义可选类型
let name: Optional<String> = nil
//写法二：定义可选类型，语法糖（常用）
let name1: String? = nil
/*:
## 可选类型的使用
1. 给可选类型赋值
*/
//定义可选类型
var string : Optional<String> = nil
//给可选类型赋值
//错误写法：因此该可选类型中只能存放字符串
//string = 123
//正确写法
string = "Hello world"
print("可选类型字符串 string ==",string!)
//: 2. 取出可选类型的值（解包）
//！强制解包（显示解包）
print("显示解包字符串：",string!)

//如果可选类型为nil,强制解包会出错
//string = nil
//print(string!) //报错

//正确写法应该是先判断是否为空
if string != nil {
	print("判断是否为空并显示字符串",string!)
}

//: 3. 取出可选类型的值
//可选绑定（隐式解包）
if let str = string {
//	此时输出的就是 str 的值，而不是 Optional
	print("可选绑定（隐式解包）",str)
}

//: 4. 取出可选类型的值
//guard let str = string else {
//	throw
//}
//print(str)
//: ## 实际应用场景
var array:[String] = [String]()
array.append("A")
array.append("B")
array.append("C")

//返回 String?
array.first
array.last

//严谨写法
//使用可选类型来接收
//let url : URL? = URL(string: "https://www.abc.edu.cn")
//该方式利用类型推导
let url = URL(string: "https://www.abc.edu.cn")

//通过 url 来创建 request 对象：在使用可选类型前要先进行判断是否有值
//该语法成为可选绑定（如果 url 有值就解包赋值给 tempURL，并且执行{}）
if let tempUrl = url {
	_ = URLRequest(url: tempUrl)
}



