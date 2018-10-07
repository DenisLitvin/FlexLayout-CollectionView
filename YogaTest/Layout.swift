//
//  Layout.swift
//  YogaTest
//
//  Created by Denis Litvin on 10/1/18.
//  Copyright © 2018 Denis Litvin. All rights reserved.
//

import UIKit

class Layout: UICollectionViewFlowLayout {
    
    var animator: UIDynamicAnimator!
    var visibleIndexPaths = Set<IndexPath>()
    
    override init() {
        super.init()
        
        animator = UIDynamicAnimator(collectionViewLayout: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func prepare() {
        let attr = super.layoutAttributesForElements(in: .zero)
        UISnapBehavior(item: (attr?.first)!, snapTo: .zero)
    }
    
    
//    var prevOffset: Float = 0
    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let attr = super.layoutAttributesForElements(in: CGRect(x: rect.origin.x - 100, y: rect.origin.y, width: rect.width, height: rect.height + 200)) ?? [UICollectionViewLayoutAttributes]()
//        let currentVisibleItems = Set(attr)
//        let currentVisibleIndexPaths = Set(attr.map { $0.indexPath })
//        let attachments = animator.behaviors as! [UIAttachmentBehavior]
//        //delete behaviours that are not visible
//        let notVisibleBehaviours = attachments.filter { (behaviour) in
//            let item = behaviour.items.first as! UICollectionViewLayoutAttributes
//            return !currentVisibleIndexPaths.contains(item.indexPath)
//        }
//        notVisibleBehaviours.forEach { behaviour in
//            animator.removeBehavior(behaviour)
//            let item = behaviour.items.first as! UICollectionViewLayoutAttributes
//            visibleIndexPaths.remove(item.indexPath)
//        }
//        let touchLocation = collectionView?.panGestureRecognizer.location(in: collectionView) ?? .zero
//        let offset = Float(collectionView?.contentOffset.y ?? 0)
//        var delta = offset - prevOffset
//        prevOffset = offset
//
//        //create behaviours for newly visible items
//        let newlyVisible = currentVisibleItems.filter { (item) in
//            return !visibleIndexPaths
//                .contains(item.indexPath)
//        }
//        delta = delta * 3
//        newlyVisible.forEach { (item) in
//            let behaviour = UIAttachmentBehavior(item: item, attachedToAnchor: item.center)
//            behaviour.frequency = 10
//            behaviour.length = 4
//            behaviour.damping = 0.1
//            animator.addBehavior(behaviour)
//
//            if !(touchLocation == .zero) {
//                let offsetY = fabsf(Float(touchLocation.y - behaviour.anchorPoint.y))
//                let offsetX = fabsf(Float(touchLocation.x - behaviour.anchorPoint.x))
//                let scrollResistance: Float = (offsetY + offsetX) / 1500
//
//                var center = item.center
//                if delta < 0 {
//                    center.y += CGFloat(max(delta, delta * scrollResistance))
//                }
//                else {
//                    center.y += CGFloat(min(delta, delta * scrollResistance))
//                }
//                item.center = center
//            }
//        }
//        //update old items
//        let oldVisible = currentVisibleItems.subtracting(newlyVisible)
//        oldVisible.forEach { (item) in
//            if !(touchLocation == .zero) {
//                let offsetY = fabsf(Float(touchLocation.y - item.center.y))
//                let offsetX = fabsf(Float(touchLocation.x - item.center.x))
//                let scrollResistance: Float = (offsetY + offsetX) / 1500
//
//                var center = item.center
//                if delta < 0 {
//                    center.y += CGFloat(max(delta, delta * scrollResistance))
//                }
//                else {
//                    center.y += CGFloat(min(delta, delta * scrollResistance))
//                }
//                item.center = center
//                animator.updateItem(usingCurrentState: item)
//            }
//        }
//        visibleIndexPaths = currentVisibleIndexPaths
//
//        return animator.items(in: rect) as? [UICollectionViewLayoutAttributes]
//    }
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return animator.layoutAttributesForCell(at:indexPath)
//    }
}
