import UIKit

/*:
 ## 字符串的介绍
 字符串在开发中使用非常频繁，OC 和 Swift 中字符串的区别
 * 在 OC 中字符串类型是 NSString,在 Swift 中字符串类型是 String
 * OC 中字符串用 @“”, Swift 中字符串用 “”
 使用 String 的原因：
 * String 是一个结构体，性能更高
 * NSString 是一个 OC 对象，性能略差
 * String 支持直接遍历
 ## 字符的定义
 * 定义不可变字符串
 */
let str = "hello Object-C"
//: * 定义可变字符串
var strmul = "hello Swift"
//: *多行字符串
"""
静夜思
作者：李白
床前明月光，疑是地上霜。
举头望明月，低头思故乡。
"""
/*:
 * Swift 5.0 新推出的 Raw String
 1. Swift 5.0 对字符串增加了一个新特性，使用 # 包裹字符串
 2. 假如要输出："字符串中有\转义字符反斜杠\"
 */
//5.0之前
let str1 = "字符串中有\\转义字符反斜杠\\"
print("str1==",str1)
//5.0 如果字符串声明被 # 号包裹，\ 不需要转义
let str2 = #"字符串中有\转义字符反斜杠\"#
print("str2==",str2)

//如果字符串中有 # 怎么办？用两个 # 包裹字符串
let str3 = ##"字符串中有#转义字符反斜杠\"##
print("str3==",str3)

/*:
 ### 字符串的常用操作
 1. 长度
 */
let str4 = "12345678"
let len2 = str4.count
print("str4长度==",len2)
let len3 = (str4 as NSString).length
print("len2===",len3)
