//
//  TableViewCellDashboard.swift
//  Kompete
//
//  Created by Jeyavijay Nedumaran on 4/9/19.
//  Copyright © 2019 Jeyavijay Nedumaran. All rights reserved.
//

import UIKit

class TableViewCellDashboard: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewDashboard: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        initCollectionViewUI()
        addObserver()

    }
    
    func initCollectionViewUI(){
        collectionViewDashboard.delegate = self
        collectionViewDashboard.dataSource = self
        self.collectionViewDashboard?.register(UINib(nibName: "CollectionViewCellDashboard", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellDashboard")
        
        collectionViewDashboard.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "HeaderCollectionReusableView")
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: CGFloat(self.collectionViewDashboard.frame.size.width), height: (self.collectionViewDashboard.frame.size.width/5));
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: self.collectionViewDashboard.frame.size.width/3, height: self.collectionViewDashboard.frame.size.width/3)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionViewDashboard.collectionViewLayout = layout
        collectionViewDashboard.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    var collectionViewObserver: NSKeyValueObservation?

    func addObserver() {
        collectionViewObserver = collectionViewDashboard.observe(\.contentSize, changeHandler: { [weak self] (collectionViewDashboard, change) in
            self?.collectionViewDashboard.invalidateIntrinsicContentSize()
            self?.heightConstraint.constant = collectionViewDashboard.contentSize.height
            self?.layoutIfNeeded()
        })
    }
    deinit {
        collectionViewObserver = nil
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellDashboard", for: indexPath as IndexPath) as! CollectionViewCellDashboard
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath)
        view.backgroundColor = UIColor.blue
        let label = UILabel(frame: view.bounds);
        label.text = String(indexPath.section);
        label.font = UIFont(name: "helvetica", size: 16);
        label.textAlignment = .right;
        view.addSubview(label);
        return view;
        
    }
}


