import UIKit

/*:
 ## 什么是常量和变量
 * 在Swift中规定：在定义一个标识符时必须明确说明该标识符是一个常量还是变量
 * 使用 let 来定义常量，定义之后不可以修改
 * 使用 var 来定义变量，定义之后可以修改
 ## 变量的使用
 */
let a : Int = 10
//a = 20  //报错：当一个字段定义为常量时不可以修改

var b : Int = 20
b = 30 //因为b定义为变量，因此是可以修改的

/*:
 ## 常量和变量的使用注意：
 >  注意：
 * 在真正的开发过程中，建议先定义常量，如果需要修改再修改为变量（更加安全）
 * 声明为常量不可以修改的意思是 指针不可以再指向其他对象，但是可以通过指针拿到对象，修改其中的属性
*/
//定义一个UIView
let view : UIView = UIView()

//定义一个普通的UIView
let redView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
redView.backgroundColor = UIColor.red
view.addSubview(redView)

let btn : UIButton = UIButton(type: UIButton.ButtonType.custom)
btn.backgroundColor = UIColor.blue
btn.setTitle("按钮", for: .normal)
btn.frame = CGRect(x: 20, y: 20, width: 60, height: 30)
view.addSubview(btn)


