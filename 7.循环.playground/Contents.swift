import UIKit

/*:
 ## 循环的介绍
 * 在开发中经常会用到循环
 * 常见C/OC的循环有：for/while/do while.
 * swift 中对应的为：for/while/repeat while.
 ### for循环的写法
 C风格循环
 */
//传统写法 已经在swift3 中淘汰
//for var i = 0; i < 10; i ++ {
//    print(i)
//}
//: for in 循环
for i in 0..<10 {
    print(i)
}
for i in 0...10 {
    print(i)
}

//: 特殊写法
//: 如果在 for 循环中不需要用到下标i
for _ in 0..<10 {
    print("hello")
}
/*:
 ### while和repeate while循环
 
 */
