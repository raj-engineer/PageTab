//
//  PageViewController.swift
//  PagingDemo
//
//  Created by Rajesh on 17/12/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//


import UIKit

class PageViewController: UIPageViewController
{
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "ViewController1"),
            self.getViewController(withIdentifier: "ViewController2"),
            self.getViewController(withIdentifier: "ViewController3"),
            self.getViewController(withIdentifier: "ViewController4")
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate   = self
        Helper.sharedHelper.pageControllerInstance = self
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll , navigationOrientation: .horizontal ,options :nil)
    }
    func setControllers(value : Int){
        
        setViewControllers([pages[value]], direction: .forward, animated: true, completion: nil)
    }
}

extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        //   guard previousIndex >= 0          else { return pages.last }
        guard previousIndex >= 0          else { return nil }
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        //   guard nextIndex < pages.count else { return pages.first }
        guard nextIndex < pages.count else { return nil }
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        let currentpage = pageViewController.viewControllers!.first!.view.tag
        print("currentPage", currentpage)
        // print("currentPage", pageViewController.in)
        
        if let parent = self.parent as? HomeVC {
            parent.setTabUI(index: currentpage)
        }
    }
}

extension PageViewController: UIPageViewControllerDelegate { }

