
// Traffic Light Program
/*
 Requirement: Able to switch light every 3 seconds
 */
import Foundation

enum TrafficLightColor: String, CaseIterable {
    case red = "STOP"
    case geen = "GO"
    case yellow = "SLOW DOWN"
}

class TrafficLight {
    let listOfLights = TrafficLightColor.allCases
    
    func doWorkTimer(_ interval: Int){
        
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
            self.showWork(runCount)
            runCount += 1
            if runCount == interval {
                timer.invalidate()
            }
        }
    }
    
    func doWorkAsyncAfter(_ interval: Int){
        for i in 1...interval {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(i * 3)) {
                self.showWork(i - 1)
            }
        }
    }
    
    func showWork(_ index: Int){
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        let second = Calendar.current.component(.second, from: date)
        
        let colorIndex = index % self.listOfLights.count
        print("\(hour):\(minute):\(second) ~ \(self.listOfLights[colorIndex].rawValue)")

    }
}

var testTrafficLight = TrafficLight()

testTrafficLight.doWorkTimer(5)
//testTrafficLight.doWorkAsyncAfter(5)
