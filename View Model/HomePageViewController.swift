//
//  HomePageViewController.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var collectionViewPost: UICollectionView!
    
    let jsonHelper = JSONHelper()
    var dataPost: [Post] = []
    var finalDataPost: [FinalDataPost] = []
    var userID = UserDefaults.standard.integer(forKey: "userID")
    var detailComment = DetailPostViewController()
    var dataComment: [Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataComment = detailComment.comment
        
        collectionViewPost.delegate = self
        collectionViewPost.dataSource = self
        
        jsonHelper.fetchDataPost { data in
            DispatchQueue.main.async {
                for value in data{
                    if value.userId != self.userID{
                        self.dataPost.append(value)
                    }
                }
                self.getRelatedDataPost(dataPost: self.dataPost)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func getRelatedDataPost(dataPost: [Post]){
        jsonHelper.fetchDataUser { dataUser in
            DispatchQueue.main.async {
                for post in dataPost{
                    for user in dataUser{
                        if post.userId == user.id{
                            self.finalDataPost.append(FinalDataPost(id: post.id, name: user.username, body: post.body, sumComment: 5))
                        }
                    }
                }
                self.collectionViewPost.reloadData()
            }
        }
    }
}

extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return finalDataPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 357, height: 174)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionViewPost.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        cell.labelName.text = finalDataPost[indexPath.row].name
        cell.txtContent.text = finalDataPost[indexPath.row].body
        cell.labelSumComment.text = String(dataComment.count)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToDetailPostPage(idPost: finalDataPost[indexPath.row].id, username: finalDataPost[indexPath.row].name, content: finalDataPost[indexPath.row].body)
    }
    
    func goToDetailPostPage(idPost: Int, username: String, content: String){
        let showDetailPost = UIStoryboard(name: "DetailPost", bundle: nil)
        let vc = showDetailPost.instantiateViewController(identifier: "DetailPost") as! DetailPostViewController
        vc.idPost = idPost
        vc.username = username
        vc.content = content
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
