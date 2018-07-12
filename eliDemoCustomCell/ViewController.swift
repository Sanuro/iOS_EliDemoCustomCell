//
//  ViewController.swift
//  eliDemoCustomCell
//
//  Created by Jaewon Lee on 7/11/18.
//  Copyright © 2018 Jaewon Lee. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableData: [Review] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddEditSegue", sender: sender)
    }
    
    @IBAction func unwindTOVC(segue: UIStoryboardSegue){
        let src = segue.source as! AddEditVCViewController
        let title = src.titleTextField.text
        let rating = src.ratingTextField.text!
        let notes = src.notesTextView.text
        
        let newReview = Review(context: context)
        newReview.created_at = Date()
        newReview.title = title
        
        if let rating = Int16(rating) {
            newReview.rating = Int16(rating)
        }
        else{
            newReview.rating = 0
        }
        
        newReview.notes = notes
        
        
        appDelegate.saveContext()
        tableData.append(newReview)
        tableView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        
        fetchAllReviews()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    func fetchAllReviews(){
        let req:NSFetchRequest<Review> = Review.fetchRequest()
        do {
           tableData = try context.fetch(req)

        } catch {
            print(error)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        
        let review = tableData[indexPath.row]
        cell.titleLabel?.text = review.title
        cell.reviewLabel?.text = "\(review.rating)"
        cell.notesTextView?.text = review.notes
        cell.delegate = self
        
        
        let imgName = review.starred ? "Filled Star" : "mario Star"
        cell.starButton.setBackgroundImage(UIImage(named: imgName), for: .normal)
        
        
//        if review.starred{
//            cell.starButton.setBackgroundImage(UIImage(named: "Filled Star"), for: .normal)
//
//        }else{
//            cell.starButton.setBackgroundImage(UIImage(named: "mario Star"), for: .normal)
//        }
        
        return cell
    }
    
    
}

extension ViewController: ReviewCellDelegate{
    func starPressed(sender: ReviewCell) {
        let indexPath = tableView.indexPath(for: sender)!
        tableData[indexPath.row].starred = !tableData[indexPath.row].starred
        appDelegate.saveContext()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
