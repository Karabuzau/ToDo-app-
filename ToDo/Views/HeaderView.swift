//
//  HeaderView.swift
//  ToDo
//
//  Created by Бекжан on 07.05.2023.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subTitle:String
    let angle:Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width*3,
               height: 350)
        .offset(y: -150)

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "To Do List",
                   subTitle: "Get things done",
                   angle: 15,
                   background: .blue)
    }
}
