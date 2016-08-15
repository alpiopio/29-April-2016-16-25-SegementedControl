//
//  HomeViewController.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 27/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

enum EventType: Int {
    case None = -1
    case Event = 0
    case Movies = 1
    case MyTickets = 2
    
    static func sectionForIndex(index: Int) -> EventType {
        if let optionalSection = EventType(rawValue: index) {
            return optionalSection
        } else {
            return EventType.None
        }
    }
}

enum EventHomePart: Int {
    case None = -1
    case Hello = 0
    case WhatsHappening = 1
    case HotDeals = 2
    case Explore = 3
    
    static func sectionForIndex(index: Int) -> EventHomePart {
        if let optionalSection = EventHomePart(rawValue: index) {
            return optionalSection
        } else {
            return EventHomePart.None
        }
    }
}

class HomeViewController: UIViewController {

    private var currentViewController: UIViewController?
    var viewControllersA: [ UIViewController ]?
    
    @IBOutlet weak var homeSegmentedController: UISegmentedControl!
    @IBAction func homeSegmentedControllerAction(sender: UISegmentedControl) {
//        print(sender.selectedSegmentIndex)
//        self.displayCurrentViewController(sender.selectedSegmentIndex, setContainer: self.homeView)
        self.segmentedControllerSection = EventType.sectionForIndex(sender.selectedSegmentIndex)
    }
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var topSearchConstraint: NSLayoutConstraint!
    
    var homeEvents: HomeEvents?
    var homeMovies: HomeMovies?
    var homeMyTickets: HomeMyTickets?
    var homeNoTicket: HomeNoTicket?
    
    private var searchController: UISearchDisplayController?
    
    var homeEventDatasoure: HomeEventsProtocol?
    
    var segmentedControllerSection: EventType? {
        didSet {
            if let section = self.segmentedControllerSection {
                self.initSegmentedControl(section)
                
                if section == EventType.Event {
                    self.homeEvents?.hidden = false
                    self.homeMovies?.hidden = true
                    self.homeMyTickets?.hidden = true
                    self.homeNoTicket?.hidden = true
                } else if section == EventType.Movies {
                    self.homeEvents?.hidden = true
                    self.homeMovies?.hidden = false
                    self.homeMyTickets?.hidden = true
                    self.homeNoTicket?.hidden = true
                } else if section == EventType.MyTickets {
                    self.homeEvents?.hidden = true
                    self.homeMovies?.hidden = true
                    self.homeMyTickets?.hidden = false
                    self.homeNoTicket?.hidden = false
                }
            }
        }
    }
    
    var gotixEventsViewModel: GotixEventsViewModel?
    var homeHotDealsViewModel: GotixEventsViewModel?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Gotix"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gotixEventsViewModel = GotixEventsViewModel()
        self.segmentedControllerSection = EventType.Movies
        
        self.configure()
        
        self.navigationController?.navigationBar.translucent = false
        
