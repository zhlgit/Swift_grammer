import UIKit
import Foundation

/*:
## 闭包引入
计算一个数的平方
* 函数写法
*/
func square(param: Int) -> Int {
	return param * param
}
square(param: 3)
//: * 闭包写法
let squareCloure = { (param: Int) -> Int in
	return param * param
}
squareCloure(3)
/*:
## 闭包含义
* 闭包是可以被传递和引用的一个独立模块
* 闭包能够捕获和存储定义在其上下文中的任何常量和变量，即闭包并包裹那些常量和变量，因此被称为 “闭包”
* 闭包符合如下三种形式中的一种：
  1. 全局函数是一个有名字但不会捕获任何值的闭包
  2. 内嵌函数是一个有名字且能从其上层函数捕获值的闭包
  3. 闭包表达式是一个轻量级语法，可以捕获其上下文中常量或变量值的没有名字的闭包
* 闭包和函数一样也是引用类型
*/
//eg1:
let demo = { print("Swift 闭包实例。") }
demo()
//eg2:
let divide = { (val1: Int, val2: Int) -> Int in
	return val1 / val2
}
let result = divide(200,20)
print("调用闭包 divide 结果是 \(result)")
/*:
## 闭包表达式
闭包表达式语法有如下的一般形式：
*/
//{ (parameters) -> (retuen type) in
//	statements
//}
/*:
* 闭包表达式由一对 {} 开始与结束
* 由 in 关键字将闭包分割成两部分：参数与返回值、闭包体
* 闭包参数与函数参数的区别：形式参数不能提供默认值，其他和函数一样
## 闭包主要知识点
### 参数名称缩写
* Swift 提供了参数名称的缩写功能，直接通过 $0,$1,$2来顺序调用闭包的参数
* 在闭包表达式中使用参数名称缩写，可以在闭包参数列表中省略对其定义
  1. 参数类型可以通过函数类型进行推断
  2. 在单行闭包的时候，return 关键字可以省略
  3. 参数名称省略以后，in 关键字也可以被省略
*/
//从数组中筛选指出合适的数据组成新的数组
func getList(score : [Int], con: (Int) -> Bool) -> [Int] {
	var newScore : [Int] = [Int]()
	for item in score {
		if con(item) {
			newScore.append(item)
		}
	}
	return newScore
}
let newArray = getList(score: [75,60,95,45,85], con: {(s : Int) -> Bool in return s > 80})
print("newArray===\(newArray)")
//: 第一种简写：省略 -> 与返回类型（根据后面表达式可以推断返回值是一个 Bool）
let newArray1 = getList(score: [75,60,95,45,85], con: { (s : Int) in return s > 80 })
print("newArray1===\(newArray1)")
//: 第二种简写：省略参数类型和括号（根据函数的参数可推断传进来的必然是 Int）
let newArray2 = getList(score: [75,60,95,45,85], con: { s in return s > 80 })
print("newArray2===\(newArray2)")
//: 第三种简写：省略 return 关键字
let newArray3 = getList(score: [75,60,95,45,85], con: {s in s > 80})
print("newArray3===\(newArray3)")
//: 第四种简写：参数名称缩写，省略参数声明和 in ,改为 $0
let newArray4 = getList(score: [75,60,95,45,85], con: {$0 > 80})
print("newArray4===\(newArray4)")
/*:
### 捕获
* 闭包可以从上下文环境中捕获常量、变量，并在自己的作用域内使用
* Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数，嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
*/
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
	var runningTotal = 0
	func incrementor() -> Int {
		runningTotal += amount
		return runningTotal
	}
	return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
print("第一次调用 incrementByTen 结果是",incrementByTen())
print("第二次调用 incrementByTen 结果是",incrementByTen())
print("第三次调用 incrementByTen 结果是",incrementByTen())
/*:
## 尾随闭包
尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
* 闭包是函数的最后一个参数
* 调用时，函数的 ）可以前置到倒数第二个参数末尾，后面的参数直接使用 {// 执行代码}，形式参数标签也随之省略
* 将一个很长的闭包表达式作为一个参数传递给函数，可以使用尾随闭包来增强函数的可读性
*/
//尾随闭包
func doSomething(info: String, clousre: (String) -> Void) {
	clousre(info)
}

