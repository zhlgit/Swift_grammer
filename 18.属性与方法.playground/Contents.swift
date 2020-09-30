import UIKit

/*:
## 类的属性介绍
* 存储属性：存储实例的常量和变量
* 计算属性：通过某种方式计算出来的属性
* 类属性：与整个类自身相关的属性
## 存储属性
* 存储属性是最简单的属性，它作为类实例的一部分，用于存储常量和变量
* 可以给存储属性提供一个默认值，也可以在初始化方法中对其进行初始化
### 存储属性的写法
* age 和 name 都是存储属性，用来记录该学生的年龄和姓名
* chineseScore 和 mathScore 也是存储属性，用来记录该学生的语文分数和数学分数
*/
class Student {
	var age : Int = 0
	var name : String?
	
	var chineseScore : Double = 0.0
	var mathScore : Double = 0.0
}

//创建学生对象
//let stu = Student()
//
////给存储属性赋值
//stu.age = 10
//stu.name = "why"
//
//stu.chineseScore = 89.0
//stu.mathScore = 98.0
/*:
## 计算属性
* 计算属性并不存储实际的值，而是提供一个 getter 和一个可选的 setter 来间接获取和设置其它属性
* 计算属性一般只提供 getter 方法
* 如果只提供 getter，而不提供 setter，则该计算属性为只读属性，并且可以省略 get{}
### 计算属性的写法
* averageScore 是计算属性，通过 chineseScore 和 mathScore 计算而来的属性
* 在 setter 方法中有一个 newValue 变量，是系统指定分配的
*/
class Student1 {
	var age : Int = 0
	var name : String?
	
	var chineseScore : Double = 98.0
	var mathScore : Double = 89.0
	
	var averageScore : Double {
		get {
			return (chineseScore + mathScore)/2
		}
		//死循环，在内部又会调用 set 方法
		//newValue是系统分配的变量名，内部存储着新值
//		set {
//			self.averageScore = newValue
//		}
	}
}

let stu1 = Student1()
print("stu1.average==",stu1.averageScore)
/*:
## 类属性
* 类属性是与类相关联的，而不是与类的实例相关联
* 所有的类和实例都共有一份类属性，因此在某一处修改之后，该类属性就会被修改
* 类属性的设置和修改，需要通过类来完成
* 下面是类属性的写法
 1. 类属性可以使用 static 来修饰
 2. courseCount 是类属性，用来记录学生有多少门课程
*/
class Student2 {
//	存储属性
	var age : Int = 0
	var name : String?
	
	var chineseScore : Double = 0.0
	var mathScore : Double = 0.0
	
	//计算属性
	var averageScore : Double {
		return (chineseScore + mathScore) / 2
	}
	
	//类属性
	static var englishScore : Double = 95.5
	
	lazy var teacher:[String] = {
		() -> [String] in
		return ["Mr Zhang", "Mr Li", "Mr Yang"]
	}()
}

//设置类属性的值
Student2.englishScore = 90.5
//取出类属性的值
print("Student2.englishScore === ",Student2.englishScore)
/*:
## 懒加载属性
* 苹果的设计思想：希望所有的对象在使用时才真正加载到内存中
* 在 OC 中我们可以重写 get 方法来进行懒加载
* Swift 用 lazy 关键字可以用于定义某一个属性懒加载
* lazy 的作用是只会赋值一次
* 懒加载的本质是，在第一次使用的时候执行闭包，将闭包的返回值赋值给属性
## 懒加载的使用
* 格式
*/
//lazy var 变量: 类型 = { 创建变量代码 } ()
//: eg

