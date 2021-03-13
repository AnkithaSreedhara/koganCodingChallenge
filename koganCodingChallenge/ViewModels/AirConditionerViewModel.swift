//
//  AirConditionerViewModel.swift
//  koganCodingChallenge
//
//  Created by Anki on 12/03/21.
//

import Foundation
class AirConditionerViewModel: NSObject{
    
    private var apiService : APIService!
    private(set) var averageCubitWeight : Double! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    private var numberOfACs : Int = 0
    private var totalCubicWeight : Double = 0.0
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetProducts(path: Strings.initialPath)
    }
    func callFuncToGetProducts(path : String){
        self.apiService.apiToGetProducts(path: path) { (products) in
            if let objects = products.objects{
                for object in objects{
                    if object.category == Strings.airConditioners{
                        self.numberOfACs += 1
                        self.totalCubicWeight += self.getCubicWeightOf(object: object)
                    }
                }
            }
            if products.next != nil{
                self.callFuncToGetProducts(path: products.next!)
            }
        }
        self.averageCubitWeight = (self.totalCubicWeight/Double(self.numberOfACs))
    }
    func getCubicWeightOf(object : Object) -> Double{
        if let width = object.size?.width, let length = object.size?.length , let height = object.size?.height {
            return 250 * width / 100 * length / 100 * height / 100 * 1000
        }else{
            return 0
        }
    }
}
