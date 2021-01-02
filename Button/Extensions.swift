//
//  Extensions.swift
//  Button
//
//  Created by Lizihao Li on 2021/1/1.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 调整按钮中图片和文字的相对位置
    /// - Parameters:
    ///   - anImage: 按钮图片
    ///   - title: 按钮标题
    ///   - titlePosition: .top:上图下文；left:左图右文 .bottom: 上文下图.right: 左文右图
    ///   - additionalSpacing: 图片和文字间距，仅在left和right 有效
    ///   - state: 按钮状态
    @objc func adjustLabelAndImagePosition(image anImage: UIImage?, title: String,
                   titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State)
    {
        
        self.imageView?.backgroundColor = UIColor.gray
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        self.titleLabel?.backgroundColor = UIColor.red
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
        
    }
    
    private func positionLabelRespectToImage(title: String, position: UIView.ContentMode, spacing: CGFloat)
    {
        var imageSize : CGSize = CGSize(width: 0, height: 0)
        var titleSize: CGSize = CGSize(width: 0, height: 0)
        var titleInsets: UIEdgeInsets = self.titleEdgeInsets
        var imageInsets: UIEdgeInsets = self.imageEdgeInsets
        let localSpace = spacing / 2.0
        
        if let localImageSize = self.imageView?.bounds.size
        {
            imageSize = localImageSize
        }
        if let localTitleSize = self.titleLabel?.bounds.size
        {
            titleSize = localTitleSize
        }
        switch position {
            //左图片右边文字
        case .left:
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: localSpace)
            titleInsets = UIEdgeInsets(top: 0, left: localSpace, bottom: 0, right: 0)
            //左文字右图片
        case .right:
            imageInsets = UIEdgeInsets(top: 0, left: titleSize.width + localSpace, bottom: 0, right: -(titleSize.width + localSpace))
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width + localSpace), bottom: 0, right: imageSize.width + localSpace)
            //上文下图
        case .bottom:
            titleInsets  = UIEdgeInsets(top: -titleSize.height / 2,
                                        left: -(imageSize.width / 2), bottom: titleSize.height / 2, right:imageSize.width / 2)
            imageInsets = UIEdgeInsets(top: imageSize.height / 2, left: titleSize.width / 2.0, bottom: -imageSize.height / 2, right: -titleSize.width / 2.0 )
        //上图下字
        case .top:
            
            imageInsets = UIEdgeInsets(top: -imageSize.height / 2.0, left: titleSize.width / 2.0, bottom: imageSize.height / 2.0, right: -titleSize.width / 2.0)
            titleInsets  = UIEdgeInsets(top:titleSize.height / 2.0,
                                        left: -imageSize.width / 2.0 , bottom: -titleSize.height / 2.0, right: imageSize.width / 2.0)
            
            
            
        default:
            break
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
