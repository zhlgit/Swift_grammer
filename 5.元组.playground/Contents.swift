import UIKit

/*:
 ## 元组的介绍
 元组是Swift中特有（Python中也有）,OC中并没有此类型。定义与含义：
 * 一种数据结构
 * 可以用于定义一组数据
 * 组成元组的数据可以称为 “元素”
 ### 元组的定义
 元组的常见写法：
 */
//使用元组描述一个人的信息
var one = ("1001","张三",30,90)
//给元素加上名称，之后可以通过名称访问元素
var two = (id:"1001",name:"张三",OC_score:80,iOS_score:90)

/*:
 上面两种写法，one 和 two 的类型的不同之处：
 * var one: (String,String,Int,Int)
 * var two: (id: String,name: String,OC_score: Int,iOS_score:Int)
 ### 元组的简单使用
 用元组描述一个错误信息
 */
//写法一：
let error = (404,"Not Found")
//下标访问
print(error.0)
print(error.1)

//写法二：
let error1 = (errorCode : 404,errorInfo : "Not Found")
//别名访问
print(error1.errorCode)
print(error1.errorInfo)

//写法三：定义元组变量接收元素的值
let (errorCode,errorInfo) = (404, "Not Found")
print(errorCode)
print(errorInfo)