//不使用尾随闭包进行函数调用
doSomething(info: "Hello", clousre: {s in print(s)})

//使用尾随闭包进行函数调用
doSomething(info: "World") { s in
	print(s)
}
/*:
## 逃逸闭包
* 闭包作为一个参数传递给一个函数
* 传入函数的闭包如果在函数执行结束之后才会被调用，那么这个闭包就叫做逃逸闭包
* 声明一个接受闭包作为参数的函数时，可以在形式参数的类型之前写上 @escaping 来明确闭包是允许逃逸的
* 逃逸闭包会在函数结束之后才执行
*/
//逃逸闭包：闭包可以超出函数的范围来调用
//存放没有参数、没有返回值的闭包
var closureArray : [() -> Void] = [() -> Void]()
//定义一个函数，接收一个非逃逸闭包为参数
func nonEscapeClosure(closure:() -> Void) {
	closure()
}
//定义一个函数，接收一个逃逸闭包为参数，将闭包存储到一个数组里面去，并没有调用
func escapeClosure(closure: @escaping () -> Void) {
	print("函数开始")
	closureArray.append(closure)
	print("函数结束")
}
var x = 10
print("x ===\(x)")

nonEscapeClosure {
	x = 100
}
print("x === \(x)")  //打印100 因为闭包在函数里面执行了

escapeClosure {
	x = 200
}
//打印 100 因为闭包逃逸了，没有在函数里面执行
print("逃逸闭包 ===\(x)")

//尾随产包常用于异步回调

/*:
## 自动闭包
* 一种自动创建的闭包，用于包装函数参数的表达式
* 不接受任何参数，被调用时会返回被包装在其中的表达式的值
* 在形式参数的类型之前加上 @autoclosure 关键字标识这是一个逃逸闭包
*/
func printIfTrue(predicate:@autoclosure () -> Bool) {
	if predicate() {
		print("is true")
	} else {
		print("is false")
	}
}

//直接进行调用了，Swift 将会把 2 > 1 这个表达式自动转换为 () -> Bool。这样我们就得到了一个写法简单、表意清楚的表达式
printIfTrue(predicate: 2 > 1)
printIfTrue(predicate: 2 < 1)
//: ## 闭包的循环引用
class NetworkTools: NSObject {
    //	完成回调属性
	var finishedCallBack: (() -> ())?
	/// 加载数据
	/// - parameter finished: 完成回调
	func loadData(finished: @escaping () -> ()) {
		self.finishedCallBack = finished
		working()
	}
	
	func working() {
		finishedCallBack?()
	}
	deinit {
		print("网络工具 88")
	}
}

class ViewController: UIViewController {
	var tools: NetworkTools?
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tools = NetworkTools()
		tools?.loadData {
			print("加载数据完成，更新界面：", Thread.current)
			self.view.backgroundColor = UIColor.red
		}
	}
}
/*:
## Swift 中解决循环引用的方式
  1. 方案一
    * 使用weak，对当前控制器使用弱引用
    * 但是因为 self 可能有值也可能没有值，因此 weakSelf是一个可选类型，在真正使用时可以对其强制解包（该处强制解包没有问题，因为控制器一定存在，否则无法调用所在函数）
  2. 方案二
    * 和方案一类似，只是书写方式更加简单
    * 可以写在闭包中，并且在闭包中用到的self都是弱引用
  3. 方案三
    * 使用关键字 unowned
    * 从行为上来说 unowned 更像 OC 中的 unsafe_unretained
    * unowned 表示：即使它原来引用的对象被释放了，仍然会保持对被已经释放了的对象的一个 “无效的” 引用，它不能是 Optional 值，也不会被指向 nil
*/

