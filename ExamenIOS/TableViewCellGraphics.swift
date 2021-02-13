//
//  TableViewCellGraphics.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit
import Charts

class TableViewCellGraphics: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pieChart: PieChartView!
    
    var values: [Int] = []
    var texts: [String] = []
    var hex: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setInfo(chartData: [ChartData], title: String, hexC: [String]) {
        for i in chartData {
            values.append(i.percetnage)
            texts.append(i.text)
        }
        
        titleLabel.text = title
        hex = hexC
        customizeChart(dataPoints: texts, values: values)
    }
    
    func customizeChart(dataPoints: [String], values: [Int]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: Double(values[i]), label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        if hex.count > 0 {
            pieChartDataSet.colors = colorsOFChart(hexColors: hex)
        }
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        pieChart.data = pieChartData
    }
    
    private func colorsOFChart(hexColors: [String]) -> [UIColor] {
        var colors: [UIColor] = []
        for i in hexColors {
            let color = UIColor(hex: i) ?? UIColor.red
            colors.append(color)
        }
        return colors
    }

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    
                    self.init(red:r, green: g, blue:b, alpha: 1.0)
                    return
                }
            }
        }
        return nil
    }
}
