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
    var temperatures:[ChartDataEntry] = [ChartDataEntry()]
    var humidity:[ChartDataEntry] = [ChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        lineChart.center = view.center
        
        view.addSubview(lineChart)
        
        setupTempEntry()
        setUpHumidEntry()
        
        let set = LineChartDataSet(entries: temperatures, label: "Temperature (C)")
        set.setColor(.systemRed)
        set.drawCirclesEnabled = false
        set.lineWidth = 3
        set.mode = .cubicBezier
//        set.colors = ChartColorTemplates.material()
//        set.colors = ChartColorTemplates.
        
        let set2 = LineChartDataSet(entries: humidity, label: "Humidity (%)")
        set2.setColor(.systemBlue)
        set2.drawCirclesEnabled = false
        set2.lineWidth = 3
        set2.mode = .cubicBezier
        
        let data = LineChartData(dataSets: [set,set2])
        data.setDrawValues(false)
        
        lineChart.xAxis.labelPosition = .bottom
        lineChart.data = data
        
    }
    
    func setupTempEntry(){
        for hour in 7...23 {
            for minute in 1...6 {
                let time = Double(hour) + (Double(minute) * 0.1)
                let temp = Double.random(in: 25...35)
                print("time", time , "temp", temp)
                temperatures.append(ChartDataEntry(x: time, y: temp))
            }
        }
    }
    
    func setUpHumidEntry() {
        for hour in 7...23 {
            for minute in 1...6 {
                let time = Double(hour) + (Double(minute) * 0.1)
                let temp = Double.random(in: 20...55)
                print("time", time , "temp", temp)
                humidity.append(ChartDataEntry(x: time, y: temp))
            }
        }
    }


}

