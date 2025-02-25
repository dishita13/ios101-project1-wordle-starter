//
//  ViewController.swift
//  Wordle
//
//  Created by Mari Batilando on 2/12/23.
//

import UIKit //buttons, labels, views

//UIViewController is the base class for Screens
//ViewController is subclass of UIViewController
class ViewController: UIViewController {

  //IBOutlet connects to storyboard (graphical UI editor)
  //create a view for words and keyboard. both use UICollectionView for grid of items
  @IBOutlet weak var wordsCollectionView: UICollectionView!
  @IBOutlet weak var keyboardCollectionView: UICollectionView!

  //Controllers handle logic. private to this ViewController class.
  private var boardController: BoardController!
  private var keyboardController: KeyboardController!

    //function for when screen loads very first time.
  override func viewDidLoad() {
    //bc viewcontroller is a subclass, it ensures that the parent class: UIViewController will load first
    super.viewDidLoad()

    setupNavigationBar()

    //pass in the Views (input) to the Controllers (logic to handle input)
    boardController = BoardController(collectionView: wordsCollectionView)
    keyboardController = KeyboardController(collectionView: keyboardCollectionView)
    /*
      Exercise 3: Assign a closure to the `didSelectString` property of `keyboardController` (see KeyboardController.swift):
      
      This closure takes in a string (the string selected from the keyboard).
      If the string is equal to the `DELETE_KEY` constant (see Constants.swift), then call the `deleteLastCharacter` method of `boardController`.
      Else, it should use the `enter` method of `boardController` and pass in the selected string as the argument.
     */
    // START YOUR CODE HERE
      keyboardController.didSelectString = { selectedString in
          if selectedString == DELETE_KEY {
              self.boardController.deleteLastCharacter()
          } else {
              self.boardController.enter(selectedString)
          }
      }

    // END YOUR CODE HERE
  }
}
