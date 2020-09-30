import UIKit

/*:
## 类介绍
* Swift 虽然推荐面向协议编程，但其也是一门面向对象开发的语言
* 面向对象的基础是类，类产生了对象（类的实例）
* Swift 中用 class 关键字定义类
*/
//定义语法
class 类名 {
//	定义属性和方法
}
//:eg
class Person {
	var name = "Zhangsan"
	var age = 10
	var sex = "man"
	func say() {
		print("人会说话")
	}
}
/*:
## 类的实例
和结构体一样，最简单的是在名称后面加一个 （），但默认没有成员构造函数
*/
var p1 = Person()

/*:
## 访问属性和方法
* 可以用 . 来访问一个实例的属性和方法
* 访问时如果使用了赋值语句就是设置属性
*/
//普通的构造函数
var p2 = Person()
print("p2.age==\(p2.age)")
p2.age = 30
p2.name
p2.sex
p2.say()
/*:
## 类是引用类型
不同于值类型，引用类型被赋值到一个常量，变量或者本身被传递到一个函数的时候它是不会被拷贝的，而使用的是同一个对某个实例的引用。
*/
var p3 = p2
p3.name = "Lisi"
p3.age = 20
p3.sex = "woman"
//对 p2 的修改会影响原来的 p1
print("p1====",p1,"p3===",p3)
/*:
## 特征运算符
因为类是引用类型，可能有很多常量和变量都是引用到了同一个类的实例。有时候需要找出两个常量或者变量是否引用自同一个实例，Swift 提供了两个特征运算符来检查两个常量或者变量是否引用相同的实例
* 相同于（===）
* 不同于（!==）
*/
let p4 = Person()
print("p1===p2",p1 === p2)
print("p1===p4",p1 === p4)
print("p1!==p4",p1 !== p4)
/*:
## 继承
* 一个类可以从另一个类继承方法、属性和其他的特性
* 当一个类从另一个类继承的时，继承的类就是子类，被继承的就是父类
* 继承的目的是为了代码复用 Do Not Repeat Yourself
* eg
*/
//定义一个父类
class Vehicle {
	var currentSpeed = 0.0
	func makeNoise() {
		print("Ba Ba")
	}
}
//定义一个子类
class Bicycle: Vehicle {
	var hasBasket = false
}

class Car: Vehicle {
	var banner = "皖B12345"
}
var vehicle = Vehicle()
//vehicle.makeNoise()
print("调用 makeNoise==",vehicle.makeNoise())
let bicycle = Bicycle()
bicycle.makeNoise()
var car = Car()
car.makeNoise()
/*:
## 重写
* 所谓重写就是子类可以对继承父类实例方法、类型方法、实例属性，类型属性进行覆盖
* 重写需要在前面加上 override 关键字
* override 关键字执行时 Swift 编译器会检查重写的类的父类（或者父类的父类）是否有与之匹配的声明来提供重写
*/
class Car1: Vehicle {
	var banner = "皖B12345"
	override func makeNoise() {
		print("Di Di")
	}
}
var car1 = Car1()
car1.makeNoise()
/*:
## 防止被重写
可以通过 final 标记阻止这种行为：final var, final func, final class func
*/
class Vehicle1 {
	var currentSpeed = 0.0
	func makeNoise(){
		print("Ba Ba")
	}
//	表示不能被子类重写
	final func run() {
		print("Run Run")
	}
}
/*:
## 类与结构体的对比
* 相同点
  1. 定义属性
  2. 定义方法
  3. 定义构造函数（init函数）
  4. 可以被扩展
  5. 遵循协议
* 类有页结构体没有的额外功能
  1. 继承
  2. 类型转换（子类 as 父类）
  3. 析构函数
  4.引用计数
## 开发中类与结构体的使用场景
* 类和结构体都可以用来定义自定义的数据类型，结构体实例总是通过值来传递，而类实例总是通过引用来传递。
* 按照通用准则，当符合以下一条或多条情形时应考虑结构体，其他情况下，使用类。大部分的自定义的数据结构应该是类，而不是结构体。
  1. 要描述的数据类型中只有少量的简单数据类型的属性
  2. 要描述的数据类型在数据传递时要以复制的方式进行
  3. 要描述的数据类型中所有的属性在进行传递时需要以复制的方式进行
  4. 不需要继承另一个数据类型
* 比如 *
* 定义几何形状的大小，封装了一个 width 属性和 height 属性，两者为 Double 类型；
* 定义一定范围的路径，封装了一个 start 属性和 length 属性，两者为 Int 类型；
* 定义三维坐标系的一个点，封装了 x,y 和 z 属性，它们是 Double 类型。
*/

