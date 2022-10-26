import UIKit

func bouncingBall(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
    let heightIsValid = h > 0
    let bounceIsValid = bounce > 0 && bounce < 1
    let windowIsValid = window < h
    
    let canCalculate = heightIsValid && bounceIsValid && windowIsValid
    
    var count = 1
        
    if (canCalculate) {
        count += bouncingBall(h * bounce, bounce, window)
        
        return count + 1
    } else {
        return -1
    }
}



print(bouncingBall(3, 0.66, 1.5))   //3
print(bouncingBall(30, 0.66, 1.5))  //15
print(bouncingBall(3, 1, 1.5))      //-1
