//
//  ViewController.swift
//  tapper
//
//  Created by Marvin Andara on 7/10/16.
//  Copyright © 2016 MarvinAndara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps: Int = 0;
    var currentTaps: Int = 0;
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton){
        currentTaps += 1;
        updateTapsLbl();
        if isGameOver(){
            restartGame();
        }
    }
    @IBAction func onClickHowManyTaps(sender: UITextField!){
        howManyTapsTxt.text = "";
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!){
        
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" && howManyTapsTxt.text != "How many taps to win?"{
            
            logoImg.hidden = true;
            playBtn.hidden = true;
            howManyTapsTxt.hidden = true;
            
            tapBtn.hidden = false;
            tapsLbl.hidden = false;
            
            maxTaps = Int(howManyTapsTxt.text!)!;
            currentTaps = 0;
            
            updateTapsLbl();
        }
    }
    
    func restartGame(){
        maxTaps = 0;
        howManyTapsTxt.text = "How many taps to win?";
        logoImg.hidden = false;
        playBtn.hidden = false;
        howManyTapsTxt.hidden = false;
        
        tapBtn.hidden = true;
        tapsLbl.hidden = true;
    }
    
    func isGameOver() -> Bool{
        if currentTaps >= maxTaps{
            return true;
        }
        else{
            return false;
        }
        
    }
    func updateTapsLbl(){
        tapsLbl.text = "\(currentTaps) Taps";
    }

}