        self.viewControllersA = [ FirstViewController(), TryViewController() ]
    }
    
    private func configure() {
        self.configureHomeEvents()
        self.configureHomeMovies()
        self.configureHomeMyTickets()
        self.configureHomeNoTicket()
        self.configureSearch()
        
        self.homeEventDatasoure = HomeEventsProtocol(collectionView: self.homeEvents!.collectionView)
        self.homeEventDatasoure?.viewModel = self.gotixEventsViewModel
    }
    
    private func initSegmentedControl(section: EventType) {
        self.homeSegmentedController.selectedSegmentIndex = section.rawValue
    }
    
    private func configureHomeEvents() {
        let mainBundle: NSBundle = NSBundle.mainBundle()
        
        let homeEventsNibs: [ AnyObject ] = mainBundle.loadNibNamed("HomeEvents", owner: nil, options: nil)
        let homeEvents: HomeEvents = homeEventsNibs[0] as! HomeEvents
            homeEvents.frame = CGRectMake(0, 0, self.homeView.frame.width, self.homeView.frame.height)
        
        self.homeEvents = homeEvents
        self.homeView.addSubview(homeEvents)
    }
    
    private func configureHomeMovies() {
        let mainBundle: NSBundle = NSBundle.mainBundle()
        
        let homeMoviesNibs: [ AnyObject ] = mainBundle.loadNibNamed("HomeMovies", owner: nil, options: nil)
        let homeMovies: HomeMovies = homeMoviesNibs[0] as! HomeMovies
            homeMovies.frame = CGRectMake(0, 0, self.homeView.frame.width, self.homeView.frame.height)
        
        self.homeMovies = homeMovies
        self.homeView.addSubview(homeMovies)
    }
    
    private func configureHomeMyTickets() {
        let mainBundle: NSBundle = NSBundle.mainBundle()
        
        let homeMyTicketsNibs: [ AnyObject ] = mainBundle.loadNibNamed("HomeMyTickets", owner: nil, options: nil)
        let homeMyTickets: HomeMyTickets = homeMyTicketsNibs[0] as! HomeMyTickets
            homeMyTickets.frame = CGRectMake(0, 0, self.homeView.frame.width, self.homeView.frame.height)
        
        self.homeMyTickets = homeMyTickets
        self.homeView.addSubview(homeMyTickets)
    }
    
    private func configureHomeNoTicket() {
        let mainBundle: NSBundle = NSBundle.mainBundle()
        
        let homeNoTicketNibs: [ AnyObject ] = mainBundle.loadNibNamed("HomeNoTicket", owner: nil, options: nil)
        let homeNoTicket: HomeNoTicket = homeNoTicketNibs[0] as! HomeNoTicket
            homeNoTicket.frame = CGRectMake(0, 0, self.homeView.frame.width, self.homeView.frame.height)
        
        self.homeNoTicket = homeNoTicket
        self.homeView.addSubview(homeNoTicket)
    }

}

