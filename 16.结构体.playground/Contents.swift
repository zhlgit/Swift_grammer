import UIKit

/*:
## 结构体的介绍
* 结构体（struct）是由一系列具有相同类型或不同类型的数据构成的数据集合
* 结构体是值类型
* 结构体既可以定义属性又可以定义方法
### 定义语法
*/
struct 结构体名称 {
	//属性和方法
}
//: *eg *
struct Person {
	var name = "Zhangsan"
	var age = 10
	var sex = "man"
	func say() {
		print("人会说话")
	}
}
/*:
以上说明：
* 定义了一个名叫 Person 的结构体
* 这个结构体拥有两个存储属性 name、age 和 sex
* 这个结构体拥有一个方法 say
## 结构体实例
实例化结构体最简单的是在结构体名字后面写上()，任何属性都被初始化为它们的默认值
*/
var p1 = Person()
//: 所有的结构体都有一个自动生成的成员构造函数来实例化结构体，可以使用它来初始化所有的成员属性
var p2 = Person(name: "Lisi", age: 20, sex: "woman")
/*:
## 访问属性和方法
* 可以用.来访问一个结构体实例的属性和方法
* 访问时如果使用了赋值语句就是设置属性
*/
print("访问属性 age 的值===",p2.age)
p2.age = 30

//通过 .调用结构体中的属性和方法
p1.name
p1.age
p1.sex
p1.say()
/*:
## 结构体是值类型
* 值类型是一种当它被赋值给一个常量或者变量，或者传递给函数时会被拷贝的类型
* Swift 是的结构体（包括枚举）是值类型，它在代码传递中总是会被拷贝
*/
//值类型拷贝
var p3 = p2
//此时改变 p3 并不会改变 p2 的值
p3.name = "Wangwu"
p3.age = 10
print("p3 ==== \(p3)\n,p2 === \(p2)")

/*:
## 常用的结构体
1. CGRect
*/
public struct CGRect {
	public var origin: CGPoint
	public var size: CGSize
	public init(origin: CGPoint, size: CGSize){
		self.origin = origin
		self.size = size
	}
}

