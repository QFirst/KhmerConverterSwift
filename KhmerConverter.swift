//
//  KhmerDate.swift
//  KhmerDate
//
//  Created by Rat Mengheang on 9/28/16.
//  Copyright © 2016 QFirst. All rights reserved.
//

import Foundation

// convert to Khmer datetime
func conToKhmerDate(_ date:NSDate, isFull:Bool = false)->String{
    let format="EEE-MM-dd-YYYY"
    let dateFmt = DateFormatter()
    dateFmt.dateFormat = format
    let newreadableDate = dateFmt.string(from: date as Date)
    // split string
    let unit = newreadableDate.characters.split{$0 == "-"}.map(String.init)
    
    if isFull == false{
        
        // 28 មករា ២០១៦
        return "\(convertFullNumber(unit[2])) \(toKhMonth(unit[1])) \(convertFullNumber(unit[3]))"
    }else{
        
        // ថ្ងៃពុធ ២៨-កញ្ញា-២០១៦
        return "\(toKhDay(unit[0])) \(convertFullNumber(unit[2]))-\(toKhMonth(unit[1]))-\(convertFullNumber(unit[3]))"
    }
}

func toKhMonth(_ month:String)->String{
    switch month {
    case "01":
        return "មករា"
    case "02":
        return "កម្ភះ"
    case "03":
        return "មិនា"
    case "04":
        return "មេសា"
    case "05":
        return "ឧសភា"
    case "06":
        return "មិថុនា"
    case "07":
        return "កក្តដា"
    case "08":
        return "សីហា"
    case "09":
        return "កញ្ញា"
    case "10":
        return "តុលា"
    case "11":
        return "វិច្ខិកា"
    case "12":
        return "ធ្នូ"
    default:
        return ""
    }
}

func toKhDay(_ days:String)->String{
    let day = "ថ្ងៃ"
    switch days {
    case "Mon":
        return day+"ច៍ន្ទ"
    case "Tue":
        return day+"អង្គារ"
    case "Wed":
        return day+"ពុធ"
    case "Thu":
        return day+"ព្រហស្បតិ៍"
    case "Fri":
        return day+"សុក្រ"
    case "Sat":
        return day+"សៅរិ៍"
    case "Sun":
        return day+"អាទិត្យ"
    default:
        return ""
    }
}


// convert 1 charactor to khmer number
func toKhNum(Num:Character) -> String{
    switch Num {
    case "0":
        return "០"
    case "1":
        return "១"
    case "2":
        return "២"
    case "3":
        return "៣"
    case "4":
        return "៤"
    case "5":
        return "៥"
    case "6":
        return "៦"
    case "7":
        return "៧"
    case "8":
        return "៨"
    case "9":
        return "៩"
    default:
        return ""
    }
}

// convert multi number into khmer date
func convertFullNumber(_ Num:String)->String{
    var data = ""
    for index in Num.characters {
        data += toKhNum(Num: index)
    }
    return data
}

//------------------------------------------ end date ------------------------------------------------

