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

    @IBOutlet weak var homeSegmentedController: UISegmentedControl!
    @IBAction func homeSegmentedControllerAction(sender: UISegmentedControl) {
        self.segmentedControllerSection = EventType.sectionForIndex(sender.selectedSegmentIndex)
    }
    @IBOutlet weak var homeView: UIView!
    
    var homeEvents: HomeEvents?
    var homeMovies: HomeMovies?
    var homeMyTickets: HomeMyTickets?
    var homeNoTicket: HomeNoTicket?
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Gotix"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        self.gotixEventsViewModel = GotixEventsViewModel()
        self.segmentedControllerSection = EventType.Movies
    }
    
    private func configure() {
        self.configureHomeEvents()
        self.configureHomeMovies()
        self.configureHomeMyTickets()
        self.configureHomeNoTicket()
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
        
        self.homeEventDatasoure = HomeEventsProtocol(collectionView: self.homeEvents!.collectionView)
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
    
    private func registerNibs() {
        let helloNib: UINib = UINib(nibName: "EventHelloCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(helloNib, forCellWithReuseIdentifier: "cellHello")
        
        let whatsHappeningNib: UINib = UINib(nibName: "EventWhatsHappeningCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(whatsHappeningNib, forCellWithReuseIdentifier: "cellHappening")
        
        let EventHotDealsNib: UINib = UINib(nibName: "EventHotDealsCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(EventHotDealsNib, forCellWithReuseIdentifier: "cellHotDeals")
        
        let EventExplorerNib: UINib = UINib(nibName: "EventExploreCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(EventExplorerNib, forCellWithReuseIdentifier: "cellExplorer")
    }
    
    init(collectionView: UICollectionView) {
        super.init()

        self.collectionView = collectionView
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
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
                return cell
            case EventHomePart.HotDeals:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHotDeals", forIndexPath: indexPath) as! EventHotDealsCollectionViewCell
                return cell
            case EventHomePart.Explore:
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellExplorer", forIndexPath: indexPath) as! EventExploreCollectionViewCell
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
                return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(380/360))
            case EventHomePart.HotDeals:
                return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(400/360))
            case EventHomePart.Explore:
                return CGSizeMake(UIScreen.mainScreen().bounds.width, 10*(120+10))
            default:
                return CGSizeMake(0, 0)
            }
        }
        
        return CGSizeMake(0, 0)
    }
}
