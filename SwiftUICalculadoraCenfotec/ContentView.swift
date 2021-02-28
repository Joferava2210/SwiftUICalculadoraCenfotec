//
//  ContentView.swift
//  SwiftUICalculadoraCenfotec
//
//  Created by Felipe Ramirez Vargas on 27/2/21.
//

import SwiftUI

struct ContentView: View {
    let numbers:[[designButtons]] = [
        [.ac, .plusminus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    var body: some View {
        ZStack(alignment:.bottom){
            Color.black.ignoresSafeArea()
            VStack(spacing: 16){
                HStack{
                    Spacer()
                    Text("0").foregroundColor(.white)
                        .font(.system(size: 100))
                }.padding()
                ForEach(numbers, id: \.self) { row in
                    HStack(spacing: 16){
                        ForEach(row, id: \.self) { area in
                            if area != .zero{
                                Text(area.title)
                                    .font(.system(size:42))
                                    .frame(width:90, height:90)
                                    .foregroundColor(.white)
                                    .background(area.backgroundColor)
                                    .cornerRadius(90)
                            } else {
                                Text(area.title)
                                    .font(.system(size:42))
                                    .frame(width:195, height:90)
                                    .foregroundColor(.white)
                                    .background(area.backgroundColor)
                                    .cornerRadius(180)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum designButtons: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, equals, plus, minus, multiply, divide, ac, plusminus, percent, decimal
    
    var title: String {
        switch self{
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "÷"
        case .plusminus: return "+-"
        case .percent: return "%"
        case .decimal: return "."
        case .equals: return "="
        default: return "AC"
        }
    }
    
    var backgroundColor: Color{
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusminus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}
