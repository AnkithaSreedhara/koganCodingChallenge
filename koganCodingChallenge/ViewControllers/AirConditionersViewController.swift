//
//  AirConditionersViewController.swift
//  koganCodingChallenge
//
//  Created by Anki on 13/03/21.
//

import UIKit

class AirConditionersViewController: UIViewController {
    
    @IBOutlet weak var avgCubicWeightLabel: UILabel!{
        didSet{
            avgCubicWeightLabel.accessibilityIdentifier = "Average Cubic Weight"
        }
    }
    private var airConditionerViewModel : AirConditionerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner(onView: self.view)
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.airConditionerViewModel = AirConditionerViewModel()
        self.airConditionerViewModel.bindViewModelToController = {
            if let avgCubicWeight = self.airConditionerViewModel.averageCubitWeight{
                DispatchQueue.main.async {
                    // NOTE :  Decreasing the digits after decimal point to 2.
                    self.avgCubicWeightLabel.text = String(format: Strings.floatFormat, avgCubicWeight) + Strings.kg
                    self.removeSpinner()
                }
            }else{
                self.removeSpinner()
            }
        }
    }
}
