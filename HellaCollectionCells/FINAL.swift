//
//  FINAL.swift
//  HellaCollectionCells
//
//  Created by Bejan Fozdar on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FINAL: UICollectionViewController {

    var fibonacci: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("View did load.")
        
       fibonacci = getFibonacciSequence(to: 1000)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1000
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HellaCollectionViewCell
        
        
        
        cell.newCellLabel.text = "\(indexPath.item)"
        cell.backgroundColor = UIColor.yellow
//        if cell.newCellLabel.text == "10"{
//            cell.backgroundColor = UIColor.purple
//        }
        
        if fibonacci.contains(Int(indexPath.item)) {
            cell.backgroundColor = UIColor.purple
        }
        
        return cell
    }
    
    func getFibonacciSequence(to number: Int) -> [Int] {
        var fibonacci: [Int] = [0, 1, 1]
        var newFibonacci: Int = 0
        while fibonacci.last! <= number {
                newFibonacci = fibonacci.last! + fibonacci[fibonacci.count - 2]
                fibonacci.append(newFibonacci)
        }
        return fibonacci
    }
    
    //prepare for the segue, by pointing to the right segue identifier, then cast the segue.destination as the viewController class you'll be using for the View.  Then set the destination variable value to the list contents at the selected indexPath.row.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HellaDetailView" {
            if let dest = segue.destination as? HellaDetailViewController,
                let cell = sender as? HellaCollectionViewCell  {
                
                dest.fibText = cell.newCellLabel.text
                dest.hellaDetailColor = cell.backgroundColor!
            
                
            }
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
