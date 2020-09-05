import UIKit

/*:
## 枚举介绍
  * 枚举定义了一个通用类型的一组相关的值，可以在代码中以一个安全的方式来使用这些值
  * Swift 中的枚举是一等类型，它可以像类和结构体一样增加 属性和方法
  * 在 C/OC 语言中枚举指定相关名称为一组整形值，而 Swift 中的枚举更加灵活
    1. 不必给每一个枚举成员提供一个值
    2. Swift中的枚举可以提供的值类型有：字符串，字符，整形值，浮点值等
* 枚举类型的语法：（使用 enum 关键字并且把它们的整个定义放在一对大括号内）
*/
enum Method {
	case Add
	case Sub
	case Mul
	case Div
}
let selectMethod = Method.Sub
switch selectMethod {
	case Method.Add:
		print("加法")
	case Method.Sub:
		print("减法")
	case Method.Mul:
		print("乘法")
	case Method.Div:
		print("除法")
}
/*:
## 枚举的定义
1. 定义方式一
  * case 关键字表明新的一行成员将被定义
  * 不像 C 和 Objective-C 一样， Swift 的枚举成员在被创建时不会被赋予一个默认的整数值
  * 下面的例子中，North, South, East和West不是隐式的等于0，1，2和3
*/
//enum CompassPoint {
//	case North
//	case South
//	case East
//	case West
//}
//: 2. 定义方式二：多个成员值可以出现在同一行上
enum CompassPoint {
	case North, South, East,West
}
/*:
## 枚举赋值
枚举类型赋值可以是字符串/字符/整形/浮点型，如果有给枚举类型赋值，则必须在枚举类型后面明确说明具体的类型
*/
enum CompassPoint1 : Int {
	case North = 1
	case South = 2
	case East = 3
	case West = 4
}
enum CompassPoint2 : Double {
	case North = 1.0
	case South = 2.0
	case East = 3.0
	case West = 4.0
}
enum CompassPoint3 : String {
	case North = "North"
	case South = "South"
	case East = "East"
	case West = "West"
}
/*:
## 枚举类型推断
前面的例子中，在使用枚举的时候，通过 枚举.值的形式来访问的，其实由于 Swift 的类型推断非常强大，如果枚举类型确定了，在访问的时候可以用.值的形式来访问
*/
enum Method1 {
	case Add
	case Sub
	case Mul
	case Div
	func method() {
		
	}
}
//已经明确 a 是一个Method类型 后面访问可以简写
let a:Method1 = .Add
let selectMethod1 = Method1.Sub
switch selectMethod1 {
case .Add:
	print("加法")
case .Sub:
	print("减法")
case .Mul:
	print("除法")
case .Div:
	print("乘法")
}
/*:
## 枚举的原始值
C/OC中枚举的本质就是整数，所以C/OC中的枚举是有原始值的，默认是从 0 开始，而 Swift 中的枚举默认是没有原始值的，但是可以在定义时告诉系统让枚举有原始值
## 注意：
* 原始值区分大小写
* 通过 rawValue 可以获取原始值
* 通过  rawValue 返回的枚举是一个可选型，因为原始值对应的枚举值不一定存在
* 如果想指定第一个元素的原始值之后，后面的元素的原始值能够默认 +1，枚举一定是 Int 类型
*/
enum Planet: Int {
	case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
let planet:Planet = .Mars
print(planet.rawValue)
//p是一个可选型
let p = Planet(rawValue: 3)
if let p = p {
	switch p {
	case .Mercury:
		print("Mercury")
	case .Venus:
		print("Venus")
	case .Earth:
		print("Earth")
	case .Mars:
		print("Mars")
	case .Jupiter:
		print("Jupiter")
	case .Saturn:
		print("Saturn")
	case .Uranus:
		print("Uranus")
	case .Neptune:
		print("Neptune")
	}
}
/*:
## 枚举的遍历
Swift 4.2 中对枚举扩充了一个功能。可以通过在枚举的名字后面写 :CaseIterable 来允许枚举被遍历。Swift 会暴露一个包含对应枚举类型所有情况的集合名为 allCases, 通过它可以将枚举的所有情况包进一个集合中。
*/
enum Method3: CaseIterable {
	case Add, Sub, Mul, Div
}

for method in Method3.allCases {
	print(method)
}
