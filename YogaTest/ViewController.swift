//
//  ViewController.swift
//  YogaTest
//
//  Created by Denis Litvin on 9/30/18.
//  Copyright © 2018 Denis Litvin. All rights reserved.
//

import UIKit
import FlexLayout
import Pinner

class Cell: UICollectionViewCell, DataBinder {
    
    let title1 = UILabel()
    let title2 = UILabel()
    let title3 = UILabel()
    let title4 = UILabel()


    func set(data: String) {
        title1.text = "\(data) \(data)"
        title1.flex.markDirty()
        
        title2.text = "\(data)"
        title2.flex.markDirty()
        
        flex.markDirty()
        flex.layout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title1.font = UIFont.systemFont(ofSize: 20)
        title1.numberOfLines = 0
        title1.backgroundColor = .yellow
        
        title2.font = UIFont.systemFont(ofSize: 20)
        title2.backgroundColor = .blue
        title2.numberOfLines = 0
        
        title3.font = UIFont.systemFont(ofSize: 20)
        title3.numberOfLines = 0
        title3.backgroundColor = .red
        
        title4.font = UIFont.systemFont(ofSize: 20)
        title4.backgroundColor = .green
        title4.numberOfLines = 0
        
        title3.text = "12332"
        title4.text = "IN 3 MONTHS"

        backgroundColor = .white
        contentView.flex.direction(.row).justifyContent(.spaceBetween).alignItems(.center).define { (flex) in
            flex.addItem().shrink(1).define({ (flex) in
                flex.addItem(title1)
                flex.addItem(title2).marginTop(10)
            })
            flex.addItem().alignItems(.end).define({ (flex) in
                flex.addItem(title3)
                flex.addItem(title4).marginTop(10)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func layout(size: CGSize) {
        flex.size(size).layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout(size: CGSize(width: size.width, height: size.height))
        return CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    
    override var intrinsicContentSize: CGSize {
        return sizeThatFits(CGSize(width: frame.width, height: frame.height))
    }
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        let collection = CollectionView<Cell, Cell, Cell>.init(collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .red

//        collection.footerData = ["Footer"]
//        collection.footerEnabled = true
//
//        collection.headerData = ["header"]
//        collection.headerEnabled = true
        collection.cellData = [[
            "title1 title1",
            "t2",
            "title3",
            "titl fpaejo fpaef4",
            "t2 r dt",
            "title3",
            "titl fpaejo fhf jgf jef4",
            "t2",
            "title3",
            "tjo4",
            "t2",
            "title3",
            "titl fpaejo fp h xth rth a;kdnfiajdo jiodh aoifsoi aodxrth xrthx rth aef4",
            "tit oaihfoia hfoa dih aodh oaid oahiaole3",
            "titl fpaejo fp h xth rthxrth xrthx rth aef4 adf ad"
        ]]
        view.addSubview(collection)
        collection.fillSuperview()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
//        self.view.flex.markDirty()
//        self.view.flex.size(size).layout()
        view.layoutIfNeeded()
        (self.view.subviews.first! as! UICollectionView).reloadData()
//                ((self.view.subviews.first! as! UICollectionView).collectionViewLayout as! UICollectionViewFlowLayout).invalidateLayout()
    }
}

extension ViewController {
    @objc func injected() {
        UIApplication.shared.keyWindow?.rootViewController = ViewController()
    }
}
