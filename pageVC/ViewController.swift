//
//  ViewController.swift
//  pageVC
//
//  Created by anvar on 25/05/22.
//

import UIKit
import FSPagerView

class ViewController: UIViewController {
    let imageNames = ["Image","телефон","13promax","3 81"]
    
    @IBOutlet var pagerControl: FSPageControl! {
        didSet {
            self.pagerControl.numberOfPages = self.imageNames.count
            self.pagerControl.contentHorizontalAlignment = .center
            
            self.pagerControl.hidesForSinglePage = true
        }
    }
    @IBOutlet var pagerView: FSPagerView! {
        didSet {
                self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            }
    }
//    var redPath: UIBezierPath {
//        let redPath = UIBezierPath()
//
//        let width: CGFloat = view.frame.size.width
//        let height: CGFloat = view.frame.size.height
//
//        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), cornerRadius: 0)
//        let rect = CGRect(x: 100, y: 50, width:  100, height: 125)
//        let circlePath = UIBezierPath(ovalIn: rect)
//        path.append(circlePath)
//        path.usesEvenOddFillRule = true
//
//
//
//        return redPath
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerControl.setImage(UIImage(named: "Прямоугольник 1"), for: .selected)
        pagerControl.interitemSpacing = 16
    }
    


}
extension ViewController: FSPagerViewDelegate,FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        self.imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        
        return cell
    }
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
    }
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pagerControl.currentPage = targetIndex
    }
    
    
}