class HomeEventsProtocol: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView?
    
    var countCategory: Int = 0
    var viewModel: GotixEventsViewModel? {
        didSet {
            if let collectionView = self.collectionView {
                if let count = self.viewModel?.gotixEventsModel?.count {
                    self.countCategory = count
                }
                collectionView.reloadData()
            }
        }
    }
    
    private func registerNibs() {
        let helloNib: UINib = UINib(nibName: "EventHelloCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(helloNib, forCellWithReuseIdentifier: "cellHello")
        
        let whatsHappeningNib: UINib = UINib(nibName: "EventWhatsHappeningCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(whatsHappeningNib, forCellWithReuseIdentifier: "cellHappening")
        
        let EventHotDealsNib: UINib = UINib(nibName: "EventHotDealsCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(EventHotDealsNib, forCellWithReuseIdentifier: "cellHotDeals")
        
        let EventExplorerNib: UINib = UINib(nibName: "EventExploreCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(EventExplorerNib, forCellWithReuseIdentifier: "cellExplorer")
        
        let HeaderNib: UINib = UINib(nibName: "Header", bundle: nil)
        self.collectionView?.registerNib(HeaderNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
    }
    
    init(collectionView: UICollectionView) {
        super.init()

        self.collectionView = collectionView
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
        self.collectionView?.collectionViewLayout = layout()
        
        self.registerNibs()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let section = EventHomePart(rawValue: indexPath.item)
        if let section = section {
            switch section {
            case EventHomePart.Hello:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! EventHelloCollectionViewCell
                return cell
            case EventHomePart.WhatsHappening:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHappening", forIndexPath: indexPath) as! EventWhatsHappeningCollectionViewCell
                    cell.viewModel = self.viewModel
                return cell
            case EventHomePart.HotDeals:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHotDeals", forIndexPath: indexPath) as! EventHotDealsCollectionViewCell
                    cell.viewModel = self.viewModel
                return cell
            case EventHomePart.Explore:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellExplorer", forIndexPath: indexPath) as! EventExploreCollectionViewCell
                    cell.viewModel = self.viewModel
                return cell
            default:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! EventHelloCollectionViewCell
                return cell
            }
        }
        return collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! EventHelloCollectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let section = EventHomePart(rawValue: indexPath.item)
        if let section = section {
            switch section {
            case EventHomePart.Hello:
                return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(202/360))
            case EventHomePart.WhatsHappening:
                if self.countCategory != 0 {
                    return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(400/360))
                }
                return CGSizeMake(UIScreen.mainScreen().bounds.width, 90)
            case EventHomePart.HotDeals:
                if self.countCategory != 0 {
                    return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(400/360))
                }
                return CGSizeMake(UIScreen.mainScreen().bounds.width, 90)
            case EventHomePart.Explore:
                if self.countCategory != 0 {
                    return CGSizeMake(UIScreen.mainScreen().bounds.width, (CGFloat(self.countCategory)*(UIScreen.mainScreen().bounds.width*(125/375)+10)+60))
                }
                return CGSizeMake(UIScreen.mainScreen().bounds.width, 70)
            default:
                return CGSizeMake(0, 0)
            }
        }
        
        return CGSizeMake(0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Header", forIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(173/375))
    }
}

class MoviesColectionviewController: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView?
    
    private func registerNibs() {
        let helloNib: UINib = UINib(nibName: "EventHelloCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(helloNib, forCellWithReuseIdentifier: "cellHello")
    }
    
    init(collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        self.registerNibs()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! EventHelloCollectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((UIScreen.mainScreen().bounds.width-30)/2, 200)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let IMAGEHEIGHT: CGFloat = 200
        let COLLECTIONVIEWHEIGHT: CGFloat = 200
        
        let offset = scrollView.contentOffset.y
        let precentage = offset/IMAGEHEIGHT
        let NEWHEIGHT = IMAGEHEIGHT*precentage
        let NEWIMAGEHEIGHT = (IMAGEHEIGHT-NEWHEIGHT <= 0) ? 0 : IMAGEHEIGHT-NEWHEIGHT
        let NEWALPHA = (1-fabs(precentage) <= 0) ? 0 : 1-fabs(precentage)
        let NEWCOLLECTIONVIEWHEIGHT = COLLECTIONVIEWHEIGHT + (IMAGEHEIGHT - NEWIMAGEHEIGHT)
        
        print("IMAGE HEIGHT = \(NEWIMAGEHEIGHT)")
        print("COLLECTION HEIGHT = \(NEWCOLLECTIONVIEWHEIGHT)")
        print("ALPHA = \(NEWALPHA)")
    }
}

extension HomeViewController: UISearchDisplayDelegate, UISearchBarDelegate {
    func configureSearch() {
        if let searchBar = self.homeEvents?.searchBar {
            searchBar.delegate = self
            
            self.searchController = UISearchDisplayController(searchBar: searchBar, contentsController: self)
            self.searchController?.delegate = self
        }
    }
    
    func searchDisplayControllerDidEndSearch(controller: UISearchDisplayController) {
        print("end ...")
    }
    
    func searchDisplayControllerDidBeginSearch(controller: UISearchDisplayController) {
        print("begin ...")
//        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
//            self.searchController?.displaysSearchBarInNavigationBar = true
//            self.homeView.layoutIfNeeded()
//            }) { (completed) in
//                self.navigationController?.navigationBar.translucent = true
//        }
    }
//    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
//        print("begin editing")
//        return true
//    }
//    
//    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
//        print("end editing")
//        return true
//    }
//    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        print("cancel")
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        print("searching")
//    }
//    
//    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        print("text change")
//    }
//    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        print("begin editing ...")
//    }
//    
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        print("end editing ...")
//    }
}

class layout: UICollectionViewFlowLayout {
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElementsInRect(rect)! as [UICollectionViewLayoutAttributes]
        let offset = collectionView!.contentOffset
        if (offset.y < 0) {
            let deltaY = fabs(offset.y)
            for attributes in layoutAttributes {
                if let elementKind = attributes.representedElementKind {
                    if elementKind == UICollectionElementKindSectionHeader {
                        var frame = attributes.frame
                        frame.size.height = max(0, frame.size.height + deltaY)
                        frame.origin.y = CGRectGetMinY(frame) - deltaY
                        attributes.frame = frame
                    }
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
}

extension HomeViewController {
    private func getViewController(index: Int) -> UIViewController {
        if let vcs = self.viewControllersA {
            return vcs[index]
        }
        return UIViewController()
    }
    
    func displayCurrentViewController(index: Int, setContainer: UIView) {
        let vc  = self.getViewController(index)
        
        self.addChildViewController(vc)
        vc.didMoveToParentViewController(self)
        
        vc.view.frame = setContainer.bounds
        setContainer.addSubview(vc.view)
        self.currentViewController = vc
    }
    
    func displayCurrentTab(index: Int, setContainer: UIView) {
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.removeFromParentViewController()
        
        self.displayCurrentViewController(index, setContainer: setContainer)
    }
}