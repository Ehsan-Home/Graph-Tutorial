//
//  ViewController.swift
//  Graph-Tutorial
//
//  Created by Ehsan Ghasaei on 2022-02-16.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var lineChart = LineChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        lineChart.center = view.center
        
        view.addSubview(lineChart)
        
        var temperatures = [ChartDataEntry]()
        var humidity = [ChartDataEntry]()
        
        for x in 0..<50 {
            temperatures.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        for x in 0...20 {
            humidity.append(ChartDataEntry(x: Double(x + 10), y: Double(x)))
        }
        
        let set = LineChartDataSet(entries: temperatures, label: "Temperature")
        set.setColor(.systemRed)
        set.drawCirclesEnabled = false
        set.lineWidth = 3
//        set.colors = ChartColorTemplates.material()
//        set.colors = ChartColorTemplates.
        
        let set2 = LineChartDataSet(entries: humidity, label: "Humidity")
        set2.setColor(.systemBlue)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 3
        
        let data = LineChartData(dataSets: [set,set2])
        
        lineChart.data = data
        
    }


}

