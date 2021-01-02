//
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        addButton()
        
       
        
    }
    
    func addButton(){
        let button: UIButton = UIButton(type: .custom)
        button.backgroundColor = UIColor.black
       //
       button.frame = CGRect(x: 10, y: 50, width: 50, height: 70)
        
       //let buttonImage: UIImage? = UIImage(named:"hourse")
//保留图标原来的颜色
        let buttonImage = UIImage(named:"hourse")?.withRenderingMode(.alwaysOriginal)
       button.setImage(buttonImage, for:.normal)
        //使触摸模式下按钮也不会变暗（半透明）
       button.adjustsImageWhenHighlighted = false

        //设置按钮背景图片
       let backImage = UIImage(named:"pic2")
       button.setBackgroundImage(backImage,for: .normal)
        
       button.setTitle("按钮", for:.normal)
       //普通状态下的文字
       button.setTitleColor(UIColor.yellow, for: .normal)
       //触摸状态下的文字
       button.setTitleColor(UIColor.red, for: .highlighted)
       //禁用状态下的文字
       button.setTitleColor(UIColor.gray, for: .disabled)

       //按钮文字阴影颜色的设置
        //普通状态下文字阴影的颜色
       button.setTitleShadowColor(UIColor.purple, for: .normal)
      //普通状态下文字阴影的颜色
       button.setTitleShadowColor(UIColor.red, for: .highlighted)
       //普通状态下文字阴影的颜色
       button.setTitleShadowColor(UIColor.green, for: .disabled)

       button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        //自动换行（按词拆分） 打开自动换行属性，可以通过字符串里掺入换行符精确控制换行位置
       // button.titleLabel?.lineBreakMode = .byWordWrapping
        //设置文字偏移量
        //button.titleEdgeInsets = UIEdgeInsets(top:0,left:20,bottom: 0, right: 0)
       // button.imageEdgeInsets = UIEdgeInsets(top:0,left:20,bottom:0,right: 0)
       
        //传参，用冒号
        
        if let titleStr = button.titleLabel?.text
        {
            print("设置按钮文字图片相对位置")
            button.adjustLabelAndImagePosition(image: buttonImage, title: titleStr, titlePosition: .top, additionalSpacing: 0, state: .normal)
        }
       // 无参数
        //button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        //有参数
        button.addTarget(self,action:#selector(tapped(_:)), for: .touchUpInside)
        
       self.view.addSubview(button)
    }

    @objc func tapped(_ button: UIButton){
        print(button.titleLabel?.text ?? "按钮没有标题")
    }

}

