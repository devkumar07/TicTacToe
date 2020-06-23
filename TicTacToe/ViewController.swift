//
//  ViewController.swift
//  TicTacToe
//
//  Created by Devanshu Kumar on 6/22/20.
//  Copyright © 2020 Devanshu Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentPlayer = "X"
    
    var cells = [0,0,0,0,0,0,0,0,0]
    
    var gameActive = true
    
    let winningPatterns = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
    
    
    @IBOutlet weak var GameStatus: UILabel!
    
    
    @IBAction func action(_ sender: AnyObject) {
        
        if(cells[sender.tag] == 0){
            if(currentPlayer == "X"){
                sender.setImage(UIImage(named: "X.png"), for: UIControl.State())
                currentPlayer = "O"
                cells[sender.tag] = 1
            }
            
            else{
                sender.setImage(UIImage(named: "O.png"), for: UIControl.State())
                currentPlayer = "X"
                cells[sender.tag] = 2
            }
            GameStatus.isHidden = true
            playAgainButton.isHidden = true
        }
        for combination in winningPatterns{
            if(cells[combination[0]] != 0 && cells[combination[0]] == cells[combination[1]] && cells[combination[1]] == cells[combination[2]]){
                gameActive = false
                if(cells[combination[0]] == 1){
                    //print("X has won!")
                    GameStatus.text = "X has Won!"
                }
                else{
                    //print("O has won!")
                    GameStatus.text = "O has Won!"
                }
                GameStatus.isHidden = false
                playAgainButton.isHidden = false
            }
        }
        
        gameActive = false
        
        for i in cells{
            if i == 0{
                gameActive = true
                break
            }
        }
        
        if gameActive == false{
            GameStatus.text = "It is a Draw!"
            GameStatus.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        
        cells = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        currentPlayer = "X"
        
        GameStatus.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 0...8{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

