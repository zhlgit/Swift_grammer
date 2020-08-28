import UIKit

/*:
## 函数的介绍
函数相当于 OC 中的方法，函数的格式如下：
*/
//func 函数名(参数列表) -> 返回值类型 {
//	代码块
//	return 返回值
//}

/*:
* func 是关键字，多个参数列表之间可以用逗号，分隔，也可以没有参数
* 使用箭头 -> 指向返回值类型
* 如果函数没有返回值，返回值为 Void 并且 -> 返回值类型部分可以省略
## 常用的函数类型
1. 没有参数，没有返回值
*/
func about() -> Void {
	print("调用 about 方法输出：iPhone Xs Max")
}
about()

//简单写法：如果没有返回值，Void 可以写成（）
func about1() -> () {
	print("调用简单写法 about 方法，输出")
}
about1()
//如果没有返回值 ，后面的内容可以都不写
func about2() {
	print("省略返回值内容方法 输出")
}
about2()
//: 2. 有参数，没有返回值
func call(phoneNum : String) {
	print("打电话给\(phoneNum)")
}
call(phoneNum: "13111111111")
//: 3. 没有参数，有返回值
func readMessage() -> String {
	return "吃饭了吗？"
}
var str = readMessage()
print(str)
//: 4. 有参数，有返回值
func sum(num1 : Int, num2 : Int) -> Int {
	return num1 + num2
}
var result = sum(num1: 20, num2: 30)
print("result ===",result)
//: 5. 返回值为复杂类型
func triple(info: String) -> (name: String, age:Int) {
	let infos = info.components(separatedBy: ",")
	return (infos[0], Int(infos[1])!)
}

let p:(name: String, age:Int) = triple(info: "zhangsan,20")
print("p.name==",p.name,"\np.age===",p.age)
/*:
## 函数的使用注意
1. 函数的参数虽然没有用 var 和 let 修饰，但它是常量，不能在函数内修改
*/
func say(message: String) {
//	报错：Cannot assign to value: 'message' is a 'let' constant
//	message = "Hello Swift"
//	print("说话内容：\(message)")
}
/*:
2. 每一个函数的形式参数都包含形式参数标签和形式参数名两部分
* 形式参数标签用在调用函数的时候
* 形式参数名用在函数的实现当中
* 在调用函数的时候每一个形式参数前边都要写形式参数标签
* 默认情况下，形式参数使用它们的形式参数名作为形式参数标签
* 如果不想要形式参数标签，可以在参数名前面加 _
*/
func minus(num1 a : Int,num2 b : Int) -> Int {
	return a - b
}
minus(num1: 5, num2: 2)

func multi(_ a : Int, _ b : Int) -> Int {
	return a * b
}
multi(2, 3)
//: 3. 默认参数
//: 某些情况，如果没有传入具体的参数，可以使用默认参数
func makecoffee(type : String = "卡布奇诺") -> String {
	return "制作一杯\(type)咖啡。"
}
let coffee1 = makecoffee(type: "拿铁")
let coffee2 = makecoffee()
/*:
4. 可变参数
* Swift 中函数的参数个数可以变化，可接受不确定数量的参数
* 参数必须具有相同的类型
* 可以通过在参数类型名后面加入 ... 的方式来指示可变参数
*/
func total(numbers : Int...) -> Int {
	var sum = 0
	var times = 0
	for i in numbers {
		times += 1
		sum += i
		print("遍历第\(times)次，sum==\(sum)")
	}
	return sum
}
print("total()==\(total())")
print("total(numbers: 10)==\(total(numbers: 10))")
print("total(numbers:10,20)===\(total(numbers: 10,20))")
print("total(numbers: 10,20,30)===\(total(numbers: 10,20,30))")
/*:
5. 引用类型（指针的传递）
* 默认情况下，函数的参数是值传递。如果想改变外面的变量，则需要传递变量的地址
* Swift 提供的 inout 关键字可以实现
*/
func swapInt(a : inout Int, b: inout Int) {
	let tmp = a
	a = b
	b = tmp
}
var a = 10
var b = 20
print("a=\(a),b=\(b)")
swapInt(a: &a, b: &b)
print("a=\(a),b=\(b)")
/*:
6. 函数的嵌套使用
* Swift 中函数可以嵌套使用
* 即函数中包含函数，但是不推荐该写法
*/
let value = 55
func test() {
	func demo() {
		print("demo \(value)")
	}
	print("test")
	demo()
}
//demo() //报错
test()
/*:
## 函数的类型
### 函数类型的概念
* 函数是引用类型
* 每个函数都有属于自己的类型，由函数的参数类型和返回类型组成
* 有了函数类型以后，就可以把函数类型像 Int、Double、Array来用
* 下面的例子中定义了两个函数：addTwoInts 和 multiplyTwoInts, 这两个函数都传入两个 Int 类型参数，返回一个 Int 类型值，因此这两个函数的类型是 （Int, Int）-> Int
*/
//定义两个函数
func addTwoInts(a : Int, b : Int) -> Int {
	return a + b
}

func multiplyTwoInt(a : Int, b : Int) -> Int {
	return a * b
}
//: * 抽取两个函数的类型，并使用
//定义函数的类型
var mathFunction : (Int, Int) -> Int = addTwoInts(a:b:)
//使用函数的名称
mathFunction(10, 20)
//给函数类型变量赋值其他值
mathFunction = multiplyTwoInt(a:b:)
//使用函数的名称
mathFunction(10,20)
//: * 函数作为函数的参数
//将函数的类型作为函数的参数
func printResult(a : Int, b : Int, calculateMethod : (Int, Int) -> Int) {
	print(calculateMethod(a, b))
}

printResult(a: 10, b: 20, calculateMethod: addTwoInts(a:b:))
printResult(a: 10, b: 20, calculateMethod: multiplyTwoInt(a:b:))
//: * 函数作为函数的返回值
func getResult(a : Int) -> (Int, Int) -> Int {
	if a > 10 {
		return addTwoInts
	} else {
		return multiplyTwoInt
	}
}

//调用返回的函数
getResult(a: 10)(10,20)
getResult(a: 12)(10,20)




