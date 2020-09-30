import UIKit

/*:
## 构造函数的介绍
* 构造函数用于初始化一个类的补修（创建对象）
* 默认情况下载创建一个类时，必然会调用一个构造函数
* 即便是没有编写任何构造函数，编译器也会提供一个默认的构造函数
* 如果是继承自 NSObject,可以对父类的构造函数进行重写
## 默认构造函数
* 在创建类和结构体的实例时必须为所有的存储属性设置一个合适的案值，如果不是在定义时初始化值，可以在构造函数中赋值
* 构造函数就像一个没有形式参数的实例方法，使用 init 关键字来写
*/
class Person {
	var name: String
	var age: Int
	var sex: String
	
	//1.构造函数没有 func 修饰
	//2.构造函数默认完成调用 不能手动调用
	init() {
		print("默认被调用")
		name = "Zhangsan"
		age = 10
		sex = "male"
	}
}
var p = Person()
print("p.age==\(p.age)")
print("p.name==\(p.name)")
print("p.sex===\(p.sex)")
/*:
## 自定义构造函数
* 希望在创建一个对象时手动给属性赋值（属性的值是在外面传进去的）
* 可以自定义构造函数
* 自定义构造函数和默认构造函数可以同时存在
*/
class Person {
	var 
}