let student = Student2()
print("student.teacher == ",student.teacher)
/*:
## 几种属性的区别
* 存储属性--实实在在存储常量和变量的
* 计算属性--依赖于存储属性，通过计算得出来，它提供 getter 和 setter 方法间接访问和设置值
* 类属性--本质是一个全局属性，在类里限定了其作用域，用关键字 static 修饰
* 懒加载属性---用关键字 lazy 修饰，必须进行初始化，非实例属性懒加载时在大括号 {} 后面要加上 （）
* 全局属性---类外面的属性，作用域全局
#### 总结
* 存储属性，最先被初始化
* 构造方法，仅次于存储属性调用，可以在这里对存储属性进行赋值
* 懒加载属性、类属性、全局属性都是在第一次使用时候初始化一次，以后调用都不再初始化
* 当懒加载属性是基于一个存储属性计算的时候，切勿懒加载属性，采用计算属性
## 监听属性的改变
* 在 OC 中我们可以重写 set 方法来监听属性的改变
* Swift 中可以通过属性观察者来监听和响应属性值的变化
* 通常是监听存储属性和类属性的改变（对于计算属性，不需要定义属性观察者，因为可以在计算属性的setter中直接观察并响应这种值的变化）
* 定义观察者
  1. willSet: 在属性值被存储之前设置。此时新属性值作为一个常量参数被传入。该参数名默认为 newValue，可以自定义
  2. didSet: 在新属性值被存储后立即调用。与 willSet 相同，此时传入的是属性的旧值，默认参数名为 oldValue, 可以自定义
  3. willSet 与 didSet 只有在属性改变时才会调用，在初始化时不会去调用这些监听方法
*/
class Student3 {
	var name: String?{
		//属性即将改变，还未改变时会调用的方法，可以给 newValue 自定义名称
		willSet(new) {
			print("willSet---")
			//在该方法中有一个默认的系统属性 newValue ，用于存储新值
			if let new = new {
				print(new)
			}
		}
		
		//属性值已经改变了，会调用的方法
		didSet{
			print("didSet---")
			// 在该方法中有一个默认的系统属性 oldValue，用于存储旧值
			if let oldValue = oldValue {
				print(oldValue)
			}
		}
	}
}
var stu3 = Student3()
// 在赋值时，监听该属性的改变
stu3.name = "Zhangsan"
stu3.name = "Lisi"
/*:
## 属性继承与重写
* 属性继承：子类可以继承父类的属性，包括存储属性、计算属性和类型属性，还可以继承父类的属性观察器。
* 属性重写
  1. 无论继承的是存储属性还是计算属性，子类都可以通过提供 getter 和 setter 对属性进行重写
  2. 可以将一个继承的属性重写为一个读写属性
  3. 不可以将继承来的读写属性重写为只读属性
  4. 如果重写时提供了 setter 方法，一定要提供 getter 方法
* 属性观察器重写
  1. 无论父类有没有为该属性添加属性观察器，子类都可以添加属性观察器
  2. 如果父类已经添加了属性观察器，当属性发生变化时，父类与子类都会得到通知
  3. 属性观察器不能用于计算属性，只能用于存储属性，因为计算属性在 setter 里就可以获取到属性的变化
## 实例方法
* 实例方法属性特定类实例、结构体实例或者枚举实例的函数
* 这里的方法其实就是函数，只不过放在类、结构体和枚举中时称之为方法
## self 属性
* 第一个类的实例都隐含一个叫做 self 的属性，可以使用 self 访问当前类中的属性和方法
*/
class Student4 {
	var str = "Hello, playground"
	func say(info: String) {
		print("info===",info)
	}
	func eat(food: String){
		//self 指向的是当前类的实例
		self.say(info: food)
		print("吃\(food)")
	}
}
var stu4 = Student4()
stu4.eat(food: "米饭")
/*:
## 值类型在实例方法中修改属性和调用方法
* 值类型默认情况下，不能在实例方法中修改属性
* 不能用 self 调用其他的函数
* 可以在函数前放一个 mutating 关键字来实现
*/
struct Student5 {
	var str = "Hello,playground"
	mutating func say(info: String) {
		print(info)
		self.str = "Hello World"
		print(self.str)
	}
	mutating func eat(food:String) {
		self.say(info: food)
		print("吃\(food)")
	}
}
/*:
## 类型方法
* 在函数前使用 static 关键字（能在类、结构体中使用）
* 在函数前使用 class 关键字（只能在类中使用）
*/
class Student6{
	static func play() {
		print("play")
	}
	class func study() {
		print("study")
	}
}
/*:
## class 和 static 总结
1. 相同点
  * 可以修饰方法，static 修饰的方法叫做静态方法，class 修饰的叫做类方法
  * 都可以修饰计算属性
2. 不同点
  * class 不能修饰存储属性，static 可以修饰存储属性，static 修饰的存储属性称为静态变量（常量）
  * class 修饰的计算属性可以被重写，static 修饰的不能被重写
  * static 修饰的静态方法不能被重写，class 修饰的类方法可以被重写
  * class 修饰的类方法被重写时，可以使用 static 让方法变为静态方法
  * class 修饰的计算属性被重写时，可以使用 static 让其变为静态属性，但它的子类就不能被重写了。
  * class 只能在类中使用，但是 static 可以在类、结构体、或者枚举中使用
*/

