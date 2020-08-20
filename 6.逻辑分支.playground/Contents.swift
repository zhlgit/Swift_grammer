import UIKit

/*:
 ## 分支的介绍
 分支语句即 if/switch/三目运算符等判断语句，通过分支语句可以控制程序的执行流程
 ### if分支语句
 和 OC 中 if 语句有一定的区别：
 * 判断语句可以不加()
 * 判断之后的执行语句必须用 {} 括起来
 * 在判断语句中必须有明确的真假（不再有非 0 即真，必须有明确的 Bool 值）
 ```
 1.
 ```
 */
let a = 10
//错误写法：
//if a {
//    print("a")
//}

//正确写法
if a > 9 {
    print(a)
}
/*:
 ```
 2.
 ```
 */
let score = 87
if score < 60 {
    print("不及格")
} else if score <= 70 {
    print("及格")
} else if score <= 80 {
    print("良好")
} else if score <= 90 {
    print("优秀")
} else {
    print("完美")
}

/*:
 ```
 3.
 ```
 */
//这个是可选类型，因为只有声明为可选类型之后，才可以判断是否为空
let view : UIView? = UIView()

//判断如果view有值，则设置背景

//错误写法
//if view {
//    view?.backgroundColor = UIColor.red
//}

//正确写法
if view != nil {
    view!.backgroundColor = UIColor.red
}

/*:
 ### 三目运算符
 Swift 中的三目运算保持了和OC 一致的风格
 */
var c = 10
var b = 50

var result = c > b ? c : b
print(result)

/*:
 ### guard的使用
 * guard 是Swift2.0新增的语法，目的是提高程序的可读性
 * 它与 if 语句非常类似，但不同的是 当条件为 false 的时候执行{}里面的代码
 * guard 语句必须带有 else 语句，它的语法如下：
   1.  当条件表达式为 true 时候跳过 else 语句上的内容，执行后面的语句组
   2. 条件表达式为 false 时候执行 else 语句中的内容，跳转语句一般是 return、break、continue 或 throw
 */
//guard 条件表达式 else {
//    //条件语句
//    break
//}
//: **eg**
var age = 18
func online(age : Int) -> Void {
    guard age >= 18 else {
        print("回家去")
        return
    }
    print("可以上网")
}
online(age: age)

/*:
 ## switch 分支
 ### switch的介绍
 * switch作为选择结构中必不可少的语句也被加入到了swift 中
 * 苹果对 switch 进行了大大的增强，使其拥有其他语言中没有的特性
 ### switch的简单使用
 基本用法和OC一致，不同之处：
 * switch 后可以不跟()
 * case 后可以不跟 break （默认会有break）
 * case 后多行语句可以不加()
 */
//:eg:
let sex = 0
switch sex {
case 0:
    print("男")
case 1:
    print("女")
default:
    print("其他")
}
/*:
 > 补充一：
 * 一个 case 判断中，可以判断多个值
 * 多个值以 ，隔开
 */
let sex1 = 0
switch sex1 {
case 0,1:
    print("正常人")
default:
    print("其他")
}
/*:
 > 补充二：
 如果希望出现之前的 case 穿透，则可以使用关键字 fallthrough
 */
let sex2 = 0
switch sex2 {
case 0:
    fallthrough
case 1:
    print("正常人")
default:
    print("其他")
}

/*:
 ### switch支持多种数据类型
 1. 浮点型的 switch 判断
 */
let f = 3.14
switch f {
case 3.14:
    print("π")
default:
    print("not π")
}
//:2. 支持字符串类型
let m = 5
let n = 10
var result1 = 0
let opration = "+"
switch opration {
case "+":
    result1 = m + n
case "-":
    result1 = m - n
case "*":
    result1 = m * n
case "/":
    result1 = m / n
default:
    result1 = 0
}
print(result1)
//: 3. switch 支持区间判断
/*:
 ### 什么是区间？
 数学中区间（0，10）、（0，10]、[0,10)、[0,10]
 swift 中的区间常见有两种
 * 半开半闭区间..<:0..<10 表示：0~9，不包括 10
 * 闭区间...:0...10 表示: 0~10
 */
let score1 = 88
switch score1 {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<90:
    print("良好")
case 90..<100:
    print("优秀")
default:
    print("满分")
}
