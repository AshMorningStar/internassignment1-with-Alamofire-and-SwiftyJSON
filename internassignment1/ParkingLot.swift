//
//  ParkingLot.swift
//  internassignment1
//
//  Created by Mohamad Asyraaf on 27/4/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import Foundation


class ParkingLot{
    private var _id: Int!
    private var _zone:String!
    private var _name: String!
    private var _capacity: Int!
    private var _rates: String!
    private var _publicHolidayRates: String!
    private var _dataProvider: String!
    
    var id:Int{
        return _id
    }
    
    var zone:String{
        return _zone
    }
    
    var name:String{
        
        return _name
    }
    
    var capacity:Int{
        return capacity
    }
    
    var rates:String{
        return _rates
    }
    
    var publicHolidayRates:String{
        return _publicHolidayRates
    }
    
    var dataProvider:String{
        return _dataProvider
    }
    
    
    
    
    init(id: Int,zone:String,name:String,address:String,capacity:Int,rates:String,publicHolidayRates:String,dataProvider:String){
        _id = id
        _zone = zone
        _name = name
        _capacity = capacity
        _rates = rates
        _publicHolidayRates = publicHolidayRates
        _dataProvider = dataProvider
        
    }
    
    
    
    
    
    
}