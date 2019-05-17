//
//  LineChartView+Utils.swift
//  Orchestrator
//
//  Created by Joe Lasher on 3/7/19.
//  Copyright © 2019 UiPath. All rights reserved.
//

import Foundation
import Charts

/**
 * Utility methods for Chart's LineChartView
 */
extension LineChartView {
    
    /// Format the provided value for the y(left)-axis.
    ///
    /// - Parameters:
    ///   - value: The provided value
    /// - Returns: The formatted value as a string
    func yAxisFormattedValue(_ value: Double) -> String {
        return value.asNumber.asSingleDigitDecimalNumber
    }
    
    /// Enforces a set label count for the y(left)-axis based on the provided maxCount
    ///
    /// - Parameters:
    ///   - range: The range of values in the y(left)-Axis
    func enforceLabelCount(range: Int) {
        let count = range + 2 // add one for space above and one for below the graph
        
        if count <= 6 {
            self.leftAxis.labelCount = count
            self.leftAxis.forceLabelsEnabled = true
        } else {
            self.leftAxis.labelCount = 6
            self.leftAxis.forceLabelsEnabled = false
        }
    }
    
    /// Sets the graphs min and max y(left)-axis values
    ///
    /// - Parameters:
    ///   - minCount: The min y(left)-Axis count of the graph
    ///   - maxCount: The max y(left)-Axis count of the graph
    func setChartYMinMax(minCount: Int, maxCount: Int) {
        // minimum
        let minCount = max(0, minCount)
        self.leftAxis.axisMinimum = Double(minCount)
            
        // maximum
        let maxCount = max(1, maxCount + 1)
        self.leftAxis.axisMaximum = Double(maxCount)
    }
}
