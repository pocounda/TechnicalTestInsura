//
//  DetailPostViewController.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import UIKit

class DetailPostViewController: UIViewController {

    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtContent: UITextView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var collectionViewComment: UICollectionView!
    
    var username = ""
    var content = ""
    var idPost = 0
    let comment = [Comment(name: "Andi", content: "Halo Semuanya"), Comment(name: "Michael", content: "Sangat Menarik"), Comment(name: "Michelle", content: "Ini Sangat Membantu Sekali")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail Post"
        txtName.text = username
        txtContent.text = content
        txtContent.isUserInteractionEnabled = false
        viewBackground.layer.cornerRadius = 10
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = #colorLiteral(red: 0.9866532683, green: 0.5863298774, blue: 0.4647909403, alpha: 1)
        
        collectionViewComment.delegate = self
        collectionViewComment.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension DetailPostViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comment.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionViewComment.register(CommentCollectionViewCell.nib(), forCellWithReuseIdentifier: CommentCollectionViewCell.identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCollectionViewCell.identifier, for: indexPath) as! CommentCollectionViewCell
        cell.txtName.text = comment[indexPath.row].name
        cell.txtComment.text = comment[indexPath.row].content
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 321, height: 51)
    }
}
